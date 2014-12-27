requires 'Module::Build', '0.35';
requires 'Mojo::Base';
requires 'perl', '5.008001';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on test => sub {
    requires 'Mojolicious';
    requires 'Test::Mojo';
    requires 'Test::More', '0.98';
};
