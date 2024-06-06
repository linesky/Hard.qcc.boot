printf "\x1bc\x1b[43;37mbuild....\n"
nasm -f elf32 hello.asm -o hello.o
ld hello.o -o hello
