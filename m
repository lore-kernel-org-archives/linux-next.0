From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' and the
 tip trees
Date: Mon, 15 Jan 2018 11:28:19 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801151125040.1810@nanos>
References: <20180115133459.27b8f7f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115133459.27b8f7f1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org

On Mon, 15 Jan 2018, Stephen Rothwell wrote:
> Hi all,
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@@ -202,11 -201,9 +202,11 @@@
>   #define X86_FEATURE_HW_PSTATE		( 7*32+ 8) /* AMD HW-PState */
>   #define X86_FEATURE_PROC_FEEDBACK	( 7*32+ 9) /* AMD ProcFeedbackInterface */
>   #define X86_FEATURE_SME			( 7*32+10) /* AMD Secure Memory Encryption */
>  -#define X86_FEATURE_SEV			( 7*32+11) /* AMD Secure Encrypted Virtualization */
>  -
>  +#define X86_FEATURE_PTI			( 7*32+11) /* Kernel Page Table Isolation enabled */
>  +#define X86_FEATURE_RETPOLINE		( 7*32+12) /* Generic Retpoline mitigation for Spectre variant 2 */
>  +#define X86_FEATURE_RETPOLINE_AMD	( 7*32+13) /* AMD Retpoline mitigation for Spectre variant 2 */
>   #define X86_FEATURE_INTEL_PPIN		( 7*32+14) /* Intel Processor Inventory Number */
> - #define X86_FEATURE_INTEL_PT		( 7*32+15) /* Intel Processor Trace */

Where is that patch which moves INTEL_PT ?

commit 632218d8dee296c8b397c13b7b3b4be090a1c043
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Dec 11 04:30:50 2017 +0800

    x86: cpufeature: move processor tracing out of scattered features
    
    Processor tracing is already enumerated in word 9 (CPUID[7,0].EBX),
    so do not duplicate it in the scattered features word.
    
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Can KVM folks please stop doing random changes to the cpufeatures code
without talking to x86 maintainers and Borislav?

This wants to go through TIP or at least reviewed and acked.

Thanks,

	tglx
