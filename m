From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the backlight tree
Date: Wed, 27 May 2015 08:45:11 +0100
Message-ID: <20150527074511.GR11677@x1>
References: <20150527131118.6e3ef667@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34854 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741AbbE0HpQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2015 03:45:16 -0400
Received: by wicmx19 with SMTP id mx19so101439017wic.0
        for <linux-next@vger.kernel.org>; Wed, 27 May 2015 00:45:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150527131118.6e3ef667@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>

On Wed, 27 May 2015, Stephen Rothwell wrote:
> After merging the backlight tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> drivers/video/backlight/backlight.c: In function 'of_find_backlight_b=
y_node':
> drivers/video/backlight/backlight.c:563:2: error: implicit declaratio=
n of function 'of_platform_device_ensure' [-Werror=3Dimplicit-function-=
declaration]
>   of_platform_device_ensure(node);
>   ^
>=20
> Caused by commit 67a6b10546ea ("backlight: Probe backlight devices on
> demand").

Yes, I need to remove that commit.  Thanks for letting me know.

> I have used the backlight tree from next-20150526 for today.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
