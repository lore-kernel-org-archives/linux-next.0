From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 12:29:58 +0200
Message-ID: <20090630102958.GF1114@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com> <20090629115835.GA2308@wotan.suse.de> <20090629141234.GF9321@osiris.boeblingen.de.ibm.com> <20090630090631.GB1114@wotan.suse.de> <20090630100929.GA2559@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34525 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751309AbZF3K36 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 06:29:58 -0400
Content-Disposition: inline
In-Reply-To: <20090630100929.GA2559@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Tue, Jun 30, 2009 at 12:09:29PM +0200, Heiko Carstens wrote:
> On Tue, Jun 30, 2009 at 11:06:31AM +0200, Nick Piggin wrote:
> > On Mon, Jun 29, 2009 at 04:12:34PM +0200, Heiko Carstens wrote:
> > > slqb returns ZERO_SIZE_PTR instead of NULL for large size requests it cannot
> > > handle.
> > > The patch below would fix it. But I think its too ugly. So I leave it up to
> > > Nick to come up with a real and nice patch ;)
> > 
> > Could you try this patch and see if it helps? (it fixes a number
> > of simple corner cases here, *blush*)
> 
> Yes, it does work now. Thanks!

Thanks. Pekka, can you please merge this with

Signed-off-by: Nick Piggin <npiggin@suse.de>

> 
> > SLQB: fix allocation size checking
> > 
> > SLQB would return ZERO_SIZE_PTR rather than NULL if the requested size is too
> > large. Debugged by Heiko Carstens. Fix this by checking size edge cases up
> > front rather than in the slab index calculation.
> > 
> > Additionally, if the size parameter was non-constant and too large, then
> > the checks may not have been performed at all which could cause corruption.
> > 
> > Next, ARCH_KMALLOC_MINALIGN may not be obeyed if size is non-constant. So
> > test for KMALLOC_MIN_SIZE in that case.
> > 
> > Finally, if KMALLOC_SHIFT_SLQB_HIGH is larger than 2MB, then kmalloc_index
> > could silently run off the end of its precomputed table and return a -1
> > index into the kmalloc slab array, which could result in corruption. Extend
> > this to allow up to 32MB (to match SLAB), and add a compile-time error in
> > the case that the table is exceeded (also like SLAB).
