From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Sun, 24 Jan 2010 13:01:21 -0500
Message-ID: <20100124180121.GA12744@redhat.com>
References: <20100122182827.GA13185@redhat.com> <20100122200129.GG22003@redhat.com> <alpine.LFD.2.00.1001221355250.13231@localhost.localdomain> <20100122221348.GA4263@redhat.com> <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain> <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain> <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com> <20100123112333.GA15455@elte.hu> <20100123114729.GA7828@redhat.com> <20100123194820.GM21263@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:6952 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1749667Ab0AXSCU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Jan 2010 13:02:20 -0500
Content-Disposition: inline
In-Reply-To: <20100123194820.GM21263@thunk.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tytso@mit.edu, Ingo Molnar <mingo@elte.hu>, Kyle Moffett <kyle@moffetthome.net>, Linus Torvalds <torvalds@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@>

Hi -

tytso wrote:
> [...]

Let me see if I can paraphrase those of your concerns that were substantive:

1) That if utrace is merged, and systemtap keeps on using it, there may be
   some sort of chilling effect on kernel developers that would impede
   utrace's future development.

This might sound plausible to an outsider, but luckily we're not stuck
with having to speculate: one can examine history.  Systemtap has been
around, working roughly the same way, for about *five years*.

Systemtap modules use more than a handful of mainstream
module-accessible kernel services.  During all this time, how many
examples have there been when when systemtap developers have pleaded
with lkml to avoid changing some prior interface?  How many of those
successfully?  (That last one is a trick question, since both numbers
are really close to *zero*.)  How much real impediment to change has
our mere existence caused?


2) That systemtap is not portable to all kernel versions.

Problems do periodically occur.  However, one can again refer to
historical facts to assess whether in fact they warrant long term
grudges.  In every release note, we list the range of kernel versions
we test against.  We may have one of the broadest ranges of support,
2.6.9 through to many current -rc*s and non-linus trees.  We have
several mechanisms which let us easily adapt to most changes.  It may
interest readers to find out that the number of systemtap changes we
have had to add on account of kernel changes is on the order of a *few
per year*.  The usual turnaround, once reported, is on the order of a
*few days*.


3) That systemtap users will complain to kernel developers if
   systemtap becomes incompatible.

Let's go to the historical record again.  How many such complaints
have actually been seen in inappropriate fora such as lkml?  How
difficult were they to diagnose / redirect to the proper venue?  Have
they constituted a "loss of face" for kernel developers?


4) That systemtap is almost but not quite as evil as nvidia.

It seems factors like ...

- always being completely open source project
- keeping in regular contact with lkml and other constituencies
- not being related to essential hardware enablement, so users
  not wanting it don't have to touch it
- the compile-to-C approach being technologically necessary since
  there was no alternative plausible way at the time (and still now)
- repeatedly offering infrastructure code with non-stap uses

... all add up to a mere nudge away from entirely "evil".  If so, I
wonder if your sort of grossly bimodal view of ethical virtue is going
to foster the right sorts of change in the linux kernel community.


- FChE
