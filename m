From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 9 (build failures)
Date: Mon, 9 Feb 2015 09:20:48 -0800
Message-ID: <20150209172048.GA27107@roeck-us.net>
References: <20150209211827.652dc2ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:34343 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933558AbbBIRU5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2015 12:20:57 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YKs12-003oIf-AU
	for linux-next@vger.kernel.org; Mon, 09 Feb 2015 17:20:56 +0000
Content-Disposition: inline
In-Reply-To: <20150209211827.652dc2ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kenneth Westfield <kwestfie@codeaurora.org>, Mark Brown <broonie@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Daniel Lezcano <daniel.lezcano@linaro.org>

On Mon, Feb 09, 2015 at 09:18:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please oo not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 

Build failures:

Building arm:efm32_defconfig ... failed
--------------
Error log:
arm-poky-linux-gnueabi-ld: Text section oversize

[ wonder if I need a new/different compiler ]

---

Building mips:allmodconfig ... failed
--------------
Error log:

sound/soc/codecs/max98357a.c: In function 'max98357a_daiops_trigger':
sound/soc/codecs/max98357a.c:30:3: error: implicit declaration of function 'gpiod_set_value'
sound/soc/codecs/max98357a.c: In function 'max98357a_codec_probe':
sound/soc/codecs/max98357a.c:55:2: error: implicit declaration of function 'devm_gpiod_get'
sound/soc/codecs/max98357a.c:61:2: error: implicit declaration of function 'gpiod_direction_output'

Looks like this driver depends on GPIOLIB but does not select it,
and MIPS doesn't seem to support GPIOLIB. Missing dependencies ?

---

Building sparc64:allmodconfig ... failed
--------------
Error log:
asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_request_and_map'

---
Guenter
