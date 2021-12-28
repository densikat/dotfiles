#include <assert.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#define SCREEN_HEIGHT 480
#define SCREEN_WIDTH 640
#define COLUMNS

#define CURSOR_HEIGHT 20
#define CURSOR_WIDTH 10
#define FPS 60

typedef enum {
  CURSOR_FORWARD,
  CURSOR_BACKWARD

} cursor_mov_dir;

struct Cursor {
  int x_pos;
  int y_pos;
};

struct Editor {
  struct Cursor* cursor;
};

char* char_buf = NULL;;
int buf_pos = 0;

struct Editor *editor = NULL;

void init_editor(void);
void free_editor(void);
void draw_text(SDL_Renderer* renderer, TTF_Font* font);

SDL_Rect r;
// 1) Draw a cursor (rectangle)
// 2) Work out how to arrange screen so cursor can move
// 3) Make cursor move

void limit_frame_rate (uint32_t starting_tick) {
	if ((1000 / FPS) > SDL_GetTicks() - starting_tick ) {
	  SDL_Delay((1000 / FPS) - (SDL_GetTicks() - starting_tick));
	}
}

void move_cursor(cursor_mov_dir dir) {
  if (dir == CURSOR_BACKWARD) {
	if (editor->cursor->x_pos > 0) {
	  editor->cursor->x_pos -= CURSOR_WIDTH;
	}
  }

  if (dir == CURSOR_FORWARD) {
	editor->cursor->x_pos += CURSOR_WIDTH;
  }
}

void draw_text(SDL_Renderer* renderer, TTF_Font* font) {
  int xx_pos = 0;
  SDL_Color color = { 0, 0, 0, 255 };
  SDL_Surface* surface;
  SDL_Texture* texture;
  for (int i = 0; i < buf_pos; i++) {
    int texW = 0;
    int texH = 0;
    surface = TTF_RenderText_Blended(font, &char_buf[i], color);
    texture = SDL_CreateTextureFromSurface(renderer, surface);
    SDL_QueryTexture(texture, NULL, NULL, &texW, &texH);
    SDL_Rect dstrect = { xx_pos, 100, texW, texH };
    SDL_RenderCopy(renderer, texture, NULL, &dstrect);
    xx_pos += 50;
  }
  SDL_RenderPresent(renderer);
  SDL_FreeSurface(surface);
  SDL_DestroyTexture(texture);
}

void draw_cursor(SDL_Renderer* renderer,int x, int y) {
  SDL_RenderClear(renderer);
  r.x = x;
  r.y = y;
  r.w = CURSOR_WIDTH;
  r.h = CURSOR_HEIGHT;

  SDL_SetRenderDrawColor(renderer, 0,0,0,255);

  SDL_RenderFillRect(renderer, &r);
  SDL_RenderPresent(renderer);
}

void draw_screen(SDL_Renderer* renderer) {
  SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
  SDL_RenderClear(renderer);
}

void init_editor(void) {
  editor = malloc(sizeof(struct Editor*));
  struct Cursor* cursor = malloc(sizeof(struct Cursor*));
  editor->cursor = cursor;
  cursor->x_pos = 0;
  cursor->y_pos = 0;
}

void free_editor(void) {
  free(editor->cursor);
  free(editor);
}

int main(void) {
  SDL_Window* window = NULL;
  SDL_Renderer* renderer = NULL;
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
	fprintf(stderr, "could not init SDL2: %s\n", SDL_GetError());
	return 1;
  }
  atexit(SDL_Quit);

  char_buf = malloc(sizeof(char) * 1024);
  memset(char_buf, 0, sizeof(sizeof(char) * 1024));
  assert (char_buf != NULL);
  int res;
  res = SDL_CreateWindowAndRenderer(
	  SCREEN_WIDTH, SCREEN_HEIGHT,
	  SDL_WINDOW_SHOWN, &window, &renderer
	  );

  if (res != 0) {
	fprintf(stderr, "could not create window: %s\n", SDL_GetError());
	return 1;
  }
  
  int x,y;

  init_editor();
  assert(editor != NULL);

  TTF_Init();
  TTF_Font* font = TTF_OpenFont("FiraCode-Regular.ttf", 14);

  draw_screen(renderer);
  draw_cursor(renderer, editor->cursor->x_pos, editor->cursor->y_pos);

  // A basic main loop to prevent blocking
  uint32_t starting_tick;
  SDL_Event event;

  bool is_running = true;

  while (is_running) {
	starting_tick = SDL_GetTicks();

	draw_screen(renderer);
    draw_cursor(renderer, editor->cursor->x_pos, editor->cursor->y_pos);
    draw_text(renderer, font);
	while (SDL_PollEvent(&event)) {
		if (event.type == SDL_QUIT) {
			is_running = false;
		}

		if (event.type == SDL_KEYDOWN) {
			if (event.key.keysym.sym == SDLK_BACKSPACE) {
			  move_cursor(CURSOR_BACKWARD);
			} else {
			  move_cursor(CURSOR_FORWARD);
			}
            if (event.key.keysym.sym == SDLK_a) {
              char_buf[buf_pos] = 'A';
              buf_pos++;
            }

			SDL_GetWindowPosition(window, &x, &y);
            printf("Buf position is: %d\n", buf_pos);
			printf("Window position is x: %d, y: %d\n", x, y);
		}
	}

	limit_frame_rate(starting_tick);

  }
  TTF_CloseFont(font);
  TTF_Quit();
  SDL_DestroyWindow(window);
  free_editor();
  free(char_buf);
  return 0;
}
