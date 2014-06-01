class XML::Compiler is HLL::Compiler {
}

my $xmlc := XML::Compiler.new();
$xmlc.language('xml');
$xmlc.parsegrammar(XML::Grammar);
$xmlc.parseactions(XML::Actions);

sub MAIN(*@ARGS) {
    #$xmlc.command_line(@ARGS, :encoding('utf8'));
    for @ARGS -> $filename {
        next unless $filename ~~ / \.xml$ /;
        my $content := slurp($filename);
        my $xml := XML::Grammar.parse($content);
        nqp::say('xml: '~$filename~"\n"~$xml);
        nqp::say('declaration: '~$xml<declaration>);
        next unless $xml<markup_content>;
        nqp::say('markup_content: '~$xml<markup_content>);
        for $xml<markup_content> -> $m {
            nqp::say('markup_content: '~$m<markup>);
        }
    }
}
