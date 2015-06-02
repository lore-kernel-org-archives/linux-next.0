From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [linux-next] please include init-v4.1-rc6 branch for v4.2
Date: Tue, 2 Jun 2015 19:23:18 -0400
Message-ID: <20150602232318.GI29898@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Please include init-v4.1-rc6 branch of:
	git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git

This is a merge of several branches containing a scaled down version of
the work done earlier for init cleanup on a baseline of v4.1-rc6 aimed
at inclusion during 4.2-rc1 merge window.  We had this in next quite
some time ago, but it never got pulled:

https://lkml.kernel.org/r/20140207092505.4c42d130faff151659a908f9@canb.auug.org.au

There was no clear reason why it never got merged, so I took a guess and
decided to factor it into separate components that will each get their
own pull request, plus drop all the trivial changes as described here:

https://lkml.kernel.org/r/1433276168-21550-1-git-send-email-paul.gortmaker@windriver.com

This makes it easier to review and digest, so fingers crossed this time...

I've been cross building it and test merging it with next on and off for
several weeks now, so it should be trouble free (hopefully).  There will
be two relatively trivial conflicts upon merging to next:

1) A removal of a __cpuinit from this tree will conflict with a removal
   of the whole code block contaning the original __cpuinit in the file
   arch/arm/mach-keystone/platsmp.c

2) A removal of a __CPUINIT from this tree will conflict with a complete
   file removal (removed, not renamed) of arch/arm/mach-hisi/headsmp.S

This should be fine at or near the end of your merge list, so if there
is any fallout, it can be cleaned up here in this content and not a
burden to other tree owners.

Assuming I can get Linus to pull the chunks this time, it should be a
one shot (one version) tree from a linux-next point of view.

Thanks!
Paul.
