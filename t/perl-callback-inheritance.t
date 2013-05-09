#!/usr/bin/env perl
use strict;
use warnings;

use Template::Swig;
use Test::Exception;
use Test::More;
use File::Slurp qw(read_file);

my $perl_handler = sub {
	my ($filename, $encoding) = @_;
	if ( -e $filename ) {
		my $template = read_file($filename);
		return $template;
	} else {
		die "Unable to locate $filename";
	}
};

my $expected_output = <<EOT;
<!doctype html>
<head>
	<title>Custom Title!</title>
</head>
<body>
	custom content too!
</body>
EOT

my ($output, $swig);

$swig = Template::Swig->new(
	extends_callback => $perl_handler,
	template_dir => './t',
);

dies_ok { $swig->compileFromFile('/unkown/path/template.t') } "compileFromFile will die if an invalid template is passed";
lives_ok { $swig->compileFromFile('page.html') } "compileFromFile will live if a template is found";

$output = $swig->render('page.html');
$output = trim_whitespace($output);
$expected_output = trim_whitespace($expected_output);

is($output, $expected_output, 'rendered output matches what we expect');

done_testing;

sub trim_whitespace {

	my ($string) = @_;

	$string =~ s/\s+/ /gs;
	$string =~ s/\s+$//gs;

	return $string;
}
