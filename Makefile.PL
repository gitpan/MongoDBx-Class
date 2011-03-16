
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Flexible ORM for MongoDB databases',
  'AUTHOR' => 'Ido Perlmuter <ido@ido50.net>',
  'BUILD_REQUIRES' => {
    'DateTime' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MongoDBx-Class',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MongoDBx::Class',
  'PREREQ_PM' => {
    'Carp' => '0',
    'DateTime::Format::W3CDTF' => '0',
    'Module::Load' => '0',
    'Module::Pluggable' => '0',
    'MongoDB' => '0.40',
    'MongoDB::Collection' => '0',
    'MongoDB::Connection' => '0',
    'MongoDB::Cursor' => '0',
    'MongoDB::Database' => '0',
    'Moose' => '0',
    'Moose::Exporter' => '0',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.7',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



