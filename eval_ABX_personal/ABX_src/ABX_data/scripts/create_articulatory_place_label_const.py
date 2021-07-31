import sys
import argparse

parser = argparse.ArgumentParser(description='description.')
#parser.add_argument('type_manner', type=str, help='stop, nasal, fricative, affricate, approximant')
#parser.add_argument('wanted_phone2', type=str, help='wanted_phone2')
#args = parser.parse_args()
#parser.add_argument('--sum', dest='accumulate', action='store_const',
#                    const=sum, default=max,
#                    help='sum the integers (default: find the max)')


#wanted_phone1 = 'AE'
#wanted_phone2 = 'IH' #'EH'
f = open('dev-clean.item','r')
lines = f.readlines()
list_consts_unvoic = [ 'CH', 'S', 'TH', 'SH', 'F', 'K', 'T', 'P', 'HH' ]
list_consts_voiced = [ 'JH','Y','W','R','L','Z','ZH','DH','V','M','N','NG','G','D','B' ]
# lines[0]: '#file onset offset #phone prev-phone next-phone speaker\n'
# lines[1]: '6295-244435-0009 0.2925 0.4725 IH L NG 6295\n'
file_out = open("output_items/articulatory_place_label/dev-clean_consts.item",'w')
file_out.write(lines[0])
def list_const(argument):
    switcher = {
      "bilabial": ['P', 'B', 'M', 'W'],
      "labiodental": ['F', 'V'],
      "dental": ['TH', 'DH'],
      "alveolar": ['T', 'D', 'S', 'Z', 'N', 'L'],
      "postalveolar": ['CH', 'JH', 'SH', 'ZH', 'R' ],
#      "retroflex": ['R'],
      "palatal": ['Y'],
      "velar": ['G','K','NG'],
      "glottal": ['HH']
#      "stop": ['K', 'G', 'P', 'B', 'T', 'D'],
#      "nasal": ['M', 'N', 'NG'],
#      "fricative": ['S', 'TH', 'SH', 'F', 'HH', 'Z', 'ZH', 'DH', 'V'],
#      "affricate": ['CH', 'JH' ],
#      "approximant": ['Y', 'W', 'L', 'R'],
#      "affricate_fricative": ['CH', 'JH', 'S', 'TH', 'SH', 'F', 'HH', 'Z', 'ZH', 'DH', 'V'],
#      "affricate_stop": ['CH', 'JH', 'K', 'G', 'P', 'B', 'T', 'D']
    }
    return switcher.get(argument, "nothing")
#def phoneme2manner(argument)
#    switcher = {
#      "K"
#      "G"
#      "P"
#
#    }
#consonants = list_const(args.type_manner)
#if len(consonants) == 0:
#    print('check input manner of articulation type.')
#    sys.exit()
#else:
#    print(consonants)


for this_line in lines:
#  sys.stdout.write("hello\n")
#  if this_line.split(" ")[3] ==  args.wanted_phone1 or this_line.split(" ")[3] == args.wanted_phone2 :
#  file_out.write(this_line.split(" ")[0:3])
  splitted_this_line = this_line.split(" ")
  if this_line.split(" ")[3] in list_const("bilabial"):
    splitted_this_line[3] = "BI" 
  elif this_line.split(" ")[3] in list_const("labiodental"):
    splitted_this_line[3] = "LA" 
  elif this_line.split(" ")[3] in list_const("dental"):
    splitted_this_line[3] = "DA"
  elif this_line.split(" ")[3] in list_const("alveolar"):
    splitted_this_line[3] = "AL"  
  elif this_line.split(" ")[3] in list_const("postalveolar"):
    splitted_this_line[3] = "PO"
#  elif this_line.split(" ")[3] in list_const("retroflex"):
#    splitted_this_line[3] = "RE"
  elif this_line.split(" ")[3] in list_const("palatal"):
    splitted_this_line[3] = "PA"
  elif this_line.split(" ")[3] in list_const("velar"):
    splitted_this_line[3] = "VE"
  elif this_line.split(" ")[3] in list_const("glottal"):
    splitted_this_line[3] = "GL"
  else:
    #print("This phoneme:" + this_line.split(" ")[3] + "not found")
    # not a consonant
    continue
  file_out.write(" ".join(splitted_this_line))
#  if this_line.split(" ")[3] in consonants :
#    #print(this_line[:-1])
#    #sys.stdout.write(this_line)
#    file_out.write(this_line)
#print("Bilabial: " + ' '.join(list_const("bilabial")))
file_out.close()
