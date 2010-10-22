From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the xen tree with the tip tree
Date: Fri, 22 Oct 2010 10:01:29 +0200
Message-ID: <20101022080129.GA8474@elte.hu>
References: <20101022140335.c4a3a48f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:46898 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752642Ab0JVIB5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Oct 2010 04:01:57 -0400
Content-Disposition: inline
In-Reply-To: <20101022140335.c4a3a48f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gianluca Guida <gianluca.guida@citrix.com>, Yinghai Lu <yinghai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the xen tree got a conflict in
> arch/x86/mm/init_32.c between commit
> 1d931264af0f10649b35afa8fbd2e169da51ac08 ("x86-32, memblock: Make
> add_highpages honor early reserved ranges") from the tip tree and commit
> 07147a06ac3b1b028124ea00ba44e69eb8ea7685 ("x86/32: honor reservations of
> high memory") from the xen tree.

Jeremy,

Commit 07147a06ac is all over the x86 tree:

  arch/x86/mm/init_32.c     |   42 ++++++++++++++++++++++++++++++++----------
  include/linux/early_res.h |    3 +++
  kernel/early_res.c        |   30 ++++++++++++++++++++++++++++++
  3 files changed, 65 insertions(+), 10 deletions(-)

... but there's no x86 person who acked it or was Cc:-ed to this commit AFAICS. It 
was not even posted to lkml! Nor does the commit title suggest that it affects core 
kernel code as well.

Also, the AuthorDate field is a total lie:

  commit 07147a06ac3b1b028124ea00ba44e69eb8ea7685
  Author:     Gianluca Guida <gianluca.guida@citrix.com>
  AuthorDate: Sun Aug 2 01:25:48 2009 +0100
  Commit:     Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
  CommitDate: Mon Oct 4 14:22:11 2010 -0700

    x86/32: honor reservations of high memory

This commit was written on Aug 2 2009, really? kernel/early_res.c, which is modified 
by half of this commit, was _CREATED_ in February 2010 ...

I realize that some original patch, much different from this one, was probably 
written in 2009, and that via a series of undocumented rebases and modifications to 
the patch you achieved this state.

Crap like that is just _NOT_ acceptable, and you know that perfectly well - if you 
do this to arch/x86/ i'll be forced to ask for the Xen tree to be removed from 
linux-next and be done via the x86 tree again.

	Ingo
