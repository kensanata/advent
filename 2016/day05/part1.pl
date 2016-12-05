use Modern::Perl;
use Digest::MD5 qw(md5_hex);

my $prefix = 'abc';
my $i = 0;
my $length = 0;
my $pwd;
while ($length < 8) {
  my $digest = md5_hex($prefix . $i++);
  if ('00000' eq substr($digest, 0, 5)) {
    $pwd .= substr($digest, 5, 1);
    $length++;
    print "$pwd\n";
  }
}
