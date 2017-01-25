From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Date: Wed, 25 Jan 2017 09:13:30 +0100
Message-ID: <CA+M3ks7ToYdZF0Mv0=zcF2hTsst9HnDTc+pjcensrU6EeZhbZQ@mail.gmail.com>
References: <20170125155450.6e517bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:36683 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbdAYINc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Jan 2017 03:13:32 -0500
Received: by mail-qt0-f182.google.com with SMTP id k15so10014387qtg.3
        for <linux-next@vger.kernel.org>; Wed, 25 Jan 2017 00:13:32 -0800 (PST)
In-Reply-To: <20170125155450.6e517bfc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-01-25 5:54 GMT+01:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Lee,
>
> After merging the mfd tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> drivers/pwm/pwm-stm32.c: In function 'stm32_pwm_apply':
> drivers/pwm/pwm-stm32.c:204:33: warning: 'curstate.polarity' may be used =
uninitialized in this function [-Wmaybe-uninitialized]
>   if (state->polarity !=3D curstate.polarity)
>                                  ^
>

I will send a patch to fix that today

Benjamin

> Introduced by commit
>
>   bafffb6e7bd1 ("pwm: Add driver for STM32 plaftorm")
>
> --
> Cheers,
> Stephen Rothwell



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
