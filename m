From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 17 Jan 2018 13:23:17 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801171321580.1777@nanos>
References: <20180117144817.1cba736f@canb.auug.org.au> <alpine.DEB.2.20.1801171243230.1777@nanos> <b54c26df-cee2-a930-7e34-47701e852f9e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:45840 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752560AbeAQMXZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jan 2018 07:23:25 -0500
In-Reply-To: <b54c26df-cee2-a930-7e34-47701e852f9e@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Ingo Molnar <mingo@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>

On Wed, 17 Jan 2018, Paolo Bonzini wrote:
> On 17/01/2018 12:45, Thomas Gleixner wrote:
> > On Wed, 17 Jan 2018, Stephen Rothwell wrote:
> >> [This is the same conflict I reported the day before yesterday, but one
> >> of the commits has moved and another that contributed has been dropped.]
> >> diff --cc arch/x86/include/asm/cpufeatures.h
> >> index aa09559b2c0b,19f35be95f16..000000000000
> >> --- a/arch/x86/include/asm/cpufeatures.h
> >> +++ b/arch/x86/include/asm/cpufeatures.h
> >> @@@ -211,7 -209,6 +211,8 @@@
> >>   #define X86_FEATURE_AVX512_4FMAPS	( 7*32+17) /* AVX-512 Multiply Accumulation Single precision */
> >>   
> >>   #define X86_FEATURE_MBA			( 7*32+18) /* Memory Bandwidth Allocation */
> >>  +#define X86_FEATURE_RSB_CTXSW		( 7*32+19) /* Fill RSB on context switches */
> >> ++#define X86_FEATURE_SEV			( 7*32+20) /* AMD Secure Encrypted Virtualization */
> > Groan.....
> > 
> 
> Brijesh,
> 
> please send out again the (host-side) SEV series so that they are merged
> through the TIP tree instead of kvm.git.
> 
> Even though Boris did review it, there's just too much stuff in there
> outside arch/x86/kvm.

No. Keep it and lets next time coordinate the relevant bits and pieces
better. I reserve that bit 20 and let Linus sort out the trivial conflict
when merging the stuff.

Thanks,

	tglx
