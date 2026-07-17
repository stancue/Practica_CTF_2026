/*
 * generator-reader.c program c care deschide fisierul si il afiseaza
 * Binar SUID: ruleaza cu effective UID = m06 (owner-ul fisierului),
 * indiferent cine il porneste - permite lui m05 sa citeasca fisierul
 * protejat al lui m06 fara acces direct.
 */
#include <stdio.h>

int main(void) {
    const char *path = "/home/m06/.pass";
    FILE *f = fopen(path, "r");
    if (!f) 
    { fprintf(stderr, "Acces indisponibil.\n"); 
        return 1; }
    char buf[128];
    if (fgets(buf, sizeof(buf), f)) 
        printf("Cod acces generator: %s", buf);
    fclose(f);
    return 0;
}
