use Modern::Perl;
use Digest::MD5 qw(md5_hex);

$" = '';
my $prefix = 'abc';
my $i = 0;
my $length = 0;
my @pwd = qw(_ _ _ _ _ _ _ _);
while ($length < 8) {
  my $digest = md5_hex($prefix . $i++);
  if ('00000' eq substr($digest, 0, 5)) {
    my $p = hex(substr($digest, 5, 1));
    next if $p >= 8 or $pwd[$p] ne "_";
    my $c = substr($digest, 6, 1);
    $length++;
    $pwd[$p] = $c;
    print "@pwd\n";
  }
}
