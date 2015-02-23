From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Linux 4.0-rc1 out..
Date: Mon, 23 Feb 2015 09:22:00 +0100
Message-ID: <CA+icZUUAGrKruSCmivviCkEWGt_YRgW3CSeC1e7urnAbRJqV8Q@mail.gmail.com>
References: <CA+55aFzS==STcTbwabdvw=7_xX08kkUd=g2Q4XbWJzKbpjyN1A@mail.gmail.com>
	<20150223161541.22df98cc@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:63213 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752050AbbBWIWB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 03:22:01 -0500
In-Reply-To: <20150223161541.22df98cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Thorsten Leemhuis <thl@ct.de>

On Mon, Feb 23, 2015 at 6:15 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> As usual, the executive friendly graph is at
> http://neuling.org/linux-next-size.html :-)
>
> I haven't done these for a while, so I haven't included a previous
> release for comparison.
>
> (No merge commits counted, next-20150209 was the last linux-next before
> the merge window opened.)
>
> Commits in v4.0-rc1 (relative to v3.19):   8950
> Commits in next-20140804:                  8279

[ CC Thorsten Leemhuis ]

Hi Stephen,

thank you for a statistical overview.
It should be interesting and document the Linux-next development.
Especially what came in from last -next release (release before
v4.0-rc1) into v4.0-rc1 - as you write this was next-20150209.

Is that a typo next-20*14*0804?

How did you generate your statistcs (number of commits, top-ten, etc.)?
Thorsten is doing a fantastic job by explaining what is going on in
the Linux-kernel development in his "Kernel-Log" [1] article series
(German). On the last page he describes how he extracted the "numbers"
(please see [2]).
May have a look at it?

Personally, I don't like any of Linus' -rc1 release announcement (but
I read them).
What are the pearls - what is "worth mentioning" - what new stuff is
worth testing (scripts/diffconfig last-stable-config
latest-rc1-config)?
As someone interested in Linux-kernel I expect to get these
informations more "user-friendly".
( IMO, It is irresponsible that user walk through all commits or
merge-commits. )

As a conclusion:
I am interested in such statistics and thank you for this email.

Thanks.

Regards,
- Sedat -

[1] http://www.heise.de/open/kernel-log-3007.html
[2] http://www.heise.de/open/artikel/Die-Neuerungen-von-Linux-3-19-2541595.html?artikelseite=3

> Commits with the same SHA1:                7492
> Commits with the same patch_id:             452 (1)
> Commits with the same subject line:          70 (1)
>
> (1) not counting those in the lines above.
>
> So commits in -rc1 that were in next-20150209:  8014    89.5%
>
> Some breakdown of the list of extra commits (relative to next-20150209)
> in -rc1:
>
> Top ten first word of commit summary:
>
>     103 mips
>      79 staging
>      37 drm
>      32 lguest
>      25 ib
>      22 arm
>      19 rdma
>      19 input
>      19 alsa
>      18 sunrpc
>
> Top ten authors:
>
>      51 rusty@rustcorp.com.au
>      50 markos.chandras@imgtec.com
>      25 trond.myklebust@primarydata.com
>      21 leonid.yegoshin@imgtec.com
>      19 hch@lst.de
>      17 richard.alpe@ericsson.com
>      16 abbotti@mev.co.uk
>      15 zyan@redhat.com
>      15 arnd@arndb.de
>      14 dhowells@redhat.com
>
> Top ten commiters:
>
>      81 gregkh@linuxfoundation.org
>      75 davem@davemloft.net
>      64 markos.chandras@imgtec.com
>      59 rusty@rustcorp.com.au
>      47 torvalds@linux-foundation.org
>      43 roland@purestorage.com
>      38 ralf@linux-mips.org
>      31 trond.myklebust@primarydata.com
>      26 mingo@kernel.org
>      26 idryomov@gmail.com
>
> There are also 265 commits in next-20150209 that didn't make it into
> v4.0-rc1.
>
> Top ten first word of commit summary:
>
>      25 rcu
>      24 arm
>      20 selftests
>      19 mm
>      11 arm-soc
>       6 documentation
>       5 tracing
>       5 staging
>       5 libceph
>       5 ceph
>
> Top ten authors:
>
>      36 akpm@linux-foundation.org
>      34 paulmck@linux.vnet.ibm.com
>      20 shuahkh@osg.samsung.com
>      11 olof@lixom.net
>       9 minchan@kernel.org
>       7 rostedt@goodmis.org
>       6 zyan@redhat.com
>       6 behanw@converseincode.com
>       5 tapaswenipathak@gmail.com
>       4 namjae.jeon@samsung.com
>
> Some of Andrew's patches are fixes for other patches in his tree (and
> have been merged into those).
>
> Top ten commiters:
>
>     102 sfr@canb.auug.org.au
>      35 paulmck@linux.vnet.ibm.com
>      21 shuahkh@osg.samsung.com
>      11 olof@lixom.net
>      10 idryomov@redhat.com
>       9 kgene@kernel.org
>       7 rostedt@goodmis.org
>       7 behanw@converseincode.com
>       7 arnd@arndb.de
>       4 treding@nvidia.com
>
> Those commits by me are from the quilt series (mainly Andrew's mmotm
> tree).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
