From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Mon, 25 Aug 2008 09:39:26 +0200
Message-ID: <20080825073926.GA9147@elte.hu>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35305 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752004AbYHYHjt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 03:39:49 -0400
Content-Disposition: inline
In-Reply-To: <20080825065525.GA23089@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Mon, Aug 25, 2008 at 04:44:18PM +1000, Stephen Rothwell wrote:
> > 
> > On Thu, 7 Aug 2008 13:35:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the crypto tree got a conflict in
> > > include/asm-x86/cpufeature.h between commit
> > > 32e1d0a0651004f5fe47f85a2a5c725ad579a90c ("x64, x2apic/intr-remap: cpuid
> > > bits for x2apic feature") from the x86 tree and commit
> > > 1f4f8a5d7935c81b5b3c7601ec9ac021db30ba4f ("crypto: crc32c - Use Intel
> > > CRC32 instruction") from the crypto tree.
> > > 
> > > Just simple overlapping additions.  I added both of them and can carry
> > > the fixup.
> > 
> > This now also conflicts with commit
> > a648bf4632628c787abb0514277f2a231fca39ca ("x86, xsave: xsave cpuid
> > feature bits") from the x86 tree.
> > 
> > The fixup looks like below.  Maybe the X86_FEATURE_XMM4_2 bits could also
> 
> Yep looks good.
> 
> > be added in the x86 tree.
> 
> Sure that sounds like a good idea.

new x86 feature bits should definitely show up in the x86 tree too. 
Could you please send a standalone patch that only touches the .h file, 
which could be applied to v2.6.27 as well? Thanks,

	Ingo
