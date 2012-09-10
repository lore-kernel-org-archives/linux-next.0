From: gshark <gshark.jeong@gmail.com>
Subject: Re: mmotm 2012-09-06-16-46 uploaded (drivers/video/backlight/lm3639_bl)
Date: Mon, 10 Sep 2012 09:11:11 +0900
Message-ID: <504D301F.60209@gmail.com>
References: <20120906234735.1B54B20004E@hpza10.eem.corp.google.com> <504A93D3.7060203@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51647 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755269Ab2IJALY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Sep 2012 20:11:24 -0400
In-Reply-To: <504A93D3.7060203@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-next@vger.kernel.org, Daniel Jeong <daniel.jeong@ti.com>

Hi Randy.

LM3630/9 have the pins for led so these depend on BACKLIGHT_CLASS_DEVIC=
E=20
and I2C.
So we need to set LEDS_CLASS and NEW_LEDS.

I will put these two into driver/video/backlight/Kconfig file and patch=
=20
it so that you don't need to do it.

2012=EB=85=84 09=EC=9B=94 08=EC=9D=BC 09:39, Randy Dunlap =EC=93=B4 =EA=
=B8=80:
> On 09/06/2012 04:47 PM, akpm@linux-foundation.org wrote:
>
>> The mm-of-the-moment snapshot 2012-09-06-16-46 has been uploaded to
>>
>>     http://www.ozlabs.org/~akpm/mmotm/
>>
>
> on x86_64:
>
> ERROR: "led_classdev_register" [drivers/video/backlight/lm3639_bl.ko]=
 undefined!
> ERROR: "led_classdev_unregister" [drivers/video/backlight/lm3639_bl.k=
o] undefined!
>
> Full randconfig file is attached.
>
