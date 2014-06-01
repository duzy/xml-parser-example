use NQPHLL;

grammar XML::Grammar is HLL::Grammar {
    token TOP {
        ^<declaration>? \s* ~ $ <markup_content>* || <.panic: 'Syntax Error!'>
    }

    token declaration {
        '<?xml' \s+ <declaration_info>* '?>'
    }

    rule declaration_info {
        <name: 'version','encoding'> '=' <value>
    }

    token markup_content {
        | <tag>
        | <cdata>
        | <content>
    }

    token tag {
        | $<end>='</' <name> \s* $<delimiter>='>'
        | $<start>='<' <name> \s* <attribute>* $<delimiter>=['>'|'/>']
    }

    token cdata {
        '<![CDATA[' ~ ']]>' [<!before: ']]>'>.]*
    }

    token entity {
        '&' [ '#' $<code>=<![ 0..9 a..f A..F ]>+ | $<name>=<![;]>+ ] ';'
    }

    token content {
        [[<![<&$]>.]|<entity>]+
    }

    rule attribute {
        <name> '=' <value>
    }

    token name(*@names) {
        <.ident>
        {
            my $known := 0;
            for @names -> $s {
                if ~$/ eq $s {
                    $known := 1;
                    last;
                }
            }
            if @names && !$known {
                self.panic('Unknown name: '~$/);
            }
        }
    }

    token value {
        #| <number>
        | <?["]> <quote_EXPR: ':qq'>
    }
}
