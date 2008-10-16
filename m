From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next:  build failure
Date: Thu, 16 Oct 2008 12:39:17 +0200
Message-ID: <20081016103916.GA30745@elte.hu>
References: <20081016202907.978d00b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33422 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751534AbYJPKjk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 06:39:40 -0400
Content-Disposition: inline
In-Reply-To: <20081016202907.978d00b1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/mmu-hash64.h:17,
>                  from arch/powerpc/include/asm/mmu.h:8,
>                  from arch/powerpc/include/asm/pgtable.h:8,
>                  from arch/powerpc/mm/slb.c:20:
> arch/powerpc/include/asm/page.h:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'memstart_addr'
> arch/powerpc/include/asm/page.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'kernstart_addr'
> 
> Caused by commit 600715dcdf567c86f8b2c6173fcfb4b873e25a19 ("generic: add
> phys_addr_t for holding physical addresses") from the tip-core tree.
> This only fails if CONFIG_RELOCATABLE is set.
> 
> I have applied the patch below.

applied to tip/core/urgent, thanks Stephen!

	Ingo
