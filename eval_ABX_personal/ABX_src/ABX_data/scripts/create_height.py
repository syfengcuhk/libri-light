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
file_out = open("output_items/height_label/dev-clean_monophthongs.item",'w')
file_out.write(lines[0])
def list_const(argument):
    switcher = {
      "close": ['IY', 'IH', 'UW', 'UH'],
      "mid": ['ER', 'EH', 'AH', 'AO'],
      "open": ['AE', 'AA']
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
  if this_line.split(" ")[3] in list_const("close"):
    splitted_this_line[3] = "CL" 
  elif this_line.split(" ")[3] in list_const("mid"):
    splitted_this_line[3] = "MI" 
  elif this_line.split(" ")[3] in list_const("open"):
    splitted_this_line[3] = "OP"
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
