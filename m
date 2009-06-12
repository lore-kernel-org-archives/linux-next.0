From: Nick Piggin <npiggin@suse.de>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 09:42:13 +0200
Message-ID: <20090612074213.GA21070@wotan.suse.de>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A081002.4050802@in.ibm.com> <4A2909E8.6000507@in.ibm.com> <Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI> <4A2D001E.5060802@in.ibm.com> <20090609141903.GE15219@wotan.suse.de> <4A31EB2A.9080003@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:60102 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750878AbZFLHmN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 03:42:13 -0400
Content-Disposition: inline
In-Reply-To: <4A31EB2A.9080003@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Pekka J Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

On Fri, Jun 12, 2009 at 11:14:10AM +0530, Sachin Sant wrote:
> Nick Piggin wrote:
> >I can't really work it out. It seems to be the kmem_cache_cache which has
> >a problem, but there have already been lots of caches created and even
> >this samw cache_node already used right beforehand with no problem.
> >
> >Unless a CPU or node comes up or something right at this point or the
> >caller is scheduled onto a different CPU... oopses seem to all
> >have CPU#1, wheras boot CPU is probably #0 (these CPUs are node 0
> >and memory is only on node 1 and 2 where there are no CPUs if I read
> >correctly).
> >
> >I still can't see the reason for the failure, but can you try this
> >patch please and show dmesg?
> I was able to boot yesterday's next (20090611) on this machine. Not sure

Still with SLQB? With debug options turned on?


> what changed(may be because of merge with linus tree), but i can no longer
> recreate this issue with next 20090611. I was consistently able to
> recreate the problem till June 10th next tree.

I would guess some kind of memory corruption that by chance did
not break the other allocators.

Please let us know if you see any more crashes. Thanks for all
your help.
