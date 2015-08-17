From: KY Srinivasan <kys@microsoft.com>
Subject: RE: [PATCH] x86: fix build in !CONFIG_KEXEC_CORE case
Date: Mon, 17 Aug 2015 17:58:48 +0000
Message-ID: <BY2PR0301MB165420BD30B27E9915796BCBA0790@BY2PR0301MB1654.namprd03.prod.outlook.com>
References: <1439300135-10698-1-git-send-email-vkuznets@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439300135-10698-1-git-send-email-vkuznets@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Kuznetsov <vkuznets@redhat.com>, "x86@kernel.org" <x86@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Vitaly Kuznetsov [mailto:vkuznets@redhat.com]
> Sent: Tuesday, August 11, 2015 6:36 AM
> To: x86@kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>; Ingo Molnar
> <mingo@redhat.com>; H. Peter Anvin <hpa@zytor.com>; linux-
> kernel@vger.kernel.org; Greg KH <gregkh@linuxfoundation.org>; KY
> Srinivasan <kys@microsoft.com>; Jim Davis <jim.epost@gmail.com>; linux-
> next <linux-next@vger.kernel.org>
> Subject: [PATCH] x86: fix build in !CONFIG_KEXEC_CORE case
> 
> Recent changes in Hyper-V driver ("Drivers: hv: vmbus: add special crash
> handler") broke the build when CONFIG_KEXEC_CORE is not set. These
> changes, however, only reveal the previously existent issue: when
> CONFIG_KEXEC_CORE is not defined kernel/kexec.c is not being included in
> the build and native_machine_crash_shutdown() defined in asm/reboot.h
> has
> no implementation.
> 
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  arch/x86/include/asm/reboot.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/reboot.h b/arch/x86/include/asm/reboot.h
> index a82c4f1..a6c1124 100644
> --- a/arch/x86/include/asm/reboot.h
> +++ b/arch/x86/include/asm/reboot.h
> @@ -16,8 +16,15 @@ struct machine_ops {
> 
>  extern struct machine_ops machine_ops;
> 
> -void native_machine_crash_shutdown(struct pt_regs *regs);
>  void native_machine_shutdown(void);
> +#ifdef CONFIG_KEXEC_CORE
> +void native_machine_crash_shutdown(struct pt_regs *regs);
> +#else
> +static inline void native_machine_crash_shutdown(struct pt_regs *regs)
> +{
> +	native_machine_shutdown();
> +}
> +#endif
>  void __noreturn machine_real_restart(unsigned int type);
>  /* These must match dispatch in arch/x86/realmore/rm/reboot.S */
>  #define MRR_BIOS	0
> --
> 2.4.3

This patch fixes a build issue; please apply.

Regards,

K. Y
