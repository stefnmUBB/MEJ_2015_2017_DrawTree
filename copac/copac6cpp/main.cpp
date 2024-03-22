#include <iostream>
#include <graphics.h>
#include <math.h>

#define PI 3.1415926

using namespace std;

void Init()
{
    initwindow(980,760,"Copac",100,100,false,false);
}

struct coordinates
{
    int x,y,u;
};
coordinates setcoord(int x, int y)
{
    coordinates result;
    result.x=x;
    result.y=y;
    return result;
}

coordinates angle(coordinates pos,
                  int l, int u,
                  bool show)
{
    coordinates result=setcoord(pos.x-trunc(l*cos(PI*u/180)),
                                pos.y-trunc(l*sin(PI*u/180)));
    result.u=u;
    if(show) line(pos.x,pos.y,
                  result.x, result.y);
    return result;
}

int f(int x)
{
    return 3*x/5;
}

void build1(coordinates pos, int l, int u)
{
    l=f(l);
    coordinates p1=angle(pos,l,-u+pos.u,true),
                p2=angle(pos,l, u+pos.u,true);
    if(l>1)
    {
        build1(p1,l,u);
        build1(p2,l,u);
    }
}

void build2(coordinates pos,int l, int u, int n)
{
    coordinates p1, aux;
    int i=0;
    if(l>1)
    {
        for(i=1;i<=n;i++)
        {
            aux=angle(pos,l/(2*(i%2+1)),pos.u,true);
            if (i%2==0)
            {
                l=f(l);
                u=-u;

            }
            p1=angle(aux,f(l),u+aux.u,true);
            build2(p1,f(l),u,n);
        }
    }
}

void build3(coordinates pos,int l, int u, int n)
{
    coordinates p1, aux;
    int i=0;
    if(l>1)
    {
        for(i=1;i<=n;i++)
        {
            aux=angle(pos,l/((i%2+1))-l,pos.u,true);
            if (3*i%5==0)
            {
                l=f(l);
                u=-u;

            }
            p1=angle(aux,f(l),u+aux.u,true);
            build3(p1,f(l),u,n);
        }
    }
}

void build4(coordinates pos,int l, int u, int n)
{
    coordinates p1, p2, aux;
    int i=0;
    if(l>1)
    {
        for(i=1;i<=n;i++)
        {
            aux=angle(pos,l/((i%2+1))-l,pos.u,true);
            if ((3*i%5==0))
            {
                l=f(l);
                u=-u;

            }
            p1=angle(aux,f(l),-u+aux.u,true);
            p2=angle(aux,f(l),u+aux.u,true);
            build4(p1,f(l),u,n);
            build4(p2,f(l),u,n);
        }
    }
}

int main()
{
    int l,u,n;
    cout<<"l=";
    cin>>l;
    cout<<"u=";
    cin>>u;
    cout<<"n=";
    cin>>n;
    Init();
    coordinates x= angle(setcoord(700,600),l,90,true);
    build4(x,l,u,n);
    x=angle(setcoord(200,600),l,90,true);
    build3(x,l,u,n);

    getch();

    return 0;
}
