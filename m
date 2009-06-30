From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 12:20:10 +0300
Message-ID: <1246353610.8014.18.camel@penberg-laptop>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au>
	 <4A488D08.30307@in.ibm.com>
	 <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
	 <20090629103943.GA31299@wotan.suse.de>
	 <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
	 <20090629115835.GA2308@wotan.suse.de>
	 <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
	 <20090630090631.GB1114@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:57903 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753494AbZF3JUM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 05:20:12 -0400
In-Reply-To: <20090630090631.GB1114@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Tue, 2009-06-30 at 11:06 +0200, Nick Piggin wrote:
> Finally, if KMALLOC_SHIFT_SLQB_HIGH is larger than 2MB, then kmalloc_index
> could silently run off the end of its precomputed table and return a -1
> index into the kmalloc slab array, which could result in corruption. Extend
> this to allow up to 32MB (to match SLAB), and add a compile-time error in
> the case that the table is exceeded (also like SLAB).

I wonder if SLQB should just do page allocator pass-through for really
big allocations? That way callers don't need to worry about whether
they're running under SLAB/SLUB/SLOB/SQLB.

			Pekka
