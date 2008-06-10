From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: powerpc build failure
Date: Tue, 10 Jun 2008 17:20:09 +1000
Message-ID: <1213082409.25745.28.camel@pasglop>
References: <20080610165441.a7c5ddd0.sfr@canb.auug.org.au>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:35136 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751708AbYFJHU3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 03:20:29 -0400
In-Reply-To: <20080610165441.a7c5ddd0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

On Tue, 2008-06-10 at 16:54 +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next tree build (powerpc ppc64_defconfig) failed like this:
> 
>   UPD     include/linux/compile.h
> arch/powerpc/mm/built-in.o: In function `ht64_insert_pte':
> hash_native_64.c:(.text+0x4756): undefined reference to `_PAGE_HPTE_SUB0'
> 
> I have reverted commit 2d9a973b0fee245af43b73412a08e88bc955644d
> ("powerpc: Free a PTE bit on ppc64 with 64K pages") for now.

Yup, that's the way to go. It's broken, I'll have to do things a bit
differently, I "forgot" our 64K SPU hack when using 4K pages assumes
we have the same PTE format :-( I'll have to implement a separate low
level asm function for hashing 64K pages on a 4K kernel.

Ben.


