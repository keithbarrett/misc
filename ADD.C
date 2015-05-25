
/*   ADD.C         Keith G. Barrett      7/7/88

   Simple calculator program


   REVISIONS:
   
    23-Aug-1990         Rev 3.0 release for Lattice 5.04

*/


#include <stdio.h>
#include <math.h>
#include <stdlib.h>

main()
{
    int     len;
    char    *tmptr;
    double  memory = 0;
    double  current = 0;
    double  tmpf;
    char    instr[81];
    double  atof();

		
    printf("\nADD - Calculator Program V3.0\n\n");

    do
    {
        printf("> ");
        tmptr = gets(instr);
        len = strlen(instr);

        if (len == 0)
            printf("\nAnswer -> %f\n", current);
    
        if (tmptr == 0)
        {
            printf("\n\nexiting\n\n");
            break;
        }
        
        switch (instr[0])
        {
            case 'x' :
            case 'X' :
                exit(0);

            case 'h' :
            case 'H' :
                printf("\nThe following commands are valid:\n\n\n");
                printf("Pressing RETURN will display current value\n\n");
                printf("C          Clears current value\n");
                printf("CC         Clears both current value and memory\n");
                printf("MC         Clears memory only\n\n");
                printf("M+         Adds current value to memory\n");
                printf("M-         Subtracts current value from memory\n");
                printf("M*         Multiplies memory by curent value\n");
                printf("M/         Divides memory by current value\n\n");
                printf("+n or n    Adds \"n\" to current value\n");
                printf("-n         Subtract \"n\" from current value\n");
                printf("*n         Multiply current value by \"n\"\n");
                printf("/n         Divide current value by \"n\"\n\n");
                printf("\"n\" is any valid numerical value\n\n");
                printf("Note: \"M\" can be substituted for \"n\" to");
                printf(" reference the current value in memory\n");
                break;

            case 'C' :
            case 'c' :
                if (len == 1)
	        {
                    current = 0;
                    printf("\nCleared\n");
                }
               	else if ((instr[1] == 'C') || (instr[1] == 'c'))
                {
                    memory  = 0;
                    current = 0;
                    printf("\nAll Cleared\n");
                }
                else printf("\n?invalid C Command\n");

                break;


            case '*' :
                instr[0] = '+';

                if ((instr[1] == 'M') || (instr[1] == 'm'))
                    tmpf = memory;
                else
                    tmpf = atof(instr);
                    
                current *= tmpf;
                break;
                    

            case '/' :
                instr[0] = '+';

                if ((instr[1] == 'M') || (instr[1] == 'm'))
                    tmpf = memory;
                else
                    tmpf = atof(instr);

                current /= tmpf;
                break;


            case '-' :
                if ((instr[1] == 'M') || (instr[1] == 'm'))
                    tmpf = memory;
                else
                    tmpf = atof(instr);

                current += tmpf;
                break;


            case 'M' :
            case 'm' :
               	if (len == 1)
                {
                    printf("\nMemory -> %f\n", memory);
                    break;
                }
               	else
                {
                    switch (instr[1])
                    {
                  	case 'C' :
                  	case 'c' :
                            memory = 0;
                    	    printf("\nMemory Cleared\n");
                     	    break;

                  	case '+' :
                     	    memory +=current;
                     	    printf("\nAdded\n");
                     	    break;

                  	case '-' :
                     	    memory -=current;
                     	    printf("\nSubtracted\n");
                     	    break;

                  	case '*' :
                     	    memory *=current;
                     	    printf("\nMultiplied\n");
                     	    break;

                  	case '/' :
                     	    memory /=current;
                     	    printf("\nDivided\n");
                     	    break;

                  	default :
                     	    printf("\n?invalid Memory Command\n");
                     	    break;
               	    }
                }

            default:
                if ((instr[1] == 'M') || (instr[1] == 'm'))
                    tmpf = memory;
                else
                    tmpf = atof(instr);

                current += tmpf;
                break;
        }

    } while (-1);
}
