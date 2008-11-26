From: "Eric Miao" <eric.y.miao@gmail.com>
Subject: Re: linux-next: arm build failure
Date: Wed, 26 Nov 2008 12:53:54 +0800
Message-ID: <f17812d70811252053n4fbd4c01k48fd52ca606460c2@mail.gmail.com>
References: <20081126133052.082e1d45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.234]:44269 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbYKZExy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 23:53:54 -0500
Received: by rv-out-0506.google.com with SMTP id k40so288684rvb.1
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 20:53:54 -0800 (PST)
In-Reply-To: <20081126133052.082e1d45.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Wed, Nov 26, 2008 at 10:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
> next-20081125 build (arm corgi_defconfig) failed like this:
>
> arch/arm/mach-pxa/built-in.o: In function `sleep_save_sp':
> tosa.c:(.data+0x3978): undefined reference to `tc6393xb_lcd_set_power'
> tosa.c:(.data+0x397c): undefined reference to `tc6393xb_lcd_mode'
>
> Caused by commit fc37aa322a7e9170979a044c3f178ae4162ca285 ("[ARM]
> pxa/tosa: support tc6393xb/tmiofb.").
>

Thanks Stephen.

This is caused by corgi_defconfig being incorrectly including the tosa
support, patch is ready for this and will be pushed out soon.

Dmitry,

Please handle the config dependency of tosa.c, tc6393xb.c and tmiofb
correctly.
