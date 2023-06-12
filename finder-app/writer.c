#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check if the required parameters are specified
    if (argc != 3) {
        printf("Error: Missing parameters.\n");
        exit(1);
    }

    // Get the file path and text string from arguments
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Write syslog message
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    // Create the directory path if it doesn't exist (Assuming the directory is already created)
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Failed to create the file.");
        closelog();
        exit(1);
    }

    // Write the content to the file
    fprintf(file, "%s", writestr);
    fclose(file);

    // Print success message
    printf("File created: %s\n", writefile);
    printf("Content:\n%s\n", writestr);

    closelog();
    return 0;
}

