#include <graphics.h>
#include <math.h>
#include <iostream>

using namespace std;

void Init()
{
    initwindow(800,600,"Copac");
}

const int o00 = 0; //-,-
const int o10 = 1; //+,-
const int o01 = 2; //-,+
const int o11 = 3; //+,+

struct coordinates
{
    int x,y;
};

coordinates setcoord(int x,int y)
{
    coordinates result;
    result.x=x;
    result.y=y;
    return result;
}

#define PI 3.14159265

coordinates angle(coordinates pos,int l,int u,int o)
{
    int v1,v2;
    coordinates result;
    v1=trunc(l*cos(u*PI/180));
    v2=trunc(l*sin(u*PI/180));
    switch(o)
    {
        case o00: result=setcoord(pos.x-v1,pos.y-v2);
        case o01: result=setcoord(pos.x-v1,pos.y+v2);
        case o10: result=setcoord(pos.x+v1,pos.y-v2);
        case o11: result=setcoord(pos.x+v1,pos.y+v2);
    }
    line(pos.x,pos.y,result.x,result.y);
    cout<<"angle"<<pos.x<<" "<<pos.y<<">>"<<result.x<<" "<<result.y<<endl;
    return result;
}


struct brench
{
    coordinates nod;
    brench *b1,*b2;
};
typedef brench* pbrench;

void Draw(pbrench b,int u,int l)
{
    pbrench b11= new brench;
    b11=b->b1;
    pbrench b12= new brench;
    b12=b->b2;
    l=2*l/3;
    b11->nod=angle(b->nod,l,90-u,o00);
    b12->nod=angle(b->nod,l,90-u,o10);
    pbrench aux=b;
    int l1=l;
    if(l>0)
    {
        b=b->b1;
        Draw(b,u,l);
        aux=aux->b2;
        Draw(aux,u,l1);
    }
}

brench b;

void tree(int x, int y, int l)
{
    //b.nod=
    angle(setcoord(x,y),l,90,o00);
    Draw(&b,60,l);
}

int main()
{
    Init();
    tree(400,600,200);
    angle(setcoord(400,600),200,90,o00);
    getch();
    return 0;
}
