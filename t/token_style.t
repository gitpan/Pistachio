use strict;
use warnings;

use Test::More;

BEGIN { 
    use_ok('Pistachio::Css::Github::Perl5', qw(token));
    use_ok('Pistachio::Tokenizer');
}

my @tests = (
    ['my @count = $#my_list;', 6, 'ArrayIndex', 'color:#008080'],
    ['use constant FOO => 1;', 4, 'Word::Constant', 'color:#D14'],
    ['my @words = qw(a b c);', 6, 'QuoteLike::Words', 'color:#D14'],
    );


my $tokenizer = Pistachio::Tokenizer->new('Perl5');

TEST: for my $test (@tests) {
    my ($text, $expected_pos, $expected_type, $expected_style) = @$test;

    my $token_pos = 0;
    my $it = $tokenizer->iterator(\$text);

    while ($_ = $it->()) {
        $token_pos == $expected_pos && do {
            my $passed = $expected_type eq $_->type 
                      && $expected_style eq token $_->type;
            ok($passed, "Passed test -- $expected_type");
            next TEST;
        };
        $token_pos++;
    }
}

done_testing;
