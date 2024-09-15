import unittest
from calc import aec_subtract


class TestSubtract(unittest.TestCase):

    def test_subtract(self):
        arg_ints = [20, 5]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 15)
    
    def test_negative_result(self):
        arg_ints = [5, 20]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 0)
    
    def test_raise_exception(self):
        arg_ints = [5, 20, 3]
        # sub_result = aec_subtract(arg_ints)
        self.assertRaises(Exception, lambda: aec_subtract(arg_ints))

if __name__ == "__main__":
    unittest.main()