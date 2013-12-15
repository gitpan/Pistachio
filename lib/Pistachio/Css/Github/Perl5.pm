package Pistachio::Css::Github::Perl5;

# ABSTRACT: provides token(), which turns a token type into css style text

our $VERSION = '0.03'; # VERSION

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(token);

#/ map Pistachio::Token type => css style
my %type_to_style = (
    'Cast'                    => 'color:#008080',
    'Cast::Reference'         => 'color:#333;font-weight:bold',
    'Comment'                 => 'color:#999988;font-style:italic',
    'Label'                   => 'color:#333',
    'Magic'                   => 'color:#008080',
    'Magic::These'            => 'color:#008080',
    'Magic::This'             => 'color:#008080',
    'Number'                  => 'color:#008080',
    'Number::Float'           => 'color:#008080',
    'Operator'                => 'color:#333',
    'Operator::Dereference'   => 'color:#333;font-weight:bold',
    'Operator::Wordish'       => 'color:#333;font-weight:bold',
    'Prototype'               => 'color:#333',
    'Quote::Double'           => 'color:#D14',
    'Quote::Interpolate'      => 'color:#D14',
    'Quote::Single'           => 'color:#D14',
    'QuoteLike::Words'        => 'color:#D14',
    'Regexp'                  => 'color:#009926',
    'Regexp::Match'           => 'color:#009926',
    'Regexp::Substitute'      => 'color:#009926',
    'Structure'               => 'color:#333',
    'Symbol'                  => 'color:#008080',
    'Symbol::Sub'             => 'color:#333',
    'Whitespace'              => 'color:#FFF',
    'Word::Coderef::Invoke'   => 'color:#333',
    'Word::Defined'           => 'color:#333',
    'Word::Hashkey'           => 'color:#333',
    'Word::Package'           => 'color:#333',
    'Word::Require'           => 'color:#333',
    'Word::Reserved'          => 'color:#0086B3',
    'Word::Reserved::Keyword' => 'color:#333;font-weight:bold',
    'Word::Special::Literal'  => 'color:#333',
    'Word::Sub::Define'       => 'color:#990000;font-weight:bold',
    'Word::Sub::Invoke'       => 'color:#333',
    'Word::Use'               => 'color:#333',
    );

#/ @param string $type    a Pistachio::Token type
#/ @return string    the type's css
sub token($) {
    my $type = shift or return '';
    $type_to_style{$type} || '';
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Pistachio::Css::Github::Perl5 - provides token(), which turns a token type into css style text

=head1 VERSION

version 0.03

=head1 AUTHOR

Joel Dalley <joeldalley@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Joel Dalley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
