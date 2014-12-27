package Mojolicious::Plugin::Angular::MaterialDesign;
use 5.008001;
use strict;
use warnings;

use Mojo::Base 'Mojolicious::Plugin';
use File::Spec::Functions 'catdir';
use Cwd ();

our $VERSION = '0.6';

my @DEFAULT_CSS_FILES = qw( angular-material.min.css );
my @DEFAULT_JS_FILES  = qw( angular-material.min.js);

sub asset_path {
    my ( $class, $type ) = @_;
    my $path = Cwd::abs_path(__FILE__);
    $path =~ s!\.pm$!!;
    return $path;
}

sub register {
    my ( $self, $app, $config ) = @_;

    $app->plugin('AssetPack') unless eval { $app->asset };

    $config->{css} ||= [@DEFAULT_CSS_FILES];
    $config->{js}  ||= [@DEFAULT_JS_FILES];
    $config->{jquery} //= 1;

    push @{ $app->static->paths }, $self->asset_path;

    # TODO: 'bootstrap_resources.scss'
    if ( @{ $config->{css} } ) {
        $app->asset( 'materialdesign.css' => map {"/css/$_"}
                @{ $config->{css} } );
    }

    if ( @{ $config->{js} } ) {
        $app->asset( 'materialdesign.js' => map {"/js/$_"} @{ $config->{js} },
        );
    }

}

1;
__END__

=encoding utf-8

=head1 NAME

Mojolicious::Plugin::Angular::MaterialDesign - It's new $module

=head1 SYNOPSIS

    use Mojolicious::Plugin::Angular::MaterialDesign;

=head1 DESCRIPTION

Mojolicious::Plugin::Angular::MaterialDesign is ...

=head1 LICENSE

Copyright (C) mudler.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

mudler E<lt>mudler@dark-lab.netE<gt>

=cut

