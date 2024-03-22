#include <iostream>
#include <fstream>
#include <windows.h>
#include <stdlib.h>

using namespace std;

HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);

const WORD green       = BACKGROUND_GREEN | FOREGROUND_INTENSITY;
const WORD brown      = BACKGROUND_RED    | FOREGROUND_INTENSITY;
const WORD black      = 0;
const WORD blue       = BACKGROUND_BLUE   | BACKGROUND_INTENSITY;
const WORD lightgreen = BACKGROUND_GREEN  | BACKGROUND_INTENSITY;

void TextBackground(WORD color)
{
    SetConsoleTextAttribute(h, color);
}

void ClrScr()
{
    TextBackground(black);
    system("cls");
}

void gotoxy( int col, int ln )
  {
  COORD coord;
  coord.X = col; coord.Y = ln;
  SetConsoleCursorPosition(h,coord);
  }


ifstream f1("copac1.txt");
ifstream f2("copac2.txt");
ifstream f3("copac3.txt");
ifstream f4("copac4.txt");

void create(ifstream &f)
{
    char c;
    while (!f.eof())
    {
        f>>c;
        if(c=='/') { TextBackground(black); cout<<endl; }
        else
            if(c=='m') { TextBackground(brown); cout<<" "; }
            else
                if(c=='v') { TextBackground(green); cout<<" "; }
                else
                    if(c=='0') { TextBackground(black); cout<<" "; }
                    else
                        if(c=='u') { TextBackground(lightgreen); cout<<" ";}
    }
    f.clear();
    f.seekg(0,ios::beg);
}

int main()
{
    while(true)
    {
    create(f1); gotoxy(1,1);
    create(f2); gotoxy(1,1);
    create(f3); gotoxy(1,1);
    create(f4); gotoxy(1,1);
    }
    return 0;
}
