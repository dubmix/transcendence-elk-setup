#include <iostream>
#include <fstream>
#include <ctime>
#include <unistd.h>

void logMessage(std::string message)
{
    std::ofstream logFile("log.log", std::ios::app);
    if(logFile.is_open())
    {
        std::time_t currentTime = std::time(NULL);
        currentTime -= 3600;
        char timestamp[20];

        std::strftime(timestamp, sizeof(timestamp), "%Y-%m-%dT%H:%M:%S", std::localtime(&currentTime));
        logFile << "[WARN] [" << timestamp << "] [log.log] " << message << std::endl;
        logFile.close();
    }
    else
    {
        std::cout << "error" << std::endl;
    }

    std::ofstream logFile2("log2.log", std::ios::app);
    if(logFile2.is_open())
    {
        std::time_t currentTime = std::time(NULL);
        currentTime -= 3600;
        char timestamp[20];

        std::strftime(timestamp, sizeof(timestamp), "%Y-%m-%dT%H:%M:%S", std::localtime(&currentTime));
        logFile2 << "[log2.log] [" << timestamp << "] [INFO] " << message << std::endl;
        logFile2.close();
    }
    else
    {
        std::cout << "error" << std::endl;
    }
}
int main()
{
    while(true)
    {
    	logMessage("hello");
    	logMessage("processing");
    	logMessage("done");
    	logMessage("");
    	sleep(1);
    }
    return 0;
}
