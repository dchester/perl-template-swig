use strict;

use Template::Swig;
use Test::More;

my $swig = Template::Swig->new;

my $images = [
	{ src => '1.jpg', width => 100, height => 67 },
	{ src => '2.jpg', width => 100, height => 67 },
	{ src => '3.jpg', width => 100, height => 67 },
	{ src => '4.jpg', width => 100, height => 67 },
	{ src => '5.jpg', width => 100, height => 67 }
];

my $template = <<EOT;
{% for image in images -%}
	<img src="{{ image.src }}" width="{{ image.width }}" height="{{ image.height }}">
{% endfor %}
EOT

$swig->compile('images.html', $template);

my $output = $swig->render('images.html', { images => $images });

my $expected_output = <<EOT;
<img src="1.jpg" width="100" height="67">
<img src="2.jpg" width="100" height="67">
<img src="3.jpg" width="100" height="67">
<img src="4.jpg" width="100" height="67">
<img src="5.jpg" width="100" height="67">
EOT

is($output, $expected_output, 'rendered output matches what we expect');

my $swig2 = Template::Swig->new;
my $template2 = <<EOT;
{% if flag1 %}Flag 1{% endif -%}
{% if flag2 %}Flag 2{% endif %}
EOT

$swig2->compile('flags.html', $template2);
$output = $swig2->render('flags.html', { flag1 => 0, flag2 => 1 });

$expected_output = 'Flag 2';
is($output, $expected_output, 'rendered output matches what we expect');

done_testing;
