package Pistachio::Language;
# ABSTRACT: provides snippet(), which turns source code text into stylish HTML

use strict;
use warnings;
our $VERSION = '0.05'; # VERSION

# @param string $type Object type.
# @param string $lang A language identifier. E.g., 'Perl5'.
# @param hash %subs Map of {string => coderef}.
# @return Pistachio::Language
sub new {
    my ($type, $lang, %subs) = (shift, shift, @_);
    bless [
        $lang, 
        $subs{tokens},
        $subs{css},
        $subs{transform_rules} || sub {[]}
        ], $type;
}

# @param Pistachio::Language $this
# @return string A language identifier. E.g., 'Perl5'.
sub language { my $this = shift; $this->[0] }

# @param Pistachio::Language $this
# @param scalar/ref Input text.
# @return arrayref Array of Pistachio::Tokens.
sub tokens { my $this = shift; $this->[1]->(shift) }

# @param Pistachio::Language $this
# @param string A token type.
# @return string The CSS for the given type, or empty string.
sub css { my $this = shift; $this->[2]->(shift) }

# @param Pistachio::Language $this
# @return arrayref Transform rules (possibly empty).
sub transform_rules { my $this = shift; $this->[3]->() }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Pistachio::Language - provides snippet(), which turns source code text into stylish HTML

=head1 VERSION

version 0.05

=head1 SYNOPSIS

 # Get std_parse from lib-JBD:
 # L<https://github.com/joeldalley/lib-JBD>
 use JBD::JSON 'std_parse';

 # Define a Pistachio::Language object by specifying
 # the tokens, css and (optionally) tranformer_rules subs; 
 # This way, the existing Pistachio core can render JSON
 # into Github-styled HTML pages, even though Pistachio knows 
 # nothing about how to parse JSON, and gets all of its CSS 
 # CSS style information from this definition.

 my $lang = Pistachio::Language->new('JSON',
     tokens => sub {
         my $tokens = std_parse 'json_text', shift;
         [map Pistachio::Token->new($_->type, $_->value), @$tokens];
     },
     css => sub {
         my %type_to_style = (
             JsonNum           => 'color:#008080',
             JsonNull          => 'color:#000',
             JsonBool          => 'color:#000',
             JsonString        => 'color:#D14',
             JsonColon         => 'color:#333',
             JsonComma         => 'color:#333',
             JsonSquareBracket => 'color:#333',
             JsonCurlyBrace    => 'color:#333',
             )
         $type_to_style{$_[0] || ''} || '';
     },
 );

=head1 AUTHOR

Joel Dalley <joeldalley@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Joel Dalley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
