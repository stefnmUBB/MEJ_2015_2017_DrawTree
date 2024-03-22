#include <GL/glut.h>
#include <GL/gl.h>
#include <stdlib.h>
#include <windows.h>

/* Program entry point */

void LoadBitMap()
{
GLuint texture[1];

AUX_RGBImageRec *LoadBMP( char *Filename ) {
FILE *File = NULL;

if ( !Filename ) {
return NULL;
}

File = fopen( Filename,"r" );

if ( File ) {
fclose( File );
return auxDIBImageLoad( Filename );
}

return NULL;
}

int LoadGLTextures() {
int Status = FALSE;

AUX_RGBImageRec *TextureImage[1];

memset( TextureImage, 0, sizeof( void * )*1 );

// Load The Bitmap, Check For Errors, If Bitmap's Not Found Quit
if ( TextureImage[0] = LoadBMP( ".bmp" ) ) {
Status = TRUE;

glGenTextures( 1, &texture[0] );

// Typical Texture Generation Using Data From The Bitmap
glBindTexture( GL_TEXTURE_2D, texture[0] );
glTexImage2D( GL_TEXTURE_2D, 0, 3, TextureImage[0]->sizeX, TextureImage[0]->sizeY, 0, GL_RGB, GL_UNSIGNED_BYTE, TextureImage[0]->data );
glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
}

if ( TextureImage[0] ) {
if ( TextureImage[0] -> data ) {
free( TextureImage[0] -> data );
}

free( TextureImage[0] );
}

return Status;
}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);

    glutCreateWindow("Copac | L'arbre");





    glutMainLoop();

    return EXIT_SUCCESS;
}
