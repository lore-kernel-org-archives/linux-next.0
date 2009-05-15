From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: asm-generic tree build failure
Date: Fri, 15 May 2009 14:53:35 +0200
Message-ID: <200905151453.36277.arnd@arndb.de>
References: <20090515141853.59d2019b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:59439 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760556AbZEOMxs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 May 2009 08:53:48 -0400
In-Reply-To: <20090515141853.59d2019b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>

On Friday 15 May 2009, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next build (powerpc_allnoconfig) failed like this:
> 
> arch/powerpc/mm/tlb_hash32.c:65: error: expected declaration specifiers or '...' before '(' token
> arch/powerpc/mm/tlb_hash32.c: In function 'flush_tlb_mm':
> arch/powerpc/mm/tlb_hash32.c:66: error: number of arguments doesn't match prototype
> arch/powerpc/include/asm/tlbflush.h:57: error: prototype declaration
> arch/powerpc/mm/tlb_hash32.c: At top level:
> arch/powerpc/mm/tlb_hash32.c:145: error: redefinition of 'flush_tlb_mm'
> arch/powerpc/mm/tlb_hash32.c:65: note: previous definition of 'flush_tlb_mm' was here
> 
> Caused by commit f8089f1f5eaf4925b0925e69cd311d7d1d423e6a ("asm-generic:
> Add missing generic tlb_flush definition").
> 
> I have dropped the asm-generic tree for today (since I have no earlier
> version).

Thanks for the info. I actually removed the broken commit in the version
that I sent out, but it must have crept back in during one of my merges.

I pushed out the right version now.

	Arnd <><
