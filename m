From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 18 Nov 2016 08:31:52 +1100
Message-ID: <20161118083152.1ca4264b@canb.auug.org.au>
References: <20161117145035.3891820c@canb.auug.org.au>
        <alpine.DEB.2.20.1611170805510.3697@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751905AbcKQVb4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Nov 2016 16:31:56 -0500
In-Reply-To: <alpine.DEB.2.20.1611170805510.3697@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, He Chen <he.chen@linux.intel.com>

Hi Thomas,

On Thu, 17 Nov 2016 08:07:27 +0100 (CET) Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, 17 Nov 2016, Stephen Rothwell wrote:
> > + /* Please keep the leaf sorted by cpuid_bit.level for faster search. */
> > + static const struct cpuid_bit cpuid_bits[] = {
> > + 	{ X86_FEATURE_APERFMPERF,       CPUID_ECX,  0, 0x00000006, 0 },
> > + 	{ X86_FEATURE_EPB,              CPUID_ECX,  3, 0x00000006, 0 },
> > ++	{ X86_FEATURE_CAT_L3,		CPUID_EBX,  1, 0x00000010, 0 },
> > ++	{ X86_FEATURE_CAT_L2,		CPUID_EBX,  2, 0x00000010, 0 },
> > ++	{ X86_FEATURE_CDP_L3,		CPUID_ECX,  2, 0x00000010, 1 },
> > + 	{ X86_FEATURE_INTEL_PT,         CPUID_EBX, 25, 0x00000007, 0 },
> > + 	{ X86_FEATURE_AVX512_4VNNIW,    CPUID_EDX,  2, 0x00000007, 0 },
> > + 	{ X86_FEATURE_AVX512_4FMAPS,    CPUID_EDX,  3, 0x00000007, 0 },
> > + 	{ X86_FEATURE_HW_PSTATE,        CPUID_EDX,  7, 0x80000007, 0 },
> > + 	{ X86_FEATURE_CPB,              CPUID_EDX,  9, 0x80000007, 0 },
> > + 	{ X86_FEATURE_PROC_FEEDBACK,    CPUID_EDX, 11, 0x80000007, 0 },
> > + 	{ 0, 0, 0, 0, 0 }
> >   };  
> 
> This should be
> 
> > + static const struct cpuid_bit cpuid_bits[] = {
> > + 	{ X86_FEATURE_APERFMPERF,       CPUID_ECX,  0, 0x00000006, 0 },
> > + 	{ X86_FEATURE_EPB,              CPUID_ECX,  3, 0x00000006, 0 },
> > + 	{ X86_FEATURE_INTEL_PT,         CPUID_EBX, 25, 0x00000007, 0 },
> > + 	{ X86_FEATURE_AVX512_4VNNIW,    CPUID_EDX,  2, 0x00000007, 0 },
> > + 	{ X86_FEATURE_AVX512_4FMAPS,    CPUID_EDX,  3, 0x00000007, 0 },
> > ++	{ X86_FEATURE_CAT_L3,		CPUID_EBX,  1, 0x00000010, 0 },
> > ++	{ X86_FEATURE_CAT_L2,		CPUID_EBX,  2, 0x00000010, 0 },
> > ++	{ X86_FEATURE_CDP_L3,		CPUID_ECX,  2, 0x00000010, 1 },
> > + 	{ X86_FEATURE_HW_PSTATE,        CPUID_EDX,  7, 0x80000007, 0 },
> > + 	{ X86_FEATURE_CPB,              CPUID_EDX,  9, 0x80000007, 0 },
> > + 	{ X86_FEATURE_PROC_FEEDBACK,    CPUID_EDX, 11, 0x80000007, 0 },
> > + 	{ 0, 0, 0, 0, 0 }
> >   };  

Thanks for letting me know.

> tip will carry a proper resolution today.

Too easy.

-- 
Cheers,
Stephen Rothwell
