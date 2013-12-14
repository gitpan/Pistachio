package Pistachio::Html;

# ABSTRACT: provides snippet(), which turns source code text into stylish HTML

our $VERSION = '0.02'; # VERSION

use strict;
use warnings;

use Pistachio::Tokenizer;
use HTML::Entities;
use Module::Load;
use Carp 'croak';


#/ @param string $type    object type
#/ @param string $lang    language, e.g., 'Perl5'
#/ @param string $style    style, e.g., 'Github'
#/ @return Pistachio::Html
sub new {
    my $type = shift;
    my ($lang, $style) = (shift || '', shift || '');

    #/ current package ability checker
    my $ensure = sub {croak $_[1] if !__PACKAGE__->can($_[0])};

    #/ common css package
    my $style_pkg = "Pistachio::Css::${style}::Common";
    my @import = qw(number_cell number_strip code_div);
    eval { load $style_pkg, @import }; 
    croak "Style `$style` isn't supported" if $@;
    $ensure->($_, "$style_pkg doesn't export $_") for @import;

    #/ language-specific css package
    my $lang_pkg = "Pistachio::Css::${style}::${lang}";
    eval { load $lang_pkg, 'token' };
    croak "Language `$lang` isn't supported" if $@;
    $ensure->('token', "$lang_pkg doesn't export token");

    bless sub {
        Pistachio::Tokenizer->new($lang)->iterator(shift);
    }, $type;
}

#/ @param Pistachio::Html $this
#/ @param scalarref $text    source code text
#/ @return string    line numbers div + source code div html
sub snippet {
    my ($this, $text) = @_;

    NUMBER_STRIP: my $num_strip = do {
        my @nums = 1 .. (split /\n/, $$text);
        my $spec = '<div style="%s">%d</div>';
        my @divs = map sprintf($spec, &number_cell, $_), @nums;

        $spec = qq{<div style="%s">\n%s\n</div>\n};
        sprintf $spec, &number_strip, "@divs";
    };

    CODE_DIV: my $code_div = do {
        my $code = '';
        my $it = $this->($text);

        while ($_ = $it->()) { 
            my $value = encode_entities $_->value;
            my $spec = '<span style="%s">%s</span>';
            $code .= sprintf $spec, token($_->type), $value;
        }

        sprintf qq{<div style="%s">%s</div>}, &code_div, $code;
    };

    join "\n", '<div>', $num_strip, $code_div, '</div>',
               '<div style="clear:both"></div>';
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Pistachio::Html - provides snippet(), which turns source code text into stylish HTML

=head1 VERSION

version 0.02

=head1 SYNOPSIS

 use Pistachio::Html;
 my $html = Pistachio::Html->new('Perl5', 'Github');

 my $scalar_ref = \"use strict; ...;";
 my $snip = $html->snippet($scalar_ref);

=head1 AUTHOR

Joel Dalley <joeldalley@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Joel Dalley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
