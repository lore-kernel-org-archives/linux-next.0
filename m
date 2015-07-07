From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.2-rc1)
Date: Tue, 7 Jul 2015 15:50:23 +1000
Message-ID: <20150707155023.09fd683f@canb.auug.org.au>
References: <CA+55aFxmm7THBsCK62esr=JCcHpn6nmReGKqPp0inUrhbkveuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44363 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754823AbbGGFuZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2015 01:50:25 -0400
In-Reply-To: <CA+55aFxmm7THBsCK62esr=JCcHpn6nmReGKqPp0inUrhbkveuA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Hi all,

[These will be easier in the future as I have now scripted this message]

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20150623 was the first linux-next after
the merge window opened.)

Commits in v4.2-rc1 (relative to v4.1):            12092
Commits in next-20150623:                          11851
Commits with the same SHA1:                        10679
Commits with the same patch_id:                      615 (1)
Commits with the same subject line:                   54 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20150623:     11294 93%

Some breakdown of the list of extra commits (relative to next-20150623)
in -rc1:

Top ten first word of commit summary:

     54 perf
     52 drm
     46 net
     35 kvm
     25 btrfs
     25 acpica
     24 arcv2
     22 ntb
     22 ceph
     13 nfs

Top ten authors:

     32 jolsa@kernel.org
     29 vgupta@synopsys.com
     26 anand.jain@oracle.com
     24 tglx@linutronix.de
     23 zyan@redhat.com
     15 human.hwang@samsung.com
     15 guangrong.xiao@linux.intel.com
     14 idryomov@gmail.com
     14 christian.koenig@amd.com
     13 lv.zheng@intel.com

Top ten commiters:

    122 davem@davemloft.net
     53 acme@redhat.com
     40 idryomov@gmail.com
     36 pbonzini@redhat.com
     34 rafael.j.wysocki@intel.com
     32 vgupta@synopsys.com
     30 tglx@linutronix.de
     30 alexander.deucher@amd.com
     29 trond.myklebust@primarydata.com
     26 dsterba@suse.cz

There are also 503 commits in next-20150623 that didn't make it into
v4.2-rc1.

Top ten first word of commit summary:

     51 kdbus
     31 userfaultfd
     31 arm
     23 rcu
     21 mm
     19 ocfs2
     17 documentation
     17 coresight
     16 cris
     14 page-flags

Top ten authors:

     37 akpm@linux-foundation.org
     30 aarcange@redhat.com
     29 sergei@s15v.net
     21 dh.herrmann@gmail.com
     20 rabin@rab.in
     20 daniel@zonque.org
     19 paulmck@linux.vnet.ibm.com
     16 kirill.shutemov@linux.intel.com
     14 ttynkkynen@nvidia.com
     13 treding@nvidia.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    153 mpe@ellerman.id.au
     59 gregkh@linuxfoundation.org
     32 paulmck@linux.vnet.ibm.com
     32 mathieu.poirier@linaro.org
     30 treding@nvidia.com
     26 jespern@axis.com
     19 dh.herrmann@gmail.com
     18 mmarek@suse.cz
     17 sfr@canb.auug.org.au
     16 arnd@arndb.de

Those commits by mpe@ellerman.id.au and me are from the quilt series
(mainly Andrew's mmotm tree).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
