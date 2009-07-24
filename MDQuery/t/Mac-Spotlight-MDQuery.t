use strict;
use warnings;
use Test::More 'no_plan';

use Mac::Spotlight::MDQuery ':constants';
use Mac::Spotlight::MDItem ':constants';

my $query = Mac::Spotlight::MDQuery->new(q/((_kMDItemGroupId = 8) && (true)) && ((kMDItemDisplayName = "text*"cdw))/);
$query->setScope(kMDQueryScopeComputer);
ok defined $query;
$query->execute;
$query->stop;

my @results = $query->getResults;
ok @results > 0;
like $results[0]->get(kMDItemPath), qr/text/i;
