CC := gcc
CFLAGS := -Wall -Wextra

TARGET := writer

# Default target
all: $(TARGET)

# Cross-compilation target
ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
CC := $(CROSS_COMPILE)gcc
endif

# Source files
SRCS := writer.c

# Object files
OBJS := $(SRCS:.c=.o)

# Build target
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)

