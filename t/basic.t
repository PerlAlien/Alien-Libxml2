use strict;
use warnings;
use Test::More tests => 1;
use Test::CChecker;
use Alien::Libxml2;

compile_with_alien 'Alien::Libxml2';

compile_output_to_note;

compile_run_ok do { local $/; <DATA> }, "basic comoile test";

__DATA__

#include <stdio.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

int
main(int argc, char *argv[])
{
  xmlDoc *doc = NULL;
  xmlNode *root_element = NULL;
  const char *filename = "t/basic.xml";
  
  doc = xmlReadFile(filename, NULL, 0);
  
  if(doc == NULL)
  {
    printf("error reading %s\n", filename);
    return 2;
  }
  
  xmlFreeDoc(doc);
  
  xmlCleanupParser();
  
  return 0;
}

