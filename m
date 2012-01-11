From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the xen tree with Linus' tree
Date: Wed, 11 Jan 2012 16:29:05 +0100
Message-ID: <20120111152905.GA26659@elte.hu>
References: <20120111145709.77ef7d68996cd5fa724326e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35772 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932584Ab2AKP3k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jan 2012 10:29:40 -0500
Content-Disposition: inline
In-Reply-To: <20120111145709.77ef7d68996cd5fa724326e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>

* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the xen tree got a conflict in
> arch/x86/xen/Kconfig between commit 10fe570fc167 ("Revert "xen/debug:
> WARN_ON when identity PFN has no _PAGE_IOMAP flag set."") from Linus'
> tree and commit 23757fb5d678 ("xen: add CPU microcode update driver")
> from the xen tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/xen/Kconfig
> index fdce49c,4d04d4f..0000000
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@@ -50,3 -50,14 +50,6 @@@ config XEN_DEBUG_F
>   	  Enable statistics output and various tuning options in debugfs.
>   	  Enabling this option may incur a significant performance overhead.
>   
>  -config XEN_DEBUG
>  -	bool "Enable Xen debug checks"
>  -	depends on XEN
>  -	default n
>  -	help
>  -	  Enable various WARN_ON checks in the Xen MMU code.
>  -	  Enabling this option WILL incur a significant performance overhead.
>  -
> + config MICROCODE_XEN
> +        def_bool y
> +        depends on XEN_DOM0 && MICROCODE

Jeremy, Konrad, the current Xen microcode crap was objected to 
early last year by the people developing the x86 microcode 
subsystem - still you have put it into the Xen tree, without 
even Cc:-ing the people involved!

To make it even clearer, because you don't seem to be able to 
follow the proper upstream workflow unless forced to:

 NAKed-By: Ingo Molnar <mingo@elte.hu>

Please remove it from the Xen tree until the proper agreeement 
is reached.

Thanks,

	Ingo
