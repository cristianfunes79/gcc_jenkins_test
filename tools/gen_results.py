from jinja2 import Template
import os
import sys


print("Running test result generator")

PRJ = os.getenv('PROJECT_PATH')

fl = open(PRJ +'/tools/templates/code_info.html')
rsp = os.popen('nm -sS ' + PRJ + '/build/test_fw')

template = Template( fl.read() )


fl.close()

fl = open(PRJ + '/index.html','w')
fl.write( template.render( title='nm results', test_results=rsp.read()))
fl.close()

print("Test results done!")




