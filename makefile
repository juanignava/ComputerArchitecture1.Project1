make:
	nasm -f elf text_generator.asm
	ld -m elf_i386 text_generator.o -o text_generator
	cc function_test.c `sdl2-config --cflags --libs` -o function_test -lpthread

run:
	./text_generator
	./function_test