

@lines = <>;

$count = shift(@lines);
foreach(0 .. $count - 1) {
  $line = shift(@lines);
  chomp $line;
  my @split_vals = split(/\+/, $line);
  print unparse(parse($split_vals[0]) + parse($split_vals[1])), "\n";
}

sub unparse($) {
  my($val) = @_;

  return 'CONCORDIA CUM VERITATE' if($val > 1000);

  my @digits = ('M', 'D', 'C', 'L', 'X', 'V', 'I');
  my %digitVals = ('M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1);

  my %digitReplace = (
    'DCCCC' => 'CM',
    'CCCC' => 'CD',
    'LXXXX' => 'XC',
    'XXXX' => 'XL',
    'VIIII' => 'IX',
    'IIII' => 'IV'
  );

  my $output = '';

  while($val > 0) {
    foreach my $digit (@digits) {
      $dv = $digitVals{$digit};
      next if($dv > $val);
      $val -= $dv;
      $output .= $digit;
      last;
    }
  }

  $output =~ s/ ( [DLV]? (?: CCCC|XXXX|IIII) ) / $digitReplace{$1} /egx;

  return $output;
}

sub parse{
  my %digits = ("M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1);

  my @letters = split(//, $_[0]);
  my $sum = 0;
  my $current = 0;
  my $prev = 0;
  for ($count = (scalar (@letters)); $count > -1; $count--){
    $current = $digits{$letters[$count]};
    if ($current < $prev){
        $sum -= int($digits{$letters[$count]});
      }else{
        $sum += int($digits{$letters[$count]});
      }
    $prev = $current;
  }
  return $sum;
}