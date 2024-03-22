#include <GL/glut.h>
#include <GL/glu.h>
#include <stdio.h>

void init()
{
    //select clearing (background) color
	glClearColor(0.0, 0.0, 0.0, 0.0);

	//initialize viewing values
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
}

void display(void)
{

/**	glClear(GL_COLOR_BUFFER_BIT);

	HBITMAP hBmp = (HBITMAP) ::LoadImage (NULL,
                        (LPCTSTR) "Q0.bmp", IMAGE_BITMAP, 0, 0,
 LR_LOADFROMFILE |LR_CREATEDIBSECTION);
	if (hBmp == NULL) {
	printf("Nie znaleziono bitmapy\n");
	}
	else printf("Znaleziono bitmape!\n");

	BITMAP BM;
	::GetObject (hBmp, sizeof (BM), &BM);

        if (BM.bmBitsPixel != 24){
   printf("Zla paleta kolorow!\n");
	}
	else   printf("Dobra paleta kolorow!\n");


	glPixelStorei(GL_UNPACK_ALIGNMENT, 4);
	glDrawPixels( BM.bmHeight, BM.bmWidth, GL_RGB,
GL_UNSIGNED_BYTE, BM.bmBits );
	glEnd();

	glFlush();**/
}

int main(int n,char** c)
{
    glutInit(&n,c);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize(560,800);
	glutInitWindowPosition(100,100);
	glutCreateWindow("Instrukcja");
	init();
	//glutDisplayFunc(display);
	glutMainLoop();
}
