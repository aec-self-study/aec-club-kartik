import unittest
from calc import aec_divide


class TestDivide(unittest.TestCase):

    def test_divide(self):
        arg_ints = [20, 5]
        div_result = aec_divide(arg_ints)
        self.assertEqual(div_result, 4)
    
    def test_divide_zero(self):
        arg_ints = [20, 0]
        div_result = aec_divide(arg_ints)
        self.assertEqual(div_result, 0)

if __name__ == "__main__":
    unittest.main()