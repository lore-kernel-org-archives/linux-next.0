From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] powerpc/opal: Add missing include
Date: Mon, 7 Apr 2014 23:03:36 +0200
Message-ID: <CAMuHMdV7BuSMu5gyhBcxY_8v+u3KnVStDgvC-JSN=hX3VZw3+g@mail.gmail.com>
References: <13762.1395708188@ale.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:56966 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572AbaDGVDi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Apr 2014 17:03:38 -0400
Received: by mail-wg0-f41.google.com with SMTP id n12so4852wgh.12
        for <linux-next@vger.kernel.org>; Mon, 07 Apr 2014 14:03:37 -0700 (PDT)
In-Reply-To: <13762.1395708188@ale.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, Linux PPC dev <linuxppc-dev@ozlabs.org>

On Tue, Mar 25, 2014 at 1:43 AM, Michael Neuling <mikey@neuling.org> wrote:
> next-20140324 currently fails compiling celleb_defconfig with:
>
> arch/powerpc/include/asm/opal.h:894:42: error: 'struct notifier_block' declared inside parameter list [-Werror]
> arch/powerpc/include/asm/opal.h:894:42: error: its scope is only this definition or declaration, which is probably not what you want [-Werror]
> arch/powerpc/include/asm/opal.h:896:14: error: 'struct notifier_block' declared inside parameter list [-Werror]
>
> This is due to a missing include which is added here.

This build issue has now been in mainline since a few days.

> Signed-off-by: Michael Neuling <mikey@neuling.org>
>
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index fe2aa0b..f57fb58 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -177,6 +177,8 @@ extern int opal_enter_rtas(struct rtas_args *args,
>
>  #ifndef __ASSEMBLY__
>
> +#include <linux/notifier.h>
> +
>  /* Other enums */
>  enum OpalVendorApiTokens {
>         OPAL_START_VENDOR_API_RANGE = 1000, OPAL_END_VENDOR_API_RANGE = 1999

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
