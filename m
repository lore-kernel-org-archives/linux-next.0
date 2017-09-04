From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Mon, 4 Sep 2017 15:29:03 +1000
Message-ID: <20170904152903.09fc4876@canb.auug.org.au>
References: <20170822133802.4c291ed8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbdIDF3E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 01:29:04 -0400
In-Reply-To: <20170822133802.4c291ed8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi all,

On Tue, 22 Aug 2017 13:38:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/firmware/efi/libstub/arm64-stub.c
> 
> between commit:
> 
>   170976bcab07 ("efi/arm64: add EFI_KIMG_ALIGN")
> 
> from the arm64 tree and commit:
> 
>   0426a4e68f18 ("efi/libstub/arm64: Force 'hidden' visibility for section markers")
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
> diff --cc drivers/firmware/efi/libstub/arm64-stub.c
> index af6ae95a5e34,f7a6970e9abc..000000000000
> --- a/drivers/firmware/efi/libstub/arm64-stub.c
> +++ b/drivers/firmware/efi/libstub/arm64-stub.c
> @@@ -9,10 -9,17 +9,18 @@@
>    * published by the Free Software Foundation.
>    *
>    */
> + 
> + /*
> +  * To prevent the compiler from emitting GOT-indirected (and thus absolute)
> +  * references to the section markers, override their visibility as 'hidden'
> +  */
> + #pragma GCC visibility push(hidden)
> + #include <asm/sections.h>
> + #pragma GCC visibility pop
> + 
>   #include <linux/efi.h>
>   #include <asm/efi.h>
>  +#include <asm/memory.h>
> - #include <asm/sections.h>
>   #include <asm/sysreg.h>
>   
>   #include "efistub.h"

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
