From: Shaohua Li <shli@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Thu, 24 Jan 2013 18:30:40 +0800
Message-ID: <20130124103040.GB10025@kernel.org>
References: <20130124165448.a27de37fb29ecceac235a7e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:65412 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752489Ab3AXKas (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jan 2013 05:30:48 -0500
Content-Disposition: inline
In-Reply-To: <20130124165448.a27de37fb29ecceac235a7e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Thu, Jan 24, 2013 at 04:54:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> arch/sparc/mm/init_32.c: In function 'show_mem':
> arch/sparc/mm/init_32.c:60:23: error: invalid operands to binary << (have 'atomic_long_t' and 'int')
> 
> Caused by commit "swap: add per-partition lock for swapfile" from the
> akpm tree.
> 
> I have reverted that commit for today.

can you please apply this:


---
 arch/sparc/mm/init_32.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/arch/sparc/mm/init_32.c
===================================================================
--- linux.orig/arch/sparc/mm/init_32.c	2012-08-06 16:00:44.133458270 +0800
+++ linux/arch/sparc/mm/init_32.c	2013-01-24 18:28:23.242077473 +0800
@@ -57,7 +57,7 @@ void show_mem(unsigned int filter)
 	printk("Mem-info:\n");
 	show_free_areas(filter);
 	printk("Free swap:       %6ldkB\n",
-	       nr_swap_pages << (PAGE_SHIFT-10));
+	       get_nr_swap_pages() << (PAGE_SHIFT-10));
 	printk("%ld pages of RAM\n", totalram_pages);
 	printk("%ld free pages\n", nr_free_pages());
 }
