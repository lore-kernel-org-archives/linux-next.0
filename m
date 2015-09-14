From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.3-rc1 - merge window closed)
Date: Mon, 14 Sep 2015 10:40:18 +1000
Message-ID: <20150914104018.72bce0b1@canb.auug.org.au>
References: <CA+55aFyS18D6gzgdMBBQ++ycUfOeZYe=KXg1GdXpRVvP-RxZxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39088 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753209AbbINAkU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Sep 2015 20:40:20 -0400
In-Reply-To: <CA+55aFyS18D6gzgdMBBQ++ycUfOeZYe=KXg1GdXpRVvP-RxZxw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20150831 was the first linux-next after
the merge window opened.)

Commits in v4.3-rc1 (relative to v4.2):            10756
Commits in next-20150831:                          10762
Commits with the same SHA1:                         9416
Commits with the same patch_id:                      673 (1)
Commits with the same subject line:                   86 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20150831:     10175 94%

Some breakdown of the list of extra commits (relative to next-20150831)
in -rc1:

Top ten first word of commit summary:

     76 drm
     39 net
     37 ib
     18 perf
     18 ixgbe
     17 cpufreq
     13 input
     12 flow_dissector
     11 ntb
     11 kvm

Top ten authors:

     14 viresh.kumar@linaro.org
     14 trond.myklebust@primarydata.com
     12 tom@herbertland.com
     12 daniel@iogearbox.net
     11 alexander.deucher@amd.com
      9 jy0922.shim@samsung.com
      9 bart.vanassche@sandisk.com
      8 ville.syrjala@linux.intel.com
      8 donald.c.skidmore@intel.com
      8 christian.koenig@amd.com

Top ten commiters:

    114 davem@davemloft.net
     45 dledford@redhat.com
     36 rafael.j.wysocki@intel.com
     32 alexander.deucher@amd.com
     29 torvalds@linux-foundation.org
     21 jani.nikula@intel.com
     20 acme@redhat.com
     19 jeffrey.t.kirsher@intel.com
     17 idryomov@gmail.com
     16 trond.myklebust@primarydata.com

There are also 587 commits in next-20150831 that didn't make it into
v4.3-rc1.  128 are from the kdbus tree and 14 from the orangefs tree
which were not merged by Linus for this release.

Top ten first word of commit summary:

    101 kdbus
     52 ib
     40 i2c
     32 arm
     27 mm
     15 selftests
     14 page-flags
     13 orangefs
     13 documentation
     12 parse_integer

Top ten authors:

     66 dh.herrmann@gmail.com
     47 mike.marciniszyn@intel.com
     44 akpm@linux-foundation.org
     31 sergei@s15v.net
     21 daniel@zonque.org
     16 kirill.shutemov@linux.intel.com
     16 adobriyan@gmail.com
     13 minchan@kernel.org
     12 wsa+renesas@sang-engineering.com
     12 hubcap@omnibond.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

The commits by dh.herrmann@gmail.com, sergei@s15v.net and
daniel@zonque.org are all from the kdbus tree and those by
hubcap@omnibond.com are all from the orangefs tree.

Top ten commiters:

    186 sfr@canb.auug.org.au
     77 gregkh@linuxfoundation.org
     54 dledford@redhat.com
     51 dh.herrmann@gmail.com
     43 wsa@the-dreams.de
     14 kgene@kernel.org
     11 mathieu.poirier@linaro.org
     10 root@logtruck.clemson.edu
     10 daniel.vetter@ffwll.ch
      9 paulmck@linux.vnet.ibm.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

The commits from gregkh@linuxfoundation.org and dh.herrmann@gmail.com
are from the kdbus tree and those from root@logtruck.clemson.edu are
from the orangefs tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
