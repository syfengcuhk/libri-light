import sys
import argparse

parser = argparse.ArgumentParser(description='description.')
#parser.add_argument('wanted_phone1', type=str, help='wanted_phone1')
#parser.add_argument('wanted_phone2', type=str, help='wanted_phone2')
args = parser.parse_args()
#parser.add_argument('--sum', dest='accumulate', action='store_const',
#                    const=sum, default=max,
#                    help='sum the integers (default: find the max)')


#wanted_phone1 = 'AE'
#wanted_phone2 = 'IH' #'EH'
f = open('dev-clean.item','r')
lines = f.readlines()
#list_monophthongs = [ 'EH', 'IH', 'AA', 'ER', 'UH', 'UW', 'AE', 'AO', 'IY', 'AH' ]
list_diphthongs = [ 'EY', 'OW', 'AW', 'OY', 'AY'  ]
# lines[0]: '#file onset offset #phone prev-phone next-phone speaker\n'
# lines[1]: '6295-244435-0009 0.2925 0.4725 IH L NG 6295\n'
file_out = open("output_items/dev-clean_diphthongs.item",'w')
file_out.write(lines[0])
for this_line in lines:
#  sys.stdout.write("hello\n")
#  if this_line.split(" ")[3] ==  args.wanted_phone1 or this_line.split(" ")[3] == args.wanted_phone2 :
  if this_line.split(" ")[3] in list_diphthongs :
    #print(this_line[:-1])
    #sys.stdout.write(this_line)
    file_out.write(this_line)
file_out.close()
