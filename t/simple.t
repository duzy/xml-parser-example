# -*- nqp -*-
plan(126);

my $declaration := $xml<declaration>;
ok($declaration, '<declaration>');
ok($declaration<declaration_info> eq 2, '<declaration_info>');

my $declaration_info_0 := $declaration<declaration_info>[0];
my $declaration_info_1 := $declaration<declaration_info>[1];
ok($declaration_info_0<name> eq 'version', "'version'");
ok($declaration_info_0<value> eq '"1.0"', "'version' value");
ok($declaration_info_1<name> eq 'encoding', "'encoding'");
ok($declaration_info_1<value> eq '"utf-8"', "'encoding' value");

my @all := $xml<markup_content>;
ok($xml<markup_content> eq 22, '22 children (markup and content)');

my $node := @all[0];
ok($node<tag>, 'node 0 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<root count="4">', 'root tag');
ok($node<tag><start> eq '<', 'start root tag');
ok($node<tag><name> eq 'root', 'root tag name');
ok($node<tag><attribute> eq 1, 'root attributes');
ok($node<tag><attribute>[0]<name> eq 'count', 'attribute name');
ok($node<tag><attribute>[0]<value> eq '"4"', 'attribute value');
ok($node<tag><delimiter> eq '>', 'root tag delimiter');

$node := @all[1];
ok($node<content>, 'node 1 is content');
ok($node<content> eq "\n  ", 'node 1 content');

$node := @all[2];
ok($node<tag>, 'node 2 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name="node-1"/>', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 1, 'node attributes');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute name');
ok($node<tag><attribute>[0]<value> eq '"node-1"', 'attribute value');
ok($node<tag><delimiter> eq '/>', 'node tag delimiter');

$node := @all[3];
ok($node<content>, 'node 3 is content');
ok($node<content> eq "\n  ", 'node 3 content');

# <node name="node-2" type ="child" />
$node := @all[4];
ok($node<tag>, 'node 4 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name="node-2" type ="child" />', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 2, 'node attributes');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-2"', 'attribute 0 value');
ok($node<tag><attribute>[1]<name> eq 'type', 'attribute 1 name');
ok($node<tag><attribute>[1]<value> eq '"child"', 'attribute 1 value');
ok($node<tag><delimiter> eq '/>', 'node tag delimiter');

$node := @all[5];
ok($node<content>, 'node 5 is content');
ok($node<content> eq "\n  ", 'node 5 content');

# <node name="node-3" age= "10" />
$node := @all[6];
ok($node<tag>, 'node 6 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name="node-3" age= "10" />', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 2, 'node attributes');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-3"', 'attribute 0 value');
ok($node<tag><attribute>[1]<name> eq 'age', 'attribute 1 name');
ok($node<tag><attribute>[1]<value> eq '"10"', 'attribute 1 value');
ok($node<tag><delimiter> eq '/>', 'node tag delimiter');

$node := @all[7];
ok($node<content>, 'node 7 is content');
ok($node<content> eq "\n  ", 'node 7 content');

# <node name="node-4">
$node := @all[8];
ok($node<tag>, 'node 8 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name="node-4">', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 1, 'one node attribute');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-4"', 'attribute 0 value');
ok($node<tag><delimiter> eq '>', 'node tag delimiter');

$node := @all[9];
ok($node<content>, 'node 9 is content');
ok($node<content> eq "\n    ", 'node 9 content');

# <node name ="node-4-1" />
$node := @all[10];
ok($node<tag>, 'node 10 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name ="node-4-1" />', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 1, 'one node attribute');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-4-1"', 'attribute 0 value');
ok($node<tag><delimiter> eq '/>', 'node tag delimiter');

$node := @all[11];
ok($node<content>, 'node 11 is content');
ok($node<content> eq "\n    ", 'node 11 content');

# <node name = "node-4-2" />
$node := @all[12];
ok($node<tag>, 'node 12 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name = "node-4-2" />', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 1, 'one node attribute');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-4-2"', 'attribute 0 value');
ok($node<tag><delimiter> eq '/>', 'node tag delimiter');

$node := @all[13];
ok($node<content>, 'node 13 is content');
ok($node<content> eq "\n    ", 'node 13 content');

# <node name="node-4-3" >
$node := @all[14];
ok($node<tag>, 'node 14 is tag');
ok($node<tag><start>, 'start tag');
ok($node<tag> eq '<node name="node-4-3" >', 'node tag');
ok($node<tag><start> eq '<', 'start node tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><attribute> eq 1, 'one node attribute');
ok($node<tag><attribute>[0]<name> eq 'name', 'attribute 0 name');
ok($node<tag><attribute>[0]<value> eq '"node-4-3"', 'attribute 0 value');
ok($node<tag><delimiter> eq '>', 'node tag delimiter');

$node := @all[15];
ok($node<content>, 'node 15 is content');
ok($node<content> eq "\n      text\n    ", 'node 15 content');

# </node>
$node := @all[16];
ok($node<tag>, 'node 16 is tag');
ok($node<tag> eq '</node>', 'end node tag');
ok($node<tag><end>, 'end tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><delimiter> eq '>', 'node tag delimiter');
ok(!$node<tag><start>, 'not start tag');
ok(!$node<tag><attribute>, 'no attributes');

$node := @all[17];
ok($node<content>, 'node 17 is content');
ok($node<content> eq "\n  ", 'node 17 content');

# </node>
$node := @all[18];
ok($node<tag>, 'node 18 is tag');
ok($node<tag> eq '</node >', 'end node tag');
ok($node<tag><end>, 'end tag');
ok($node<tag><name> eq 'node', 'node tag name');
ok($node<tag><delimiter> eq '>', 'node tag delimiter');
ok(!$node<tag><start>, 'not start tag');
ok(!$node<tag><attribute>, 'no attributes');

$node := @all[19];
ok($node<content>, 'node 19 is content');
ok($node<content> eq "\n", 'node 19 content');

# </root>
$node := @all[20];
ok($node<tag>, 'node 20 is tag');
ok($node<tag> eq '</root>', 'end root tag');
ok($node<tag><end>, 'end tag');
ok($node<tag><name> eq 'root', 'root tag name');
ok($node<tag><delimiter> eq '>', 'root tag delimiter');
ok(!$node<tag><start>, 'not start tag');
ok(!$node<tag><attribute>, 'no attributes');

$node := @all[21];
ok($node<content>, 'node 21 is content');
ok($node<content> eq "\n", 'node 21 content');
