From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 03:00:14 +0200
Message-ID: <20090610010014.GA28345@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain> <20090610003055.GA26492@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52470 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751446AbZFJBAh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 21:00:37 -0400
Content-Disposition: inline
In-Reply-To: <20090610003055.GA26492@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> See for example what happened in linux-next today: Voyager broke 
> x86 and didnt even build, and Stephen had to keep it out of 
> today's linux-next build.

I also took a look at that tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/jejb/voyager-2.6.git master

A couple of quick, mostly high-level observations:

1)

The Voyager bits got rebased _yesterday_. _All_ the commits:

 commit 0ff51d1467af91bca4210b0d09372b6e7ded7524
 Author:     James Bottomley <James.Bottomley@HansenPartnership.com>
 AuthorDate: Mon Feb 23 15:02:04 2009 -0600
 Commit:     James Bottomley <James.Bottomley@HansenPartnership.com>
 CommitDate: Mon Jun 8 09:49:08 2009 -0500

I told James before that he should _not_ rebase:

   http://lkml.org/lkml/2009/2/1/76

In no uncertain terms. He completely ignored me and he messes up 
trees that way again. Now i should pull such a damaged tree while 
all the other x86 contributors we pull from do a thorough job?

( And note that the above link points to _another_ similar incident,
  where James rebased a tree and broke the build. It is a pattern of 
  behavior. )

2)

The tree structure is unacceptable:

 a087b5f: [VOYAGER] x86: add prefill_possible_map to x86_quirks
 f5ef55a: [VOYAGER] x86/mca: make mca_nmi_hook external
 55c8430: [VOYAGER] x86: add {safe,hard}_smp_processor_id to smp_ops
 fd1ab45: Revert "MAINTAINERS - Remove x86/Voyager no longer in tree"
 0ff51d1: Revert "x86: remove the Voyager 32-bit subarch"

That is crap. It starts with a huge 'revert' - which of course 
breaks the tree and needs 16 commits to bring back into action.

It might be OK to _revive_ the source code that way privately - but 
the history completely incorrectly suggests a 'revert'. We revert 
buggy commits.

What we want here is a clean submission, and a tidy, well 
constructed, non-rebased, well-tested Git tree. Or plain email 
submissions initially, because frankly i shouldnt Git-pull such a 
messy tree.

3)

The comments. For example the revert:

 From 0ff51d1467af91bca4210b0d09372b6e7ded7524 Mon Sep 17 00:00:00 2001
 From: James Bottomley <James.Bottomley@HansenPartnership.com>
 Date: Mon, 23 Feb 2009 15:02:04 -0600
 Subject: [PATCH] Revert "x86: remove the Voyager 32-bit subarch"

 This reverts commit 965c7ecaf2e2b083d711a01ab33735a4bdeee1a4.
 ---

That is not how we do reverts! We always give a reason for a revert. 

4)

Small details like standard commit titles in the x86 tree. It 
shouldnt be:

 [VOYAGER] x86: eliminate subarchitecture file do_timer.h

It should be:

 x86: Voyager: Eliminate subarchitecture file do_timer.h

Note the different order and different capitalization.

5)

And as i requested it in an earier thread, quirky platforms should 
be supported via a _single_ quirks file.

That makes it easy to handle and makes it easy to ignore as well. 
It's basically a "weird hardware driver". We have examples of that, 
for example arch/x86/kernel/visws_quirks.c. Voyager will be larger 
than that but it's OK - it's not like it will undergo massive 
development.

Putting it back into arch/x86/mach-voyager/ again reintroduces the 
subarch directory structure we got rid of.

6)

This ordering of subsequent patches:

5c173bb: [VOYAGER] x86: eliminate subarchitecture file do_timer.h
18d3288: [VOYAGER] x86: eliminate subarchitecture file entry_arch.h
42c7289: [VOYAGER] x86: eliminate subarchitecture file setup_arch.h

is totally wrong - it removes something that should not have been 
put there in the first place.

If then Voyager should be added as a clean series of patches: first 
the generic patches that introduce infrastructure changes (to 
x86_quirks and smp_ops, etc.), then a single final patch that adds 
in the Voyager quirks platform driver.

And we've been through similar excercises multiple times before. 

All in one, this tree is quite poor and needs a lot of work.

	Ingo
