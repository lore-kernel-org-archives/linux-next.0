From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Tue, 1 Jul 2008 18:56:08 -0700
Message-ID: <200807011856.09249.jbarnes@virtuousgeek.org>
References: <20080701135347.6afb4a84.sfr@canb.auug.org.au> <20080701055844.GB14658@elte.hu> <20080701162920.9e9e5c8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-07.bluehost.com ([69.89.17.207]:44305 "HELO
	outbound-mail-07.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1757601AbYGBCC7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 22:02:59 -0400
In-Reply-To: <20080701162920.9e9e5c8f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Yinghai Lu <yhlu.kernel@gmail.com>

On Monday, June 30, 2008 11:29 pm Stephen Rothwell wrote:
> Hi Ingo,
>
> On Tue, 1 Jul 2008 07:58:44 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > hm, the commit looks a bit weird: why the ifdefs? There's nothing 64-bit
> > about being able to dump early resources, and the CONFIG_PCI could be
> > hidden as well.
>
> I added the 64 bit config test as the original patch was to setup_64.c
> only (I think).
>
> +++ b/arch/x86/kernel/setup.c
> @@ -596,6 +596,13 @@ void __init setup_arch(char **cmdline_p)
>  
>       parse_early_param();
>  
> +#ifdef CONFIG_X86_64
> +#ifdef CONFIG_PCI
> +     if (pci_early_dump_regs)
> +             early_dump_pci_devices();
> +#endif
> +#endif

Yeah, I think this would be safe to enable generally though (certainly useful 
to enable everwhere)... Yinghai?

Thanks,
Jesse
