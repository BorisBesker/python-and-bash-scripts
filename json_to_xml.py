import json
import sys
import os.path

import dicttoxml


def main():
    dir_path = os.path.dirname(os.path.realpath(__file__))
    # Checks if the number of arguments is correct, if not exit the script
    if len(sys.argv) != 3:
        print("Incorrect number of arguments, there must be two arguments ")
        sys.exit()
    # Checks if the file path user enters is a file(not a directory), if not exit the script
    # If the user enters the wrong file path
    if not(os.path.isfile(sys.argv[1])):
        print("Not a file, enter a valid file path")
        sys.exit()
    # Opens xml file and coverts it to dictionary
    try:
        with open(sys.argv[1]) as data_file:
            data = json.load(data_file)
    except ValueError:
        print("Not a valid JSON format")
    else:
        # Converts python dictionary to string xml representation
        xml_string = dicttoxml.dicttoxml(data)
        # Creates and writes(string representation) to a file_name.xml that user enters as a argument
        file_name = sys.argv[2] + '.xml'
        file = open(file_name, 'w+')
        file.write(xml_string)
        file.close()
        print("The file is located in directory", dir_path, "named", sys.argv[2])


if __name__ == '__main__':
    main()
