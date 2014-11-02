package litt.main.test;

import junit.framework.TestSuite;
import junit.framework.Test; 
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
// 新加的测试类全部放在下边
@Suite.SuiteClasses({MainTest.class}) 
public class AllLittTest {
	 public static Test suite() { 
		 TestSuite suite = new TestSuite();
	     return suite;
	 }
}
