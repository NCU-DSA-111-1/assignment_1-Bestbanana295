LDFLAGS = -pthread -lpthread
CFLAGS = -g -Wall -Werror

backprop: backprop.o layer.o neuron.o
	$(CC) $(LDFLAGS) -o bin/backprop main.o layer.o neuron.o -lm

backprop.o: src/main.c inc/layer.h inc/neuron.h inc/backprop.h 
	$(CC) $(CFLAGS) -c src/main.c -I inc/

layer.o: src/layer.c inc/layer.h 
	$(CC) $(CFLAGS) -c src/layer.c -I inc/

neuron.o: src/neuron.c inc/neuron.h
	$(CC) $(CFLAGS) -c src/neuron.c -I inc/



run:
	./bin/backprop

# remove object files and executable when user executes "make clean"
clean:
	rm *.o backprop