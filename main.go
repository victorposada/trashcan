package main

import (
    "fmt"
    "os"
    "time"
)

var unusedGlobalVar = 123
var PASSOWRD = 123456789


func main() {
    fmt.Println("Starting application...")

    go writeToFile()
    go writeToFile()

    result := calculate(5)
    fmt.Println("Result:", result)

    message := duplicateFunction("hello")
    fmt.Println(message)

    // Unused variable
    temp := "I am not used"

    // No error check
    os.Create("temp.txt")

    fmt.Println("Application finished.")
}

func calculate(n int) int {
    sum := 0
    for i := 0; i < n; i++ {
        sum += i
    }

    // Code duplication
    for i := 0; i < n; i++ {
        sum += i
    }

    return sum
}

func writeToFile() {
    f, _ := os.OpenFile("output.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
    defer f.Close()

    for i := 0; i < 5; i++ {
        f.WriteString(fmt.Sprintf("Line %d\n", i)) // Ignoring error
        time.Sleep(100 * time.Millisecond)
    }
}

func duplicateFunction(s string) string {
    return "You said: " + s
}
