From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats for v4.4-rc1
Date: Thu, 19 Nov 2015 15:45:19 +1100
Message-ID: <20151119154519.1b37ae39@canb.auug.org.au>
References: <CA+55aFz8NHGxf0cvgQOVAmB=i+g+egty_j6nMYc1YBv4tXAvxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57672 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933754AbbKSEpX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Nov 2015 23:45:23 -0500
In-Reply-To: <CA+55aFz8NHGxf0cvgQOVAmB=i+g+egty_j6nMYc1YBv4tXAvxg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20151103 was the first linux-next after
the merge window opened.)

Commits in v4.4-rc1 (relative to v4.3):            11528
Commits in next-20151103:                          10823
Commits with the same SHA1:                         9957
Commits with the same patch_id:                      404 (1)
Commits with the same subject line:                   51 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20151103:     10412 90%

Some breakdown of the list of extra commits (relative to next-20151103)
in -rc1:

Top ten first word of commit summary:

    136 drm
    116 btrfs
     40 mips
     36 cxlflash
     34 kvm
     28 hpsa
     27 perf
     27 net
     24 megaraid_sas
     17 vfio

Top ten authors:

     32 mrochs@linux.vnet.ibm.com
     30 a.hajda@samsung.com
     24 sumit.saxena@avagotech.com
     24 quwenruo@cn.fujitsu.com
     17 sreekanth.reddy@avagotech.com
     17 dsterba@suse.com
     16 jcmvbkbc@gmail.com
     16 chuck.lever@oracle.com
     15 edumazet@google.com
     15 don.brace@pmcs.com

Top ten commiters:

    107 martin.petersen@oracle.com
     94 davem@davemloft.net
     69 jbottomley@odin.com
     54 clm@fb.com
     48 dsterba@suse.com
     45 bskeggs@redhat.com
     42 torvalds@linux-foundation.org
     41 ralf@linux-mips.org
     32 pbonzini@redhat.com
     30 rostedt@goodmis.org

There are also 411 commits in next-20151103 that didn't make it into
v4.4-rc1.

Top ten first word of commit summary:

     52 mm
     23 orangefs
     23 arm
     18 page-flags
     17 arm-soc
     15 soc
     15 ocfs2
     12 thp
     12 nfsd
     11 media

Top ten authors:

     63 kirill.shutemov@linux.intel.com
     30 akpm@linux-foundation.org
     20 hubcap@omnibond.com
     19 minchan@kernel.org
     19 jlayton@poochiereds.net
     13 olof@lixom.net
     11 sboyd@codeaurora.org
      8 ryan.ding@oracle.com
      8 pankaj.dubey@samsung.com
      7 mathieu.poirier@linaro.org

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    199 sfr@canb.auug.org.au
     24 hubcap@omnibond.com
     20 bfields@redhat.com
     20 agross@codeaurora.org
     13 olof@lixom.net
     12 arnd@arndb.de
     11 wsa@the-dreams.de
     11 mchehab@osg.samsung.com
      9 kgene@kernel.org
      8 peter.chen@freescale.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
