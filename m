From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: managing a web of git trees
Date: Fri, 13 Jun 2008 09:01:18 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0806130852460.2949@woody.linux-foundation.org>
References: <20080613145357.1ea9f643.sfr@canb.auug.org.au> <20080613160201.ac0ffd5f.sfr@canb.auug.org.au> <200806131045.45769.rjw@sisk.pl> <200806130849.45269.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:33217 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755549AbYFMQCV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 12:02:21 -0400
In-Reply-To: <200806130849.45269.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org



On Fri, 13 Jun 2008, Jesse Barnes wrote:

> On Friday, June 13, 2008 1:45 am Rafael J. Wysocki wrote:
> > > they are not the same commits:
> > > "ACPI PM: acpi_pm_device_sleep_state() cleanup"
> > > 06166780eb53685e72b589814d535d1f9948e761	in the pci tree
> > > 0cc5ddb904162f611568d4db66ccd8af61dffc16	int the acpi tree
> > > "ACPI PM: Remove obsolete Toshiba workaround"
> > > 0e6859d49ff194e01afc229c996e3aefca1a0539	in the pci tree
> > > f7259bd5d588d59816e1f4d5d4f3da9382916dac	in the acpi tree
> > >
> > > In the acpi tree (I pull the test branch into linux-next) the former has
> > > a different parent to the one on the pci tree since Jesse pulled your
> > > "suspend" branch into his pci tree.
> > >
> > > So the git merge sees them as overlapping changes to the same file (as
> > > well as the other commit above) and generates a conflict.
> >
> > Well, the commits will always be different, because they depend on the
> > previous commits and those are different in both trees.  The files they
> > modify, however, should be exactly the same finally.
> >
> > I don't know how to handle that cleanly. :-(
> 
> Yuck, I thought they'd retain the same commit ids for some reason.  OTOH if 
> the content is the same, resolving the conflicts should be trivial (git might 
> even do it automatically at merge time if it's identical?).
> 
> Linus, do you have any suggestions for this case?  We've been trying to pull 
> different trees together to make merging & management easier, but it's not 
> working as smoothly as we'd like.  My pull of Ingo's PCI changes worked 
> pretty well (after merging his branch all the identical commits ended up the 
> same), but my pull of Len's suspend branch didn't work that way...

The fact that they are different commits matters not at all to the git 
merge strategy. The git merge strategy is in fact expressly designed to 
not care about how some state came to be, it only cares about

 - what was the last _common_ state (and if there are multiple such 
   points, it does the merge recursively for those multiple common states)

 - what were the end results.

So the fact that "the commits will always be different" is irrelevant. 
Yes, the commits will be different because they have different history, 
but it has no relevance for the merge strategy. It will not cause 
conflicts just because two different commits touch the same area. The only 
thing the merge strategy cares about is the actual *state* of the files.

However, since conflicts clearly happen, let's look at what *does* cause 
conflicts. It's not the existence of the same patch to the same area in a 
file. It's about *different* patches to the same area in a file.

If you have two development trees that have the exact same changes to some 
area in a file, then the merge algorithm with be very happy, and just 
merge those changes. It's the standard three-way merge.

HOWEVER! If there are _other_ changes that overlap (and aren't identical), 
then *that* is when conflicts happen. And that is true regardless of 
whether the history also contains some identical changes. IOW, if you have

 - patch A (in _both_ histories)
 - patch B (in just _one_ of the histories)

and they overlap, then that will be a conflict. And now, since the 
original file will have *neither* A nor B, the conflict will basically be 
the union of A and B - the three-way merge does not care at all about the 
fact hat A existed twice, because qutie frankly, maybe B was a _fix_ to A, 
and even though A exists in both branches, it may well be that A on it's 
own is pure and utter sh*t and shoult not be merged.

See?

So identical patches (with different commits) in two trees is not what 
causes problems. It's the *non-identical* ones that cause problms. And if 
they overlap with the identical ones, even partially, then yes, you'll 
have to resolve not just the non-identical ones, but the identical ones 
too. 

			Linus
