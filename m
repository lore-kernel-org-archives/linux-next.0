From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: linux-next: build warning after merge of the final tree (tip
 tree related)
Date: Mon, 11 Oct 2010 10:09:26 -0700
Message-ID: <4CB344C6.5040408@kernel.org>
References: <20101011160429.81483d01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:35978 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755585Ab0JKRKH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 13:10:07 -0400
In-Reply-To: <20101011160429.81483d01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/10/2010 10:04 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) produced this warning:
> 
> WARNING: mm/built-in.o(.text+0x25ab8): Section mismatch in reference from the function memblock_find_base() to the function .init.text:memblock_find_region()
> The function memblock_find_base() references
> the function __init memblock_find_region().
> This is often because memblock_find_base lacks a __init 
> annotation or the annotation of memblock_find_region is wrong.
> 
> Introduced by commit 3661ca66a42e306aaf53246fb75aec1ea01be0f0 ("memblock:
> Fix section mismatch warnings").
> 
please check

[PATCH] x86: Fix section mismatch with memblock_find_region

Stephen found

WARNING: mm/built-in.o(.text+0x25ab8): Section mismatch in reference from the function memblock_find_base() to the function .init.text:memblock_find_region()
The function memblock_find_base() references
the function __init memblock_find_region().
This is often because memblock_find_base lacks a __init 
annotation or the annotation of memblock_find_region is wrong.

make all functions in memblock.c without __init to carry __init_memblock.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Yinghai Lu <yinghai@kernel.org>

---
 mm/memblock.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/mm/memblock.c
===================================================================
--- linux-2.6.orig/mm/memblock.c
+++ linux-2.6/mm/memblock.c
@@ -99,7 +99,7 @@ long __init_memblock memblock_overlaps_r
  * are top-down.
  */
 
-static phys_addr_t __init memblock_find_region(phys_addr_t start, phys_addr_t end,
+static phys_addr_t __init_memblock memblock_find_region(phys_addr_t start, phys_addr_t end,
 					  phys_addr_t size, phys_addr_t align)
 {
 	phys_addr_t base, res_base;
@@ -653,7 +653,7 @@ void __init memblock_enforce_memory_limi
 	}
 }
 
-static int memblock_search(struct memblock_type *type, phys_addr_t addr)
+static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
 {
 	unsigned int left = 0, right = type->cnt;
 
