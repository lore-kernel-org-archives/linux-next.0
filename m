From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Fri, 12 Jun 2009 11:25:39 +0300
Message-ID: <1244795139.30512.23.camel@penberg-laptop>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	 <4A081002.4050802@in.ibm.com> <4A2909E8.6000507@in.ibm.com>
	 <Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI>
	 <4A2D001E.5060802@in.ibm.com> <20090609141903.GE15219@wotan.suse.de>
	 <4A31EB2A.9080003@in.ibm.com> <20090612074213.GA21070@wotan.suse.de>
	 <4A320D12.2050802@in.ibm.com>  <20090612082145.GD24044@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:44217 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761926AbZFLIZi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2009 04:25:38 -0400
In-Reply-To: <20090612082145.GD24044@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

On Fri, 2009-06-12 at 10:21 +0200, Nick Piggin wrote:
> On Fri, Jun 12, 2009 at 01:38:50PM +0530, Sachin Sant wrote:
> > Nick Piggin wrote:
> > >>I was able to boot yesterday's next (20090611) on this machine. Not sure
> > >>    
> > >
> > >Still with SLQB? With debug options turned on?
> > >  
> > Ah .. spoke too soon. The kernel was not compiled with SLQB. Sorry
> > about the confusion. I can't seem to select SLQB as the slab
> > allocator.
> 
> It must have been dropped out of -next. You could just try
> a known-bad kernel with my patch applied?

Hmm, SLQB in my for-next branch. Stephen, is slab.git dropped from
linux-next or something?

			Pekka
