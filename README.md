# Template::Swig

Perl interface to Django-inspired Swig templating engine.

### Synopsis

```perl
my $swig = Template::Swig->new;

$swig->compile('Welcome, {{name}}', 'message');
my $output = $swig->render('message', { name => 'Arthur' });
```

### Description

Template::Swig uses [JavaScript::V8](http://search.cpan.org/perldoc?JavaScript::V8) and [Paul Armstrong's Swig](https://github.com/paularmstrong/swig/) templating engine to provide fast Django-inspired templating in a Perl context.  Templates are compiled to JavaScript functions and stored in memory, then executed each time they're rendered.

Swig's feature list includes multiple inheritance, formatter and helper functions, macros, auto-escaping, and custom tags.  See the [Swig Documentation](https://github.com/paularmstrong/swig/blob/master/docs/README.md) for more.

### Methods

#### new

Initialize a swig instance.

#### compile($template\_name, $swig\_source)

Compile a template given, given a template name and swig template source as a string.

#### render($template\_name, $data)

Render a template, given a name and a reference to a hash of data to interpolate.

### Template Examples

Iterate through a list:

```html
{% for image in images %}
    <img src="{{ image.src }}" width="{{ image.width }}" height="{{ image.height }}">
{% else %}
    <div class="message">No images to show</div>
{% endfor %}
```

Custom helpers / filters:

```html
{{ created|date('r') }}
```

#### Inheritance

In main.html:

```
{% block greeting %}
    Hi, there.
{% endblock %}
```
In custom.html: 

```
{% extends 'main.html' %}
    
{% block greeting %}
    Welcome, {{ name }}
{% endblock %}
```

### See Also

[Dotiac::DTL](http://search.cpan.org/perldoc?Dotiac::DTL), [Text::Caml](http://search.cpan.org/perldoc?Text::Caml), [Template::Toolkit](http://search.cpan.org/perldoc?Template::Toolkit)
