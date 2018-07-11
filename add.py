#! /usr/bin/env python

# add.py - Keith Barrett Simple calculator program

import sys

print("\nADD - Calculator Program V1.0 py\n\n")

current = float(0.0)
memory = float(0.0)
tmpf = float(0.0)

while True:
    instr = input('> ')
    strLen = len(instr)

    if strLen == 0:
        print('\nAnswer -> ' + str(current) + '\n')
        continue

    # if instr == 'exit' or instr == 'bye' or instr == 'end' or instr == 'goodbye' or instr[
    #     0] == 'x' or instr[0] == 'X' or instr[0] == 'q':
    #     print('\n\nexiting\n\n')
    #     sys.exit()

    if ('x' in instr) or ('bye' in instr) or ('q' in instr):
        print('\n\nexiting\n\n')
        sys.exit()

    if instr[0] in 'hH?':
        print('\nThe following commands are valid:\n\n')
        print('Pressing RETURN will display current value\n')
        print('C          Clears current value\n')
        print('CC         Clears both current value and memory\n')
        print('MC         Clears memory only\n')
        print('M+         Adds current value to memory\n')
        print('M-         Subtracts current value from memory\n')
        print('M*         Multiplies memory by current value\n')
        print('M/         Divides memory by current value\n')
        print('+n or n    Adds \"n\" to current value\n')
        print('-n         Subtract \"n\" from current value\n')
        print('*n         Multiply current value by \"n\"\n')
        print('/n         Divide current value by \"n\"\n\n')
        print('\"n\" is any valid numerical value\n')
        print('Note: \"M\" can be substituted for \"n\" to')
        print('reference the current value in memory\n')
        continue


    if instr[0] in 'cC':
        if (strLen == 1):
            current = float(0.0)
            print('\nCleared\n')

        elif instr[1] in 'cC':
            memory = float(0.0)
            current = float(0.0)
            print('\nAll Cleared\n')

        else:
            print('\n?invalid C Command\n')

        continue


    if instr[0] == '*':
        if instr[1] in 'Mm':
            tmpf = memory
        else:
            tmpf = float(instr[1:])

        current *= tmpf
        continue


    if instr[0] == '+':
        if instr[1] in 'Mm':
            tmpf = memory
        else:
            tmpf = float(instr[1:])

        current += tmpf
        continue


    if instr[0] == '/':
        if instr[1] in 'Mm':
            tmpf = memory
        else:
            tmpf = float(instr[1:])

        current /= tmpf
        continue


    if instr[0] == '-':
        if instr[1] in 'Mm':
            tmpf = memory
        else:
            tmpf = float(instr[1:])

        current -= tmpf
        continue


    if instr[0] in 'Mm':
        if strLen == 1:
            print('\nMemory -> ' + str(memory) + '\n')
        else:
            if instr[1] in 'cC':
                memory = float(0.0)
                print('\nMemory Cleared\n')

            elif instr[1] == '+':
                memory += current
                print('\nAdded\n')

            elif instr[1] == '-':
                memory -= current
                print('\nSubtracted\n')

            elif instr[1] == '*':
                memory *= current
                print('\nMultiplied\n')

            elif instr[1] == '/':
                memory /= current
                print('\nDivided\n')

            else:
                print('\n?invalid Memory Command\n')

        continue


    if strLen == 1:
        tmpf = float(instr[0:])

    elif instr[1] in 'Mm':
        tmpf = memory
    else:
        tmpf = float(instr[1:])

    current += tmpf


# End of While

# End of Line

