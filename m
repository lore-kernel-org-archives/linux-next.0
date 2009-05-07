From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemleak tree with the x86 tree
Date: Thu, 7 May 2009 11:23:10 +0200
Message-ID: <20090507092310.GA27707@elte.hu>
References: <20090507155444.47dd74ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45616 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760509AbZEGJXj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 05:23:39 -0400
Content-Disposition: inline
In-Reply-To: <20090507155444.47dd74ea.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Catalin,
> 
> Today's linux-next merge of the kmemleak tree got a conflict in
> arch/x86/kernel/vmlinux_32.lds.S arch/x86/kernel/vmlinux_64.lds.S between
> commit 091e52c3551d3031343df24b573b770b4c6c72b6 ("x86, vmlinux.lds: unify
> remaining parts") from the x86 tree and commit
> 31df83f3f517b8ae49ba1f3fe9d5e3dd108a3e37 ("x86: Provide _sdata in the
> vmlinux_*.lds.S files") from the kmemleak tree.
> 
> The former commit merges the two files while the latter modifies them.
> I applied the patch below to the merged file.  I can carry this as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 4c85b2e..0bbb2d1 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -107,6 +107,7 @@ SECTIONS
>  
>  	/* Data */
>  	. = ALIGN(PAGE_SIZE);
> +	_sdata = .;			/* Start of data section */
>  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
>  		DATA_DATA
>  		CONSTRUCTORS

At a quick glance, that line should be moved a line further down, to 
avoid a boot crash of linux-next with CONFIG_RELOCATABLE=y (which 
most distros ship with).

The kmemleak tree change should be submitted to the x86 tree as 
well, so we can merge it properly. (it's fine if the kmemleak tree 
has that commit too [it obviously needs it] - so there will still be 
a conflict - just the resolution will be a straightforward 'pick the 
x86 tree side' step.)

	Ingo
