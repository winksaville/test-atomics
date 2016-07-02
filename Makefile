.SUFFIXES:

NAME=test-atomics
C=gcc

${NAME} : ${NAME}.c
	${C} -Wall -Wpedantic -std=c11 -O2 -g -pthread $< -o $@
	objdump -d $@ > $@.txt

run : ${NAME}
	@./${NAME} ${client_count} ${loops}

clean :
	@rm -f ${NAME}
