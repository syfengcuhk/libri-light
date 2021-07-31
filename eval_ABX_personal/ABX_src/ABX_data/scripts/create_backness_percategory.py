import sys
import argparse

parser = argparse.ArgumentParser(description='description.')
parser.add_argument('wanted_category1', type=str, help='wanted_category1')
parser.add_argument('wanted_category2', type=str, help='wanted_category2')
args = parser.parse_args()
#parser.add_argument('--sum', dest='accumulate', action='store_const',
#                    const=sum, default=max,
#                    help='sum the integers (default: find the max)')


#wanted_category1 = 'AE'
#wanted_category2 = 'IH' #'EH'
f = open('output_items/backness_label/dev-clean_monophthongs.item','r')
lines = f.readlines()
# lines[0]: '#file onset offset #phone prev-phone next-phone speaker\n'
# lines[1]: '6295-244435-0009 0.2925 0.4725 IH L NG 6295\n'
file_out = open("output_items/backness_label/dev-clean_" + args.wanted_category1 + "_" + args.wanted_category2 + ".item",'w')
file_out.write(lines[0])
for this_line in lines:
#  sys.stdout.write("hello\n")
  if this_line.split(" ")[3] ==  args.wanted_category1 or this_line.split(" ")[3] == args.wanted_category2 :
    #print(this_line[:-1])
    #sys.stdout.write(this_line)
    file_out.write(this_line)
file_out.close()
