package Pistachio::Keywords::Perl5;
# ABSTRACT: provides is_keyword()

use strict;
use warnings;
our $VERSION = '0.09'; # VERSION

use Exporter 'import';
our @EXPORT_OK = qw(is_keyword);

# keywords
my %words = (
    '$!' => 1,
    '$"' => 1,
    '$#' => 1,
    '$$' => 1,
    '$%' => 1,
    '$&' => 1,
    '$\'' => 1,
    '$(' => 1,
    '$)' => 1,
    '$*' => 1,
    '$+' => 1,
    '$,' => 1,
    '$-' => 1,
    '$.' => 1,
    '$/' => 1,
    '$0' => 1,
    '$:' => 1,
    '$;' => 1,
    '$<' => 1,
    '$=' => 1,
    '$>' => 1,
    '$?' => 1,
    '$@' => 1,
    '$ACCUMULATOR' => 1,
    '$ARG' => 1,
    '$ARGV' => 1,
    '$BASETIME' => 1,
    '$CHILD_ERROR' => 1,
    '$COMPILING' => 1,
    '$DEBUGGING' => 1,
    '$EFFECTIVE_GROUP_ID' => 1,
    '$EFFECTIVE_USER_ID' => 1,
    '$EGID' => 1,
    '$ERRNO' => 1,
    '$EUID' => 1,
    '$EVAL_ERROR' => 1,
    '$EXCEPTIONS_BEING_CAUGHT' => 1,
    '$EXECUTABLE_NAME' => 1,
    '$EXTENDED_OS_ERROR' => 1,
    '$FORMAT_FORMFEED' => 1,
    '$FORMAT_LINES_LEFT' => 1,
    '$FORMAT_LINES_PER_PAGE' => 1,
    '$FORMAT_LINE_BREAK_CHARACTERS' => 1,
    '$FORMAT_NAME' => 1,
    '$FORMAT_PAGE_NUMBER' => 1,
    '$FORMAT_TOP_NAME' => 1,
    '$GID' => 1,
    '$INPLACE_EDIT' => 1,
    '$INPUT_LINE_NUMBER' => 1,
    '$INPUT_RECORD_SEPARATOR' => 1,
    '$LAST_MATCH_END' => 1,
    '$LAST_PAREN_MATCH' => 1,
    '$LAST_REGEXP_CODE_RESULT' => 1,
    '$LIST_SEPARATOR' => 1,
    '$MATCH' => 1,
    '$MULTILINE_MATCHING' => 1,
    '$NR' => 1,
    '$OFMT' => 1,
    '$OFS' => 1,
    '$ORS' => 1,
    '$OSNAME' => 1,
    '$OS_ERROR' => 1,
    '$OUTPUT_AUTO_FLUSH' => 1,
    '$OUTPUT_FIELD_SEPARATOR' => 1,
    '$OUTPUT_RECORD_SEPARATOR' => 1,
    '$PERLDB' => 1,
    '$PERL_VERSION' => 1,
    '$PID' => 1,
    '$POSTMATCH' => 1,
    '$PREMATCH' => 1,
    '$PROCESS_ID' => 1,
    '$PROGRAM_NAME' => 1,
    '$REAL_GROUP_ID' => 1,
    '$REAL_USER_ID' => 1,
    '$RS' => 1,
    '$SUBSCRIPT_SEPARATOR' => 1,
    '$SUBSEP' => 1,
    '$SYSTEM_FD_MAX' => 1,
    '$UID' => 1,
    '$WARNING' => 1,
    '$[' => 1,
    '$]' => 1,
    '$^' => 1,
    '$^A' => 1,
    '$^C' => 1,
    '$^CHILD_ERROR_NATIVE' => 1,
    '$^D' => 1,
    '$^E' => 1,
    '$^ENCODING' => 1,
    '$^F' => 1,
    '$^H' => 1,
    '$^I' => 1,
    '$^L' => 1,
    '$^M' => 1,
    '$^N' => 1,
    '$^O' => 1,
    '$^OPEN' => 1,
    '$^P' => 1,
    '$^R' => 1,
    '$^RE_DEBUG_FLAGS' => 1,
    '$^RE_TRIE_MAXBUF' => 1,
    '$^S' => 1,
    '$^T' => 1,
    '$^TAINT' => 1,
    '$^UNICODE' => 1,
    '$^UTF8LOCALE' => 1,
    '$^V' => 1,
    '$^W' => 1,
    '$^WARNING_BITS' => 1,
    '$^WIDE_SYSTEM_CALLS' => 1,
    '$^X' => 1,
    '$_' => 1,
    '$`' => 1,
    '$a' => 1,
    '$b' => 1,
    '$|' => 1,
    '$~' => 1,
    '%!' => 1,
    '%+' => 1,
    '%-' => 1,
    '%ENV' => 1,
    '%INC' => 1,
    '%OVERLOAD' => 1,
    '%SIG' => 1,
    '%^H' => 1,
    '-A' => 1,
    '-B' => 1,
    '-C' => 1,
    '-M' => 1,
    '-O' => 1,
    '-R' => 1,
    '-S' => 1,
    '-T' => 1,
    '-W' => 1,
    '-X' => 1,
    '-b' => 1,
    '-c' => 1,
    '-d' => 1,
    '-e' => 1,
    '-f' => 1,
    '-g' => 1,
    '-k' => 1,
    '-l' => 1,
    '-o' => 1,
    '-p' => 1,
    '-r' => 1,
    '-s' => 1,
    '-t' => 1,
    '-u' => 1,
    '-w' => 1,
    '-x' => 1,
    '-z' => 1,
    '1' => 1,
    '2' => 1,
    '3' => 1,
    '4' => 1,
    '5' => 1,
    '6' => 1,
    '7' => 1,
    '8' => 1,
    '9' => 1,
    ':bytes' => 1,
    ':crlf' => 1,
    ':mmap' => 1,
    ':perlio' => 1,
    ':pop' => 1,
    ':raw' => 1,
    ':stdio' => 1,
    ':unix' => 1,
    ':utf8' => 1,
    ':win32' => 1,
    '@+' => 1,
    '@-' => 1,
    '@ARGV' => 1,
    '@F' => 1,
    '@INC' => 1,
    '@LAST_MATCH_START' => 1,
    '@_' => 1,
    'ACCUMULATOR' => 1,
    'ARG' => 1,
    'ARGV' => 1,
    'ARGVOUT' => 1,
    'AUTOLOAD' => 1,
    'BASETIME' => 1,
    'BEGIN' => 1,
    'CHECK' => 1,
    'CHILD_ERROR' => 1,
    'CHILD_ERROR_NATIVE' => 1,
    'CLEAR' => 1,
    'CLOSE' => 1,
    'COMPILING' => 1,
    'CORE' => 1,
    'DATA' => 1,
    'DEBUGGING' => 1,
    'DELETE' => 1,
    'DESTROY' => 1,
    'EFFECTIVE_GROUP_ID' => 1,
    'EFFECTIVE_USER_ID' => 1,
    'EGID' => 1,
    'ENCODING' => 1,
    'END' => 1,
    'ENV' => 1,
    'ERRNO' => 1,
    'EUID' => 1,
    'EVAL_ERROR' => 1,
    'EXCEPTIONS_BEING_CAUGHT' => 1,
    'EXECUTABLE_NAME' => 1,
    'EXISTS' => 1,
    'EXTEND' => 1,
    'EXTENDED_OS_ERROR' => 1,
    'FETCH' => 1,
    'FETCHSIZE' => 1,
    'FIRSTKEY' => 1,
    'FORMAT_FORMFEED' => 1,
    'FORMAT_LINES_LEFT' => 1,
    'FORMAT_LINES_PER_PAGE' => 1,
    'FORMAT_LINE_BREAK_CHARACTERS' => 1,
    'FORMAT_NAME' => 1,
    'FORMAT_PAGE_NUMBER' => 1,
    'FORMAT_TOP_NAME' => 1,
    'File' => 1,
    'GETC' => 1,
    'GID' => 1,
    'GetOptions' => 1,
    'HOME' => 1,
    'Handles' => 1,
    'INC' => 1,
    'INIT' => 1,
    'INPLACE_EDIT' => 1,
    'INPUT_LINE_NUMBER' => 1,
    'INPUT_RECORD_SEPARATOR' => 1,
    'ISA' => 1,
    'LAST_MATCH_END' => 1,
    'LAST_MATCH_START' => 1,
    'LAST_PAREN_MATCH' => 1,
    'LAST_REGEXP_CODE_RESULT' => 1,
    'LAST_SUBMATCH_RESULT' => 1,
    'LIST_SEPARATOR' => 1,
    'LOGDIR' => 1,
    'MATCH' => 1,
    'MULTILINE_MATCHING' => 1,
    'Misc' => 1,
    'NEXTKEY' => 1,
    'NR' => 1,
    'OFS' => 1,
    'OPEN' => 1,
    'ORS' => 1,
    'OSNAME' => 1,
    'OS_ERROR' => 1,
    'OUTPUT_AUTOFLUSH' => 1,
    'OUTPUT_FIELD_SEPARATOR' => 1,
    'OUTPUT_RECORD_SEPARATOR' => 1,
    'PATH' => 1,
    'PERL5DB' => 1,
    'PERL5DB_THREADED' => 1,
    'PERL5LIB' => 1,
    'PERL5OPT' => 1,
    'PERL5SHELL' => 1,
    'PERLDB' => 1,
    'PERLIO' => 1,
    'PERLIO_DEBUG' => 1,
    'PERLLIB' => 1,
    'PERL_ALLOW_NON_IFS_LSP' => 1,
    'PERL_DEBUG_MSTATS' => 1,
    'PERL_DESTRUCT_LEVEL' => 1,
    'PERL_DL_NONLAZY' => 1,
    'PERL_ENCODING' => 1,
    'PERL_HASH_SEED' => 1,
    'PERL_HASH_SEED_DEBUG' => 1,
    'PERL_ROOT' => 1,
    'PERL_SIGNALS' => 1,
    'PERL_UNICODE' => 1,
    'PERL_VERSION' => 1,
    'PID' => 1,
    'POP' => 1,
    'POSTMATCH' => 1,
    'PREMATCH' => 1,
    'PRINT' => 1,
    'PRINTF' => 1,
    'PROCESS_ID' => 1,
    'PROGRAM_NAME' => 1,
    'PUSH' => 1,
    'Perl' => 1,
    'READ' => 1,
    'READLINE' => 1,
    'REAL_GROUP_ID' => 1,
    'REAL_USER_ID' => 1,
    'RE_DEBUG_FLAGS' => 1,
    'RE_TRIE_MAXBUF' => 1,
    'RS' => 1,
    'SHIFT' => 1,
    'SIG' => 1,
    'SKIP:' => 1,
    'SPLICE' => 1,
    'STDERR' => 1,
    'STDIN' => 1,
    'STDOUT' => 1,
    'STORE' => 1,
    'STORESIZE' => 1,
    'SUBSCRIPT_SEPARATOR' => 1,
    'SUBSEP' => 1,
    'SYSTEM_FD_MAX' => 1,
    'TAINT' => 1,
    'TIEARRAY' => 1,
    'TIEHANDLE' => 1,
    'TIEHASH' => 1,
    'TIESCALAR' => 1,
    'TODO:' => 1,
    'UID' => 1,
    'UNICODE' => 1,
    'UNITCHECK' => 1,
    'UNSHIFT' => 1,
    'UNTIE' => 1,
    'UTF8CACHE' => 1,
    'UTF8LOCALE' => 1,
    'VERSION' => 1,
    'WARNING' => 1,
    'WARNING_BITS' => 1,
    'WIN32_SLOPPY_STAT' => 1,
    'WRITE' => 1,
    '_' => 1,
    '__DATA__' => 1,
    '__DIE__' => 1,
    '__END__' => 1,
    '__FILE__' => 1,
    '__LINE__' => 1,
    '__PACKAGE__' => 1,
    '__WARN__' => 1,
    'a' => 1,
    'abs' => 1,
    'abs2rel' => 1,
    'accept' => 1,
    'alarm' => 1,
    'and' => 1,
    'atan2' => 1,
    'b' => 1,
    'back' => 1,
    'basename' => 1,
    'begin' => 1,
    'bind' => 1,
    'binmode' => 1,
    'bless' => 1,
    'break' => 1,
    'builder' => 1,
    'caller' => 1,
    'can' => 1,
    'can_ok' => 1,
    'canonpath' => 1,
    'carp' => 1,
    'case_tolerant' => 1,
    'catdir' => 1,
    'catfile' => 1,
    'catpath' => 1,
    'chdir' => 1,
    'chmod' => 1,
    'chomp' => 1,
    'chop' => 1,
    'chown' => 1,
    'chr' => 1,
    'chroot' => 1,
    'close' => 1,
    'closedir' => 1,
    'cluck' => 1,
    'cmp' => 1,
    'cmp_ok' => 1,
    'confess' => 1,
    'connect' => 1,
    'continue' => 1,
    'copy' => 1,
    'cos' => 1,
    'cp' => 1,
    'croak' => 1,
    'crypt' => 1,
    'curdir' => 1,
    'cut' => 1,
    'dbmclose' => 1,
    'dbmopen' => 1,
    'defined' => 1,
    'delete' => 1,
    'devnull' => 1,
    'diag' => 1,
    'die' => 1,
    'dirname' => 1,
    'do' => 1,
    'dump' => 1,
    'each' => 1,
    'else' => 1,
    'elsif' => 1,
    'end' => 1,
    'endgrent' => 1,
    'endhostent' => 1,
    'endnetent' => 1,
    'endprotoent' => 1,
    'endpwent' => 1,
    'endservent' => 1,
    'eof' => 1,
    'eq' => 1,
    'eq_array' => 1,
    'eq_hash' => 1,
    'eq_set' => 1,
    'eval' => 1,
    'exec' => 1,
    'exists' => 1,
    'exit' => 1,
    'exp' => 1,
    'fail' => 1,
    'fcntl' => 1,
    'file_name_is_absolute' => 1,
    'fileno' => 1,
    'fileparse' => 1,
    'fileparse_set_fstype' => 1,
    'find' => 1,
    'finddepth' => 1,
    'flock' => 1,
    'for' => 1,
    'foreach' => 1,
    'fork' => 1,
    'format' => 1,
    'formline' => 1,
    'freeze' => 1,
    'ge' => 1,
    'getc' => 1,
    'getgrent' => 1,
    'getgrgid' => 1,
    'getgrnam' => 1,
    'gethostbyaddr' => 1,
    'gethostbyname' => 1,
    'gethostent' => 1,
    'getlogin' => 1,
    'getnetbyaddr' => 1,
    'getnetbyname' => 1,
    'getnetent' => 1,
    'getpeername' => 1,
    'getpgrp' => 1,
    'getppid' => 1,
    'getpriority' => 1,
    'getprotobyname' => 1,
    'getprotobynumber' => 1,
    'getprotoent' => 1,
    'getpwent' => 1,
    'getpwnam' => 1,
    'getpwuid' => 1,
    'getservbyname' => 1,
    'getservbyport' => 1,
    'getservent' => 1,
    'getsockname' => 1,
    'getsockopt' => 1,
    'glob' => 1,
    'gmtime' => 1,
    'goto' => 1,
    'grep' => 1,
    'gt' => 1,
    'head1' => 1,
    'head2' => 1,
    'head3' => 1,
    'head4' => 1,
    'hex' => 1,
    'if' => 1,
    'index' => 1,
    'int' => 1,
    'ioctl' => 1,
    'is' => 1,
    'is_deeply' => 1,
    'isa' => 1,
    'isa_ok' => 1,
    'isnt' => 1,
    'item' => 1,
    'join' => 1,
    'keys' => 1,
    'kill' => 1,
    'last' => 1,
    'lc' => 1,
    'lcfirst' => 1,
    'le' => 1,
    'length' => 1,
    'like' => 1,
    'link' => 1,
    'listen' => 1,
    'local' => 1,
    'localtime' => 1,
    'lock' => 1,
    'log' => 1,
    'longmess' => 1,
    'lstat' => 1,
    'lt' => 1,
    'm' => 1,
    'map' => 1,
    'mkdir' => 1,
    'mkdtemp' => 1,
    'mkpath' => 1,
    'mkstemp' => 1,
    'mkstemps' => 1,
    'mktemp' => 1,
    'move' => 1,
    'msgctl' => 1,
    'msgget' => 1,
    'msgrcv' => 1,
    'msgsnd' => 1,
    'mv' => 1,
    'my' => 1,
    'ne' => 1,
    'next' => 1,
    'no' => 1,
    'no_upwards' => 1,
    'not' => 1,
    'oct' => 1,
    'ok' => 1,
    'open' => 1,
    'opendir' => 1,
    'or' => 1,
    'ord' => 1,
    'our' => 1,
    'over' => 1,
    'pack' => 1,
    'package' => 1,
    'pass' => 1,
    'path' => 1,
    'pipe' => 1,
    'plan' => 1,
    'pod' => 1,
    'pop' => 1,
    'pos' => 1,
    'print' => 1,
    'printf' => 1,
    'prototype' => 1,
    'push' => 1,
    'q' => 1,
    'qq' => 1,
    'qr' => 1,
    'quotemeta' => 1,
    'qw' => 1,
    'qx' => 1,
    'rand' => 1,
    'read' => 1,
    'readdir' => 1,
    'readline' => 1,
    'readlink' => 1,
    'readpipe' => 1,
    'recv' => 1,
    'redo' => 1,
    'ref' => 1,
    'rel2abs' => 1,
    'rename' => 1,
    'require' => 1,
    'require_ok' => 1,
    'reset' => 1,
    'return' => 1,
    'reverse' => 1,
    'rewinddir' => 1,
    'rindex' => 1,
    'rmdir' => 1,
    'rmscopy' => 1,
    'rmtree' => 1,
    'rootdir' => 1,
    's' => 1,
    'safe_level' => 1,
    'say' => 1,
    'scalar' => 1,
    'seek' => 1,
    'seekdir' => 1,
    'select' => 1,
    'semctl' => 1,
    'semget' => 1,
    'semop' => 1,
    'send' => 1,
    'setgrent' => 1,
    'sethostent' => 1,
    'setnetent' => 1,
    'setpgrp' => 1,
    'setpriority' => 1,
    'setprotoent' => 1,
    'setpwent' => 1,
    'setservent' => 1,
    'setsockopt' => 1,
    'shift' => 1,
    'shmctl' => 1,
    'shmget' => 1,
    'shmread' => 1,
    'shmwrite' => 1,
    'shortmess' => 1,
    'shutdown' => 1,
    'sin' => 1,
    'skip' => 1,
    'sleep' => 1,
    'socket' => 1,
    'socketpair' => 1,
    'sort' => 1,
    'splice' => 1,
    'split' => 1,
    'splitdir' => 1,
    'splitpath' => 1,
    'sprintf' => 1,
    'sqrt' => 1,
    'srand' => 1,
    'stat' => 1,
    'state' => 1,
    'study' => 1,
    'sub' => 1,
    'substr' => 1,
    'symlink' => 1,
    'syntax' => 1,
    'syscall' => 1,
    'sysopen' => 1,
    'sysread' => 1,
    'sysseek' => 1,
    'system' => 1,
    'syswrite' => 1,
    'tell' => 1,
    'telldir' => 1,
    'tempdir' => 1,
    'tempfile' => 1,
    'thaw' => 1,
    'tie' => 1,
    'tied' => 1,
    'time' => 1,
    'times' => 1,
    'tmpdir' => 1,
    'tmpfile' => 1,
    'tmpnam' => 1,
    'todo_skip' => 1,
    'tr' => 1,
    'truncate' => 1,
    'uc' => 1,
    'ucfirst' => 1,
    'umask' => 1,
    'undef' => 1,
    'unless' => 1,
    'unlike' => 1,
    'unlink' => 1,
    'unlink0' => 1,
    'unpack' => 1,
    'unshift' => 1,
    'untie' => 1,
    'until' => 1,
    'updir' => 1,
    'use' => 1,
    'use_ok' => 1,
    'utime' => 1,
    'values' => 1,
    'variables' => 1,
    'vec' => 1,
    'wait' => 1,
    'waitpid' => 1,
    'wantarray' => 1,
    'warn' => 1,
    'while' => 1,
    'write' => 1,
    'xor' => 1,
    'y' => 1
);

# @param string $word    any word
# @return int    1 or 0
sub is_keyword($) {
    my $word = shift;
    exists $words{$word} ? 1 : 0;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Pistachio::Keywords::Perl5 - provides is_keyword()

=head1 VERSION

version 0.09

=head1 SYNOPSIS

 use Pistachio::Keywords::Perl5 'is_keyword';
 print is_keyword 'package'; # 1
 print is_keyword 'foobar';  # 0

=head1 AUTHOR

Joel Dalley <joeldalley@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Joel Dalley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
