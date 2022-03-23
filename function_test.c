#include <SDL.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#define SCREEN_WIDTH 759    //window height
#define SCREEN_HEIGHT 759  //window width

//surfaces
static SDL_Surface *screen;

SDL_Window* window = NULL;	//The window we'll be rendering to
SDL_Renderer *renderer;		//The renderer SDL will use to draw to the screen

//textures
SDL_Texture *screen_texture;

//initilise SDL
int init(int w, int h, int argc, char *args[]);

int main(int argc, char *argv[])
{
    // SDL Window setup
	if (init(SCREEN_WIDTH, SCREEN_HEIGHT, argc, argv) == 1) {
		
		return 0;
	}

    int quit = 0;

    SDL_RenderClear(renderer);

    FILE* ptr;
    char ch;

    // Opening file in reading mode
    ptr = fopen("binary.txt", "r");

    if (NULL == ptr) printf("file can't be opened \n");

    printf("content of this file are \n");

    int counter = 1;
    int line, column;
    do
    {
        ch = fgetc(ptr);
        
        SDL_Rect pixel;

        line = counter / 253;
        column = counter % 253;

        pixel.x = column * SCREEN_WIDTH / 253;
        pixel.y = line * SCREEN_HEIGHT / 253;
        pixel.w = SCREEN_WIDTH /253;
        pixel.h = SCREEN_HEIGHT /253;


        if (ch == '0')
        {
            int color = SDL_FillRect(screen, &pixel, SDL_MapRGB(screen->format, 0, 0, 0));
        }
        else
        {
            int color = SDL_FillRect(screen, &pixel, SDL_MapRGB(screen->format, 255, 255, 255));
        }
        
        counter ++;

    } while (counter < 63756);//ch == '1' || ch == '0' || ch == '\n');
    
    fclose(ptr);

    SDL_UpdateTexture(screen_texture, NULL, screen->pixels, screen->w * sizeof (Uint32));
    SDL_RenderCopy(renderer, screen_texture, NULL, NULL);

		//draw to the display
    SDL_RenderPresent(renderer);

    while (quit == 0)
    {
        SDL_PumpEvents();

        const Uint8 *keystate = SDL_GetKeyboardState(NULL);

        if (keystate[SDL_SCANCODE_ESCAPE]) quit = 1;
        SDL_Delay(200);

    }
    

    return 0;
}

int init(int width, int height, int argc, char *args[]) {

    //Initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) < 0) {

		printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
		
		return 1;
	} 

    int i;

    for (i = 0; i < argc; i++) {
		
		//Create window	
		if(strcmp(args[i], "-f")) {
			
			SDL_CreateWindowAndRenderer(SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN, &window, &renderer);
		
		} else {
		
			SDL_CreateWindowAndRenderer(SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_FULLSCREEN_DESKTOP, &window, &renderer);
		}
	}

    if (window == NULL) { 
		
		printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
		
		return 1;
	}

    //create the screen sruface where all the elements will be drawn onto (ball, paddles, net etc)
	screen = SDL_CreateRGBSurfaceWithFormat(0, width, height, 32, SDL_PIXELFORMAT_RGBA32);
	
	if (screen == NULL) {
		
		printf("Could not create the screen surfce! SDL_Error: %s\n", SDL_GetError());

		return 1;
	}

    //create the screen texture to render the screen surface to the actual display
	screen_texture = SDL_CreateTextureFromSurface(renderer, screen);

	if (screen_texture == NULL) {
		
		printf("Could not create the screen_texture! SDL_Error: %s\n", SDL_GetError());

		return 1;
	}
}