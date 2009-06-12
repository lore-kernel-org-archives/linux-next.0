From: Nick Piggin <npiggin@suse.de>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 10:21:45 +0200
Message-ID: <20090612082145.GD24044@wotan.suse.de>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A081002.4050802@in.ibm.com> <4A2909E8.6000507@in.ibm.com> <Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI> <4A2D001E.5060802@in.ibm.com> <20090609141903.GE15219@wotan.suse.de> <4A31EB2A.9080003@in.ibm.com> <20090612074213.GA21070@wotan.suse.de> <4A320D12.2050802@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:32864 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760006AbZFLIVn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 04:21:43 -0400
Content-Disposition: inline
In-Reply-To: <4A320D12.2050802@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Pekka J Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

On Fri, Jun 12, 2009 at 01:38:50PM +0530, Sachin Sant wrote:
> Nick Piggin wrote:
> >>I was able to boot yesterday's next (20090611) on this machine. Not sure
> >>    
> >
> >Still with SLQB? With debug options turned on?
> >  
> Ah .. spoke too soon. The kernel was not compiled with SLQB. Sorry
> about the confusion. I can't seem to select SLQB as the slab
> allocator.

It must have been dropped out of -next. You could just try
a known-bad kernel with my patch applied?

Thanks,
Nick
