From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Jan 21
Date: Wed, 21 Jan 2015 12:08:05 +0100
Message-ID: <CAMuHMdXuO+tYjSSnxg+B26MbiXiG-1mmFZ+=rx+OsxnnSPbcnA@mail.gmail.com>
References: <20150121192608.61062b6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:34533 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbbAULIH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 06:08:07 -0500
In-Reply-To: <20150121192608.61062b6a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

On Wed, Jan 21, 2015 at 9:26 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Removed trees: (not updated for more that 1 year)
>         configfs
>         cpupowerutils
>         dwmw2
>         embedded
>         ep93xx
>         fbdev
>         firmware
>         fsnotify
>         fw-nohz
>         hwspinlock
>         input-mt
>         ixp4xx
>         kconfig
>         logfs
>         lzo-update
>         md-current
>         msm
>         omfs
>         openrisc
>         oprofile
>         parisc
>         pcmcia
>         signal
>         sysctl
>         uclinux
>         uml
>         uprobes
>         viafb
>         writeback

Have you informed the corresponding maintainers?
Especially architecture-specific trees like openrisc and parisc may still
be (somewhat) active.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
