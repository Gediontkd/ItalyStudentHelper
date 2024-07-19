import org.junit.Assert.assertEquals
import org.junit.Test

class CalculatorTest {

    @Test
    fun addition_isCorrect() {
        val calculator = Calculator()
        assertEquals(4, calculator.add(2, 2))
    }
}