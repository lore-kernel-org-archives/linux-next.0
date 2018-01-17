From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 17 Jan 2018 12:45:02 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801171243230.1777@nanos>
References: <20180117144817.1cba736f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117144817.1cba736f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 17 Jan 2018, Stephen Rothwell wrote:
> [This is the same conflict I reported the day before yesterday, but one
> of the commits has moved and another that contributed has been dropped.]
> diff --cc arch/x86/include/asm/cpufeatures.h
> index aa09559b2c0b,19f35be95f16..000000000000
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -211,7 -209,6 +211,8 @@@
>   #define X86_FEATURE_AVX512_4FMAPS	( 7*32+17) /* AVX-512 Multiply Accumulation Single precision */
>   
>   #define X86_FEATURE_MBA			( 7*32+18) /* Memory Bandwidth Allocation */
>  +#define X86_FEATURE_RSB_CTXSW		( 7*32+19) /* Fill RSB on context switches */
> ++#define X86_FEATURE_SEV			( 7*32+20) /* AMD Secure Encrypted Virtualization */

Groan.....
