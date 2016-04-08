#!/usr/bin/perl -w

use strict;
use warnings;
use Net::SSH::Perl 'SSH';
use Prompt;

my @remote_host = ("r1-ebc", "r1-lib");

print "Enter username";
my $username = <STDIN>;
chomp $username;

my $filename = '~/.scripts/subnet/pw';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
my $password = <$fh>; chomp $password; utf8::encode ($password);
my $cmd = 'sh run int vlan ';

warn "Starting SSH...";
foreach my $hosts (@remote_host){
  my $ssh = Net::SSH::Perl->new($hosts);
  $ssh->login($username, $password);
    my ($out, $err, $exit) = $ssh->cmd("sh vlan");
    print "$out", "\n";
}
