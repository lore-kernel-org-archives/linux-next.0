From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 14:38:46 +0000
Message-ID: <1244644726.4109.30.camel@mulgrave.site>
References: <1244477423.4079.228.camel@mulgrave.site>
	 <20090609202130.GA5291@elte.hu>
	 <20090610004126.491508c9@lxorguk.ukuu.org.uk>
	 <20090609235647.GE23846@elte.hu>
	 <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
	 <20090610003055.GA26492@elte.hu>  <20090610010014.GA28345@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:36964 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755348AbZFJOiu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 10:38:50 -0400
In-Reply-To: <20090610010014.GA28345@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 2009-06-10 at 03:00 +0200, Ingo Molnar wrote:
> * Ingo Molnar <mingo@elte.hu> wrote:
> 
> > See for example what happened in linux-next today: Voyager broke 
> > x86 and didnt even build, and Stephen had to keep it out of 
> > today's linux-next build.
> 
> I also took a look at that tree:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/voyager-2.6.git master
> 
> A couple of quick, mostly high-level observations:
> 
> 1)
> 
> The Voyager bits got rebased _yesterday_. _All_ the commits:
> 
>  commit 0ff51d1467af91bca4210b0d09372b6e7ded7524
>  Author:     James Bottomley <James.Bottomley@HansenPartnership.com>
>  AuthorDate: Mon Feb 23 15:02:04 2009 -0600
>  Commit:     James Bottomley <James.Bottomley@HansenPartnership.com>
>  CommitDate: Mon Jun 8 09:49:08 2009 -0500
> 
> I told James before that he should _not_ rebase:
> 
>    http://lkml.org/lkml/2009/2/1/76
> 
> In no uncertain terms. He completely ignored me and he messes up 
> trees that way again. Now i should pull such a damaged tree while 
> all the other x86 contributors we pull from do a thorough job?
> 
> ( And note that the above link points to _another_ similar incident,
>   where James rebased a tree and broke the build. It is a pattern of 
>   behavior. )

OK, so we disagree on this.  But think what I'm having to do ... I need
a patch set to apply on top of your somewhat volatile changes to x86 ...
I'm using git to manage that patch set and I have no downstream users of
the voyager tree, so rebasing is a good management tool.

If I go the merge point route, I get a tree with more non trivial merge
points than commits, so it becomes incredibly difficult for anyone to
follow what's going on.  I also can no longer use git-email to send my
patch series anywhere.

So I beg to differ and conclude the rebase maintenance of this patch
series is the logically correct thing for me to do at the current time.

> 2)
> 
> The tree structure is unacceptable:
> 
>  a087b5f: [VOYAGER] x86: add prefill_possible_map to x86_quirks
>  f5ef55a: [VOYAGER] x86/mca: make mca_nmi_hook external
>  55c8430: [VOYAGER] x86: add {safe,hard}_smp_processor_id to smp_ops
>  fd1ab45: Revert "MAINTAINERS - Remove x86/Voyager no loner in tree"
>  0ff51d1: Revert "x86: remove the Voyager 32-bit subarch"
> 
> That is crap. It starts with a huge 'revert' - which of course 
> breaks the tree and needs 16 commits to bring back into action.

The revert doesn't actually break anything ... you saw to that yourself
by marking CONFIG_VOYAGER BROKEN and by pulling all it's files out of
the central makefile about two weeks before you actually removed the
code.

> It might be OK to _revive_ the source code that way privately - but 
> the history completely incorrectly suggests a 'revert'. We revert 
> buggy commits.
> 
> What we want here is a clean submission, and a tidy, well 
> constructed, non-rebased, well-tested Git tree. Or plain email 
> submissions initially, because frankly i shouldnt Git-pull such a 
> messy tree.
> 
> 3)
> 
> The comments. For example the revert:
> 
>  From 0ff51d1467af91bca4210b0d09372b6e7ded7524 Mon Sep 17 00:00:00 2001
>  From: James Bottomley <James.Bottomley@HansenPartnership.com>
>  Date: Mon, 23 Feb 2009 15:02:04 -0600
>  Subject: [PATCH] Revert "x86: remove the Voyager 32-bit subarch"
> 
>  This reverts commit 965c7ecaf2e2b083d711a01ab33735a4bdeee1a4.
>  ---
> 
> That is not how we do reverts! We always give a reason for a revert. 

Well "put it back again" is the reason ... however, it did seem to be
obvious in the Subject line ... but I can add an additional reason if
you insist ... what apart from "revive voyager" do you want it to say?

> 4)
> 
> Small details like standard commit titles in the x86 tree. It 
> shouldnt be:
> 
>  [VOYAGER] x86: eliminate subarchitecture file do_timer.h
> 
> It should be:
> 
>  x86: Voyager: Eliminate subarchitecture file do_timer.h
> 
> Note the different order and different capitalization.

Well [TREE] is a standard.  I've been using it for my trees for ages.
If you were to take voyager through your tree, then it would follow your
standards ... but you're forcing me to send it through my own, so it
follows mine.

> 5)
> 
> And as i requested it in an earier thread, quirky platforms should 
> be supported via a _single_ quirks file.
> 
> That makes it easy to handle and makes it easy to ignore as well. 
> It's basically a "weird hardware driver". We have examples of that, 
> for example arch/x86/kernel/visws_quirks.c. Voyager will be larger 
> than that but it's OK - it's not like it will undergo massive 
> development.
> 
> Putting it back into arch/x86/mach-voyager/ again reintroduces the 
> subarch directory structure we got rid of.

It's just a convenient place to put the voyager stuff ... I can move it
somewhere, but code motion just makes the diffstats explode for no good
reason and makes it hard to judge the actual changes.

I'd argue having voyager in a separate directory which is never built
unless you enable the config option is further out of sight and out of
mind.

But this is a tiny detail ... the three voyager files can go anywhere,
I'm not wedded to their actual location.

> 6)
> 
> This ordering of subsequent patches:
> 
> 5c173bb: [VOYAGER] x86: eliminate subarchitecture file do_timer.h
> 18d3288: [VOYAGER] x86: eliminate subarchitecture file entry_arch.h
> 42c7289: [VOYAGER] x86: eliminate subarchitecture file setup_arch.h
> 
> is totally wrong - it removes something that should not have been 
> put there in the first place.

I think you'll find do_timer.h, entry_arch.h and setup_arch.h still
exist in the current tree.

What these patches are actually doing is completing your partial
subarchitecture elimination by folding the splits back into the mainline
code and removing the header files that enabled them.

Out of all the patches, I would have thought you'd like these the best,
since they do finally eliminate the rest of the subarchitecture stuff
which still exists as trace elements in arch/x86 today.

> If then Voyager should be added as a clean series of patches: first 
> the generic patches that introduce infrastructure changes (to 
> x86_quirks and smp_ops, etc.), then a single final patch that adds 
> in the Voyager quirks platform driver.
> 
> And we've been through similar excercises multiple times before. 
> 
> All in one, this tree is quite poor and needs a lot of work.

So basically, if the only problems you have are commit log naming and
patch sequencing, you find the actual code technically fine?

James
