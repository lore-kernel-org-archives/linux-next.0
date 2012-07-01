From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] apic: fix kvm build on UP without IOAPIC
Date: Sun, 01 Jul 2012 09:23:41 -0700
Message-ID: <4FF0798D.60109@xenotime.net>
References: <20120701150506.GA31304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120701150506.GA31304@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Avi Kivity <avi@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, mtosatti@redhat.com, x86@kernel.org, kvm@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-next.vger.kernel.org

On 07/01/2012 08:05 AM, Michael S. Tsirkin wrote:

> On UP i386, when APIC is disabled
> # CONFIG_X86_UP_APIC is not set
> # CONFIG_PCI_IOAPIC is not set
> 
> code looking at apicdrivers never has any effect but it
> still gets compiled in. In particular, this causes
> build failures with kvm, but it generally bloats the kernel
> unnecessarily.
> 
> Fix by defining both __apicdrivers and __apicdrivers_end
> to be NULL when CONFIG_X86_LOCAL_APIC is unset: I verified
> that as the result any loop scanning __apicdrivers gets optimized out by
> the compiler.
> 
> Warning: a .config with apic disabled doesn't seem to boot
> for me (even without this patch). Still verifying why,
> meanwhile this patch is compile-tested only.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
> 
> Note: if this patch makes sense, can x86 maintainers
> please ACK applying it through the kvm tree, since that is
> where we see the issue that it addresses?
> Avi, Marcelo, maybe you can carry this in kvm/linux-next as a temporary
> measure so that linux-next builds?
> 
>  arch/x86/include/asm/apic.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
> index eaff479..aa5b2ee 100644
> --- a/arch/x86/include/asm/apic.h
> +++ b/arch/x86/include/asm/apic.h
> @@ -417,7 +417,12 @@ extern struct apic *apic;
>  	__aligned(sizeof(struct apic *))				\
>  	__section(.apicdrivers) = { &sym1, &sym2 }
>  
> +#ifdef CONFIG_X86_LOCAL_APIC
>  extern struct apic *__apicdrivers[], *__apicdrivers_end[];
> +#else
> +#define __apicdrivers ((struct apic **)NULL)
> +#define __apicdrivers_end ((struct apic **)NULL)
> +#endif
>  
>  /*
>   * APIC functionality to boot other CPUs - only used on SMP:



-- 
~Randy
