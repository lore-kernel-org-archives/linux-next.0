From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the pci tree
Date: Tue, 1 Jul 2008 07:58:44 +0200
Message-ID: <20080701055844.GB14658@elte.hu>
References: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54182 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751488AbYGAF7A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 01:59:00 -0400
Content-Disposition: inline
In-Reply-To: <20080701135347.6afb4a84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next merge of the pci tree got a conflict in between 
> commit d752aed810d8c038a9a65819f0ba7c7da7425178 ("x86: rename 
> setup_32.c to setup.c") from the x86 tree and commit 
> e3f2baebf4209b5927e23fa65d5977d31db936b3 ("PCI/x86: early dump pci 
> conf space v2") from the pci tree.
> 
> The former merges setup_64.c into setup.c while the latter adds some 
> code to setup_arch in setup_64.c.  I applied the patch below to 
> setup.c. Probably worth checking that I did it right.

Jesse,

> +++ b/arch/x86/kernel/setup.c
> @@ -596,6 +596,13 @@ void __init setup_arch(char **cmdline_p)
>  
>  	parse_early_param();
>  
> +#ifdef CONFIG_X86_64
> +#ifdef CONFIG_PCI
> +	if (pci_early_dump_regs)
> +		early_dump_pci_devices();
> +#endif
> +#endif

hm, the commit looks a bit weird: why the ifdefs? There's nothing 64-bit 
about being able to dump early resources, and the CONFIG_PCI could be 
hidden as well.

	Ingo
