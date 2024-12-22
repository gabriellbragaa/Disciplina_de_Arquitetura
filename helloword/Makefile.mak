# Nome do arquivo de código fonte
SRC = hello.asm

# Nome do arquivo objeto
OBJ = hello.o

# Nome do arquivo executável
EXEC = hello

# Ferramentas de montagem e linkagem
ASM = nasm
LD = ld

# Flags para montagem e linkagem
ASM_FLAGS = -f elf32
LD_FLAGS = -m elf_i386

# Regras para construir o programa
all: $(EXEC)

$(EXEC): $(OBJ)
	$(LD) $(LD_FLAGS) -o $@ $(OBJ)

$(OBJ): $(SRC)
	$(ASM) $(ASM_FLAGS) -o $@ $(SRC)

clean:
	rm -f $(OBJ) $(EXEC)
