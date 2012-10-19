From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (tip/s390 trees related)
Date: Fri, 19 Oct 2012 23:52:42 +0200
Message-ID: <1350683562.2768.78.camel@twins>
References: <20121018172201.b81dcc8fe40868256f532364@canb.auug.org.au>
	 <20121018150209.GB17439@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:55638 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932972Ab2JSVxd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Oct 2012 17:53:33 -0400
In-Reply-To: <20121018150209.GB17439@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2012-10-18 at 17:02 +0200, Ralf Baechle wrote:
>   CC      mm/huge_memory.o
> mm/huge_memory.c: In function =E2=80=98do_huge_pmd_prot_none=E2=80=99=
:
> mm/huge_memory.c:789:3: error: incompatible type for argument 3 of =E2=
=80=98update_mmu_cache=E2=80=99

That appears to have become update_mmu_cache_pmd(), which makes sense
given that there's now architectures that care about it.
