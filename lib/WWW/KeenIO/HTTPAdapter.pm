package WWW::KeenIO::HTTPAdapter;

use HTTP::Request::Common;
use LWP::UserAgent;
use Moo;

sub do_request {
  my ($self, $req, $key) = @_;

  my $ua = LWP::UserAgent->new;

  $ua->default_header('Authorization' => $key);

  my $res = $ua->request($req);
  if ($res->is_success) {
    print $res->content;
  }
  else {
    print $res->status_line, "\n";
  }

}

1;
