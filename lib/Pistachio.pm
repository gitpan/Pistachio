package Pistachio;

# ABSTRACT: turns source code into stylish HTML

our $VERSION = '0.03'; # VERSION

use strict;
use warnings;
use Module::Load;


#/ @return string    supported languages and styles message
sub supported() {
    my @import = qw(supported_languages supported_styles);
    load 'Pistachio::Supported', @import;

    my $out = "\nSupported Languages:\n";
    $out .= "\t - $_\n" for &supported_languages;

    $out .= "\nSupported Styles:\n";
    $out .= "\t - $_\n" for &supported_styles;
    $out .= "\n";

    $out;
}

#/ @param string $lang    a language, e.g., 'Perl5'
#/ @param string $style    a style, e.g., 'Github'
sub html_handler($$) {
    my ($lang, $style) = @_;
    load 'Pistachio::Html';
    Pistachio::Html->new($lang, $style);
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Pistachio - turns source code into stylish HTML

=head1 VERSION

version 0.03

=head1 SYNOPSIS

 use Pistachio;

 # List supported languages and styles
 print Pistachio::supported;

 # Get a Pistachio::Html object
 my $handler = Pistachio::html_handler('Perl5', 'Github');

 # Perl source code text (in typical usage, read from a file)
 my $perl = join "\n", 'use strict;', 'package Foo::Bar', '...';

 # Github-like CSS-styled HTML snippet.
 my $snip = $handler->snippet(\$perl);

=head1 AUTHOR

Joel Dalley <joeldalley@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Joel Dalley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
