From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Date: Mon, 3 Jul 2017 11:08:26 +1000
Message-ID: <20170703110826.69c06189@canb.auug.org.au>
References: <20170623135017.01837f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752124AbdGCBI3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 21:08:29 -0400
In-Reply-To: <20170623135017.01837f77@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Al,

Since part of the tip tree has been merged into the vfs tree, this
conflict also applies to the vfs tree, now.

On Fri, 23 Jun 2017 13:50:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm/include/uapi/asm/Kbuild
> 
> between commit:
> 
>   ae3f4151737d ("kbuild: replace genhdr-y with generated-y")
> 
> from the kbuild tree and commit:
> 
>   6bc51cbaa9d7 ("signal: Remove non-uapi <asm/siginfo.h>")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm/include/uapi/asm/Kbuild
> index 424935e4515d,e9b098d6b766..000000000000
> --- a/arch/arm/include/uapi/asm/Kbuild
> +++ b/arch/arm/include/uapi/asm/Kbuild
> @@@ -1,6 -1,8 +1,8 @@@
>   # UAPI Header export list
>   include include/uapi/asm-generic/Kbuild.asm
>   
>  -genhdr-y += unistd-common.h
>  -genhdr-y += unistd-oabi.h
>  -genhdr-y += unistd-eabi.h
>  +generated-y += unistd-common.h
>  +generated-y += unistd-oabi.h
>  +generated-y += unistd-eabi.h
> + 
> + generic-y += siginfo.h

-- 
Cheers,
Stephen Rothwell
