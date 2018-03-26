using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using inir_ch4;
using System.Text.RegularExpressions;

namespace inir_ch4_control
{
    class Program
    {
        static void Main (string[] args)
        {
            string data = "[J0x000000060x000000000x000F42400x000F42500x00030FA6]";
            string pattern = @"0x[\dA-F]{8}";
            var numbers = Regex.Matches (data, pattern);
            foreach (var number in numbers)
            {

            }
            var tt = numbers;
        }
    }
}
