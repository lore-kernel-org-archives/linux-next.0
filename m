From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 12:30:13 +0300
Message-ID: <1246354213.8014.19.camel@penberg-laptop>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au>
	 <4A488D08.30307@in.ibm.com>
	 <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
	 <20090629103943.GA31299@wotan.suse.de>
	 <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
	 <20090629115835.GA2308@wotan.suse.de>
	 <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
	 <20090630090631.GB1114@wotan.suse.de>
	 <1246353610.8014.18.camel@penberg-laptop>
	 <20090630092704.GE1114@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:40704 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751515AbZF3JaM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 05:30:12 -0400
In-Reply-To: <20090630092704.GE1114@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Tue, 2009-06-30 at 11:06 +0200, Nick Piggin wrote:
> > > Finally, if KMALLOC_SHIFT_SLQB_HIGH is larger than 2MB, then kmalloc_index
> > > could silently run off the end of its precomputed table and return a -1
> > > index into the kmalloc slab array, which could result in corruption. Extend
> > > this to allow up to 32MB (to match SLAB), and add a compile-time error in
> > > the case that the table is exceeded (also like SLAB).

On Tue, Jun 30, 2009 at 12:20:10PM +0300, Pekka Enberg wrote:
> > I wonder if SLQB should just do page allocator pass-through for really
> > big allocations? That way callers don't need to worry about whether
> > they're running under SLAB/SLUB/SLOB/SQLB.

On Tue, 2009-06-30 at 11:27 +0200, Nick Piggin wrote:
> Well it could, OTOH it should be pretty well in line with SLAB
> after this patch so I don't see much need.

True. But with page allocator fall-through, we don't need to bump up
slab limit to 32 MB (which is pretty damn big IMHO). Anyway, up to you,
really.

			Pekka
