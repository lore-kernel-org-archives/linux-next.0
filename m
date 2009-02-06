From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: slab tree build warning
Date: Fri, 06 Feb 2009 10:58:21 +0200
Message-ID: <1233910701.29891.28.camel@penberg-laptop>
References: <20090204183847.771df81b.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0902041009050.32130@melkki.cs.Helsinki.FI>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:36320 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691AbZBFI6W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2009 03:58:22 -0500
In-Reply-To: <Pine.LNX.4.64.0902041009050.32130@melkki.cs.Helsinki.FI>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

On Wed, 2009-02-04 at 10:11 +0200, Pekka J Enberg wrote:
> On Wed, 4 Feb 2009, Stephen Rothwell wrote:
> > Today's linux-next build (powerpc allnoconfig) produced this warning:
> > 
> > mm/slqb.c: In function 'kmem_cache_open':
> > mm/slqb.c:2180: warning: label 'error_lock' defined but not used
> > mm/slqb.c:2176: warning: label 'error_cpu_array' defined but not used
> > 
> > Caused by commit 8b9ffd9d52479bd17b5729c9f3acaefa90c7e585 ("slqb: dynamic
> > array allocations").
> > 
> > Clearly neither CONFIG_SMP not CONFIG_NUMA is set.
> 
> Here's a simple fix for it. It would probably be better to get rid of the 
> #ifdefs in kmem_cache_open() with empty static inlines for the 
> !CONFIG_SMP and !CONFIG_NUMA cases.
> 
> Nick, I did not apply this patch yet so ACK/NAK, please.

I went ahead and merged my patch.

			Pekka
