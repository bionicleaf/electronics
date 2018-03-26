using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;

namespace inir_ch4
{
    public class IInir_ch4
    {
        public class Command
        {
            public delegate void ParseResponse (string reponse);

            public string Name { get; }
            public string Code { get; }
            public ParseResponse ParseFunction { get; }

            public Command (string name, string code, ParseResponse parsefunction)
            {
                Name = name;
                Code = code;
                ParseFunction = parsefunction;
            }
        }

        static void ParseStandardResponse (string response)
        {
        }

        static void ParseConfigurationResponse (string response)
        {
        }

        Command[] Commands = new Command[]
        {
            new Command( "ModeNormal", "[A]", ParseStandardResponse ),
            new Command( "ModeEngineering", "[B]", ParseStandardResponse ),
            new Command( "ModeConfiguration", "[C]", ParseStandardResponse ),
            new Command( "CalibrateZero", "[E]", ParseStandardResponse ),
            new Command( "CalibrateSpan", "[F]", ParseStandardResponse ),
            new Command( "CalibrateOffset", "[F]", ParseStandardResponse ),
            new Command( "CalibrateOffset", "[F]", ParseStandardResponse ),
            new Command( "ReadConfiguration", "[I]", ParseConfigurationResponse ),
            new Command( "LoadConfiguration", "[J]", ParseConfigurationResponse ),
            new Command( "SetOneConfiguration", "[N]", ParseStandardResponse ),
            new Command( "ResetConfiguration", "[K]", ParseStandardResponse ),
            new Command( "HumidityOn", "[L]", ParseStandardResponse ),
            new Command( "HumidityOff", "[M]", ParseStandardResponse ),
            new Command( "HumidityOff", "[M]", ParseStandardResponse ),
        };

        public class CalibrationData
        {
            public const int numberSetableParams = 24;
            public const int numberCalParams = numberSetableParams + 11;

            [StructLayout (LayoutKind.Explicit)]
            public class CalData
            {
                [FieldOffset (0)]
                public UInt32[] access;
                [FieldOffset (0)]
                public UInt32 sensor_type;
                [FieldOffset (4)]
                public UInt32 gas_type;
                [FieldOffset (8)]
                public UInt32 conc_range;
                [FieldOffset (12)]
                public Single high_span_gas_conc;
                [FieldOffset (16)]
                public Single low_span_gas_conc;
                [FieldOffset (20)]
                public Single a_coeff_low_range;
                [FieldOffset (24)]
                public Single a_coeff_mid_range;
                [FieldOffset (28)]
                public Single a_coeff_high_range;
                [FieldOffset (32)]
                public Single n_coeff_low_conc;
                [FieldOffset (36)]
                public Single n_coeff_mid_conc;
                [FieldOffset (40)]
                public Single n_coeff_high_conc;
                [FieldOffset (44)]
                public Single betaneg_coeff_low_range;
                [FieldOffset (48)]
                public Single betaneg_coeff_mid_range;
                [FieldOffset (52)]
                public Single betaneg_coeff_high_range;
                [FieldOffset (56)]
                public Single betapos_coeff_low_range;
                [FieldOffset (60)]
                public Single betapos_coeff_mid_range;
                [FieldOffset (64)]
                public Single betapos_coeff_high_range;
                [FieldOffset (68)]
                public Single alphaneg_coeff;
                [FieldOffset (72)]
                public Single alphapos_coeff;
                [FieldOffset (76)]
                public UInt32 averaging;
                [FieldOffset (80)]
                public UInt32 baud_rate;
                [FieldOffset (84)]
                public UInt32 current_conc_range;
                [FieldOffset (88)]
                public UInt32 customer_calibration_time;
                [FieldOffset (92)]
                public UInt32 customer_calibration_date;
                [FieldOffset (96)]
                public UInt32 serial_number;
                [FieldOffset (100)]
                public UInt32 time_delay_ms;
                [FieldOffset (104)]
                public UInt32 firmware_version;
                [FieldOffset (108)]
                public Single Act_1s_Average_Calibrate;
                [FieldOffset (112)]
                public Single Ref_1s_Average_Calibrate;
                [FieldOffset (116)]
                public Single zero;
                [FieldOffset (120)]
                public Single span;
                [FieldOffset (124)]
                public Single offset;
                [FieldOffset (128)]
                public UInt32 calibration_temperature;

                // these may not be downloaded
                [FieldOffset (132)]
                public UInt32 val_crc;
                [FieldOffset (136)]
                public UInt32 inv_crc;

                public CalData ()
                {
                    access = new UInt32[33];
                    sensor_type = 0;
                    gas_type = 0;
                    conc_range = 0;
                    high_span_gas_conc = 0;
                    low_span_gas_conc = 0;
                    a_coeff_low_range = 0;
                    a_coeff_mid_range = 0;
                    a_coeff_high_range = 0;
                    n_coeff_low_conc = 0;
                    n_coeff_mid_conc = 0;
                    n_coeff_high_conc = 0;
                    betaneg_coeff_low_range = 0;
                    betaneg_coeff_mid_range = 0;
                    betaneg_coeff_high_range = 0;
                    betapos_coeff_low_range = 0;
                    betapos_coeff_mid_range = 0;
                    betapos_coeff_high_range = 0;
                    alphaneg_coeff = 0;
                    alphapos_coeff = 0;
                    averaging = 0;
                    baud_rate = 0;
                    current_conc_range = 0;
                    customer_calibration_time = 0;
                    customer_calibration_date = 0;
                    serial_number = 0;
                    time_delay_ms = 0;
                    firmware_version = 0;
                    Act_1s_Average_Calibrate = 0;
                    Ref_1s_Average_Calibrate = 0;
                    zero = 0;
                    span = 0;
                    offset = 0;
                    calibration_temperature = 0;
                }

                public string ToSettingsString ()
                {
                    string ret = "[J";
                    int idx = 0;
                    foreach (UInt32 value in this.access)
                    {
                        if (idx > numberSetableParams-1)
                            break;
                        ret += value.ToString ("X");
                        idx++;
                    }
                    return ret + "]";
                }
            }

            static CalData FromCalibrationDataString (string data)
            {
                CalData calData = new CalData ();
                MatchCollection numbers = Regex.Matches (data, @"0x[\dA-F]{8}");

                if (numbers.Count > numberCalParams)
                    throw new ArgumentException ("Too many values for calibration data table");
                if (numbers.Count < numberCalParams)
                    throw new ArgumentException ("Not enough data to fill calibration data table");

                foreach (Match number in numbers)
                {
                    calData.access[number.Index] = UInt32.Parse (number.Value, System.Globalization.NumberStyles.HexNumber);
                }

                return calData;
            }

        }
    }
}
