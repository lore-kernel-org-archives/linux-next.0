From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next for Sept 4, recursive dependency detected
Date: Tue, 4 Sep 2012 12:31:30 +0200
Message-ID: <CA+icZUXOgvqGWbwg9rE9T+J47jjDDz-Mr98xpD=OmoqQCwt=Jw@mail.gmail.com>
References: <20120904102833.GA7095@cantor.Home>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:41496 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253Ab2IDKbc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 06:31:32 -0400
Received: by lbbgj3 with SMTP id gj3so2984551lbb.19
        for <linux-next@vger.kernel.org>; Tue, 04 Sep 2012 03:31:31 -0700 (PDT)
In-Reply-To: <20120904102833.GA7095@cantor.Home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jerry Snitselaar <dev@snitselaar.org>, linux-next@vger.kernel.org

On Tue, Sep 4, 2012 at 12:28 PM, Jerry Snitselaar <dev@snitselaar.org> wrote:
> make allyesconfig gives the following output:
>
> Switched to a new branch 'next'
> snits@cantor:~/dev/uek=>make allyesconfig
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   SHIPPED scripts/kconfig/zconf.tab.c
>   SHIPPED scripts/kconfig/zconf.lex.c
>   SHIPPED scripts/kconfig/zconf.hash.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf --allyesconfig Kconfig
> drivers/gpu/drm/udl/Kconfig:1:error: recursive dependency detected!
> drivers/gpu/drm/udl/Kconfig:1:       symbol DRM_UDL depends on USB_ARCH_HAS_HCD
> drivers/usb/Kconfig:76:              symbol USB_ARCH_HAS_HCD depends on USB_SUPPORT
> drivers/usb/Kconfig:58:              symbol USB_SUPPORT is selected by DRM_USB
> drivers/gpu/drm/Kconfig:22:          symbol DRM_USB is selected by DRM_UDL
> #
> # configuration written to .config
> #
>

Patch is already in drm-next, see [1].
Please, check the linux-next ML archive before reporting next time :-).

- Sedat -

[1] http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=95ca19cf8cbf6163805dc9dc6a83f73b3e75ea13
[2] http://marc.info/?t=127113979200003&r=1&w=2

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
