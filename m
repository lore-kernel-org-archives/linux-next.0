From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.10-rc1)
Date: Mon, 26 Dec 2016 23:17:55 +1100
Message-ID: <20161226231755.00386f40@canb.auug.org.au>
References: <CA+55aFy1TygeUnotbhHiOgBzCQDC+iPUw_nZuCRpUpKFP9pdug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFy1TygeUnotbhHiOgBzCQDC+iPUw_nZuCRpUpKFP9pdug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Miao <realmz6@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi All,

On Sun, 25 Dec 2016 16:41:46 -0800 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> It's Christmas Day, and it's two weeks since the merge window opened.
> Thus, the merge window is now closed.

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20161212 was the first linux-next after
the merge window opened.)

Commits in v4.10-rc1 (relative to v4.9):           11455
Commits in next-20161212:                          10625
Commits with the same SHA1:                         9927
Commits with the same patch_id:                      437 (1)
Commits with the same subject line:                   25 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20161212:     10389 90%

Some breakdown of the list of extra commits (relative to next-20161212)
in -rc1:

Top ten first word of commit summary:

    153 ib
     64 drm
     46 x86
     38 i40iw
     34 net
     33 s390
     33 input
     30 ubifs
     27 perf
     26 btrfs

Top ten authors:

     32 tglx@linutronix.de
     27 richard@nod.at
     26 bart.vanassche@sandisk.com
     22 henry.orosco@intel.com
     20 leon@kernel.org
     19 jeffm@suse.com
     18 mst@redhat.com
     18 idryomov@gmail.com
     15 trond.myklebust@primarydata.com
     13 vinod.koul@intel.com

Top ten commiters:

    225 dledford@redhat.com
    115 davem@davemloft.net
     63 tglx@linutronix.de
     34 torvalds@linux-foundation.org
     34 mst@redhat.com
     33 schwidefsky@de.ibm.com
     33 acme@redhat.com
     32 idryomov@gmail.com
     32 dmitry.torokhov@gmail.com
     31 richard@nod.at

There are also 236 commits in next-20161212 that didn't make it into
v4.10-rc1.

Top ten first word of commit summary:

     24 arm
     21 rcu
      9 keys
      9 coresight
      9 btrfs
      8 vfs
      8 torture
      8 thermal
      6 mm
      6 bf609

Top ten authors:

     24 paulmck@linux.vnet.ibm.com
     15 mszeredi@redhat.com
     14 akpm@linux-foundation.org
     11 olof@lixom.net
     11 dhowells@redhat.com
     10 viro@zeniv.linux.org.uk
      8 wangxg.fnst@cn.fujitsu.com
      6 vitalywool@gmail.com
      6 colin.king@canonical.com
      5 sonic.zhang@analog.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

     39 sfr@canb.auug.org.au
     36 paulmck@linux.vnet.ibm.com
     16 steven@ubuntu-virtualbox.(none)
     15 mszeredi@redhat.com
     13 olof@lixom.net
     11 dhowells@redhat.com
     10 viro@zeniv.linux.org.uk
     10 edubezval@gmail.com
      9 mathieu.poirier@linaro.org
      9 dsterba@suse.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

Turns out that steven@ubuntu-virtualbox.(none) is Steven Miao
<realmz6@gmail.com> and all those commits are old stuff left over in
the blackfin tree since March, 2016 - it would be nice if they were
cleaned up.


-- 
Cheers,
Stephen Rothwell
