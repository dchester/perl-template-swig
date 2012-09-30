# NAME

Template::Swig - Perl interface to Django-inspired Swig templating engine.

# SYNOPSIS

    my $swig = Template::Swig->new;

    $swig->compile('Welcome, {{name}}', 'message');
    my $output = $swig->render('message', { name => 'Arthur' });

# DESCRIPTION

Template::Swig uses JavaScript::V8 and Paul Armstrong's Swig templating engine to provide fast Django-inspired templating in a Perl context.  Templates are compiled to JavaScript functions and stored in memory, then executed each time they're rendered.

Swig's feature list includes multiple inheritance, formatter and helper functions, macros, auto-escaping, and custom tags.  See the Swig Documentation for more.

# METHODS

## new

Initialize a swig instance.

## compile($template\_name, $swig\_source)

Compile a template given, given a template name and swig template source as a string.

## render($template\_name, $data)

Render a template, given a name and a reference to a hash of data to interpolate.

# TEMPLATE EXAMPLES

Iterate through a list:

    {% for image in images %}
        <img src="{{ image.src }}" width="{{ image.width }}" height="{{ image.height }}">
    {% else %}
        <div class="message">No images to show</div>
    {% endfor %}

Custom helpers / filters:

    {{ created|date('r') }}

Inheritance:

    // main.html
    

    {% block 'greeting' %}
        Hi, there.
    {% endblock %}
    

    // custom.html
    

    {% extends 'main.html' %}
    

    {% block 'greeting' %}
        Welcome, {{ name }}
    {% endblock %}

# SEE ALSO

[Dotiac::DTL](http://search.cpan.org/perldoc?Dotiac::DTL), [Text::Caml](http://search.cpan.org/perldoc?Text::Caml), [Template::Toolkit](http://search.cpan.org/perldoc?Template::Toolkit)
