from argparse import ArgumentParser

def get_parser():
  parser = ArgumentParser()
  requiredNamed = parser.add_argument_group("required named arguments")
  requiredNamed.add_argument("-sn", help="source number", dest="sourcenum", required=True, type = int)
  args = parser.parse_args()
  return args.sourcenum
sourcenum = get_parser()
templatename = 'L1T_CDR_cryostat_10miilion_template.mac'

with open(templatename, 'r') as inf:
    filedata = inf.read()
    
filedata = filedata.replace('SOURCENUMBER', '%02d' % sourcenum)
rootname = 'L1T_CDR_cryostat_10miilion_SOURCENUM.root'
rootname = rootname.replace('SOURCENUM', '%02d' % sourcenum)
filedata = filedata.replace('OUTPUTROOTNAME', rootname)

# macroname = 'macros/'+templatename.replace('template', rootname[:-5])
macroname = 'macros/'+templatename.replace('template', '%02d' % sourcenum)
with open(macroname, 'w') as outf:
    outf.write(filedata)

