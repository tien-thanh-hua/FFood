package Test;

import java.util.ArrayList;
import java.util.List;

public class StaticCodeAnalysisDemo {

    // Warning: Unused variable
    private int unusedVariable;

    // Error: Missing return statement
    public int missingReturnStatement(int x) {
        if (x > 0) {
            return x;
        }
        // Missing return statement here
    }

    // Error: Division by zero
    public int divideByZero(int numerator, int denominator) {
        return numerator / denominator; // Possible division by zero
    }

    // Warning: Unused method parameter
    public void unusedParameter(String param1, int param2) {
        System.out.println(param1);
    }

    // Error: Potential null pointer dereference
    public void nullPointerDereference(String str) {
        System.out.println(str.length()); // str may be null
    }

    // Error: Index out of bounds
    public void indexOutOfBounds() {
        List<Integer> numbers = new ArrayList<>();
        numbers.add(1);
        int value = numbers.get(1); // Index out of bounds
    }

    // Error: Infinite loop
    public void infiniteLoop() {
        while (true) {
            // Infinite loop
        }
    }

    public static void main(String[] args) {
        StaticCodeAnalysisDemo demo = new StaticCodeAnalysisDemo();
        demo.unusedVariable = 10;

        int result = demo.missingReturnStatement(5);
        System.out.println("Result: " + result);

        int divisionResult = demo.divideByZero(10, 0);
        System.out.println("Division Result: " + divisionResult);

        demo.unusedParameter("Hello", 42);

        demo.nullPointerDereference(null);

        demo.indexOutOfBounds();

        demo.infiniteLoop();
    }
}
