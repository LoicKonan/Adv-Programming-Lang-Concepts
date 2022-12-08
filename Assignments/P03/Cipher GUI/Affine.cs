/*
    Name: Byron Dowling, Pat Mitchell, Loic Konan
    Program: Affine Cipher

*/

using System;

class Program 
{
  public class Affine
  {
    private int A;
    private int B;
    private string plaintext;
    private string ciphertext;
    private string Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public Affine(int a, int b, string pt) {
        A = a;
        B = b;
        plaintext = pt.ToUpper();   // Uppercasing Text so it matches the Alphabet string
    }

    public string getAlphabet()
    {
      return Alphabet;
    }

    public string getCiphertext() {
      return ciphertext;
    }

    /*
        Formula:

          f(x) = aX + b % 26

            where x is the letter index of the letter being encrypted
            a = 0, b = 1, c = 2 ... y = 24, z = 25
    */
    public void encryptMessage() {

      Console.WriteLine(this.plaintext);

      foreach(char letter in this.plaintext) {

        int xVal = (int)letter - 65;  // Deriving alphabet index number

        /*
            We check if greater than 0 since space is ASCII 32 and - 65 will
            result in a negative index. This check allows us to preserve spaces.
        */
        if (xVal >= 0) {

          int FofX = (this.A * xVal + this.B) % 26;
          
          this.ciphertext += this.Alphabet[FofX];
        }

        else {
          this.ciphertext += " ";
        }
      }
    }
  }

  public static void Main (string[] args) 
  {
    Affine C1 = new Affine(3, 17, "Oh Reginald I disagree");

    string a = C1.getAlphabet();

    C1.encryptMessage();
    Console.WriteLine(C1.getCiphertext());
  }
}