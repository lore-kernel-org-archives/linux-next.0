From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uml-devel] [PATCH] um: Include generic barrier.h
Date: Wed, 15 Jan 2014 21:03:48 +0100
Message-ID: <CAMuHMdVkpd9W_sg2g4uztRVORddmOtuUW+ofweRhOmKcsi6XyA@mail.gmail.com>
References: <52D6B591.3070707@infradead.org>
	<1389814553-19861-1-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64246 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbaAOUDs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2014 15:03:48 -0500
Received: by mail-pb0-f46.google.com with SMTP id ma3so1613746pbc.33
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2014 12:03:48 -0800 (PST)
In-Reply-To: <1389814553-19861-1-git-send-email-richard@nod.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Linux-Next <linux-next@vger.kernel.org>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>

On Wed, Jan 15, 2014 at 8:35 PM, Richard Weinberger <richard@nod.at> wrote:
> --- a/arch/um/include/asm/Kbuild
> +++ b/arch/um/include/asm/Kbuild
> @@ -4,3 +4,4 @@ generic-y += ftrace.h pci.h io.h param.h delay.h mutex.h current.h exec.h
>  generic-y += switch_to.h clkdev.h
>  generic-y += trace_clock.h
>  generic-y += preempt.h
> +generic-y += barrier.h

Please use insertion sort instead of append, so Stephen doesn't have to
extend his patch "arch: Re-sort some Kbuild files to hopefully help avoid
some conflicts" for arch/um/include/asm/Kbuild.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
