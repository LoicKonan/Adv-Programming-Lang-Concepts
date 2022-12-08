using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Linq;

namespace Cipher_GUI
{
    public partial class Form1 : Form
    {

        public string ciphertext;
        public string plaintext;
        public string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        public int a;
        public int b;


        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            a = Int32.Parse(textBox1.Text);
            b = Int32.Parse(textBox2.Text);
            plaintext = textBox3.Text;
            plaintext = plaintext.ToUpper();
            ciphertext = " ";

            foreach (char letter in plaintext)
            {
                int xval = (int)letter - 65;

                if (xval >= 0)
                {
                    int fofx = (a * xval + b) % 26;
                    ciphertext += alphabet[fofx];
                }
                else
                {
                    ciphertext += " ";
                }
            }

            textBox4.Text = ciphertext;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            // Affine cipher A value

        }

        private void button2_Click(object sender, EventArgs e)

        {

            b = Int32.Parse(textBox5.Text);
            plaintext = textBox3.Text;
            plaintext = plaintext.ToUpper();
            ciphertext = " ";

            foreach (char letter in plaintext)
            {
                int xval = (int)letter - 65;

                if (xval >= 0)
                {
                    int fofx = (xval + b) % 26;
                    ciphertext += alphabet[fofx];
                }
                else
                {
                    ciphertext += " ";
                }
            }

            textBox4.Text = ciphertext;
        }





        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            // Affine Ciper B value
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            // Shift Cipher value B sent to affine
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            // Plaintext entered
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            // Ciphertext entered

        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox3.Text = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ";

        }

        private void button4_Click(object sender, EventArgs e)
        {
            //ADFGVX stuff
            string plaintext = "";
            plaintext = textBox3.Text;
            plaintext = plaintext.ToUpper();
            string ciphertext = "";
            string Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";   // A-Z and 0-9
            string key1 = "";
            key1 = textBox6.Text;
            key1 = key1.ToUpper();
            string key2 = "";
            key2 = textBox7.Text;
            key2 = key2.ToUpper();
            key2 = new string(key2.ToCharArray().Distinct().ToArray());
            string polybiusstring = "";
            string tempcipherstring = "";
            char[,] PolybiusSquare = new char[7, 7];
            string header = "ADFGVX";
            Dictionary<char, string> ADFGVX_Lookup = new Dictionary<char, string>();
            Dictionary<char, int> Column_Lookup = new Dictionary<char, int>();
            List<string> CT = new List<string>();

            PolybiusSquare[0, 0] = ' ';

            for (int i = 1; i < 7; i++)
            {
                PolybiusSquare[0, i] = header[i - 1];
                PolybiusSquare[i, 0] = header[i - 1];
            }

            // Looping through key1
            for (int i = 0; i < key1.Length; i++)
            {

                // If length is zero, concatenate key to polybius string
                if (polybiusstring.Length == 0)
                {
                    polybiusstring += key1[i];
                }

                // If polybius string is not empty, we need to check if the letter
                // of the key is in the polybius string before we concatenate it
                else
                {
                    Boolean found = false;

                    // Loop through the string, if it's found, update bool and break early
                    for (int j = 0; j < polybiusstring.Length; j++)
                    {
                        if (polybiusstring[j] == key1[i])
                        {
                            found = true;
                            break;
                        }
                    }

                    // If the letter wasn't found, concatenate it to polybius string
                    if (!found)
                    {
                        polybiusstring += key1[i];
                    }
                }
            }

            for (int i = 0; i < Alphabet.Length; i++)
            {

                Boolean found = false;

                for (int j = 0; j < polybiusstring.Length; j++)
                {
                    if (polybiusstring[j] == Alphabet[i])
                    {
                        found = true;
                        break;
                    }
                }

                if (!found)
                {
                    polybiusstring += Alphabet[i];
                }
            }

            // Building the Polybius Square with the string
            int x = 0;
            int y = 0;

            foreach (char letter in polybiusstring)
            {

                if (y > 5)
                {
                    y = 0;
                    x++;
                }

                PolybiusSquare[x + 1, y + 1] = letter;
                y++;
            }

            for (int i1 = 1; i1 < 7; i1++)
            {
                for (int i2 = 1; i2 < 7; i2++)
                {

                    string t = PolybiusSquare[i1, 0].ToString() + PolybiusSquare[0, i2].ToString();

                    // Insert into Dictionary
                    ADFGVX_Lookup.Add(PolybiusSquare[i1, i2], t);
                }
            }


            foreach (char letter in plaintext)
            {

                if (letter != ' ')
                {
                    dynamic fetch = ADFGVX_Lookup[letter];
                    tempcipherstring += fetch;
                }
            }

            string temp = "";
            foreach (char letter in tempcipherstring)
            {
                if (temp.Length < key2.Length)
                {
                    temp += letter;
                }

                else
                {
                    CT.Add(temp);
                    temp = "";
                    temp += letter;
                }
            }

            while (temp.Length < key2.Length)
            {
                temp += ' ';
            }

            CT.Add(temp);



            Dictionary<char, int> KW2 = new Dictionary<char, int>();

            dynamic sortedString = "";
            char[] characters = key2.ToCharArray();
            Array.Sort(characters);
            sortedString = new string(characters);

            for (int i = 0; i < key2.Length; i++)
            {
                KW2.Add(key2[i], i);
            }

            for (int i = 0; i < sortedString.Length; i++)
            {

                foreach (string word in CT)
                {

                    dynamic index = sortedString[i];
                    dynamic fetch = KW2[index];

                    if (word[fetch] != ' ')
                    {
                        ciphertext += word[fetch];
                    }
                }
            }

            textBox4.Text = ciphertext;

            //************************************************************************************
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            textBox9.Visible = checkBox2.Checked;
        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            textBox8.Visible = checkBox1.Checked;
        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox10_TextChanged(object sender, EventArgs e)
        {

        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            textBox10.Visible = checkBox3.Checked;
        }

    }
}
