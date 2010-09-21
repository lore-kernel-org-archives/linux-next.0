From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: linux-next: manual merge of the wireless tree with Linus' tree
Date: Tue, 21 Sep 2010 10:57:29 +0200
Message-ID: <AANLkTimNX=uYZLTfcxqXQVZCpJDCpdYKRubyy=8afdAS@mail.gmail.com>
References: <20100921120919.a38723d3.sfr@canb.auug.org.au> <AANLkTinxssqohSCfod8Q1emhJ6AB4Hkxo7EmkTtTxuf=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:62524 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755989Ab0IUI5t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2010 04:57:49 -0400
In-Reply-To: <AANLkTinxssqohSCfod8Q1emhJ6AB4Hkxo7EmkTtTxuf=@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Grazvydas Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>

On Tue, Sep 21, 2010 at 8:53 AM, Ohad Ben-Cohen <ohad@wizery.com> wrote=
:
> On Tue, Sep 21, 2010 at 4:09 AM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>> The wireless tree commit copied the include/linux/spi/wl12xx.h to
>> include/linux but did not remove the spi/ one.
>
> We had that one fixed in
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg34910.html
> but it seems an older patch accidentally got in.

Ok, figured this out - the correct patch _was_ taken, but commit
79ccf549b33c613b57eebcb03f8b24644c545a88 ("omap3: pandora: add NAND
and
wifi support") only came later, so the "#include <linux/spi/wl12xx.h>"
was only removed in the merge (so it was dropped from the original
patch).

Anyway your fix is good Stephen, Thank you.


>> --
>> Cheers,
>> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auu=
g.org.au
>>
>> diff --cc arch/arm/mach-omap2/board-omap3pandora.c
>> index dd3af2b,9b62b62..0000000
>> --- a/arch/arm/mach-omap2/board-omap3pandora.c
>> +++ b/arch/arm/mach-omap2/board-omap3pandora.c
>> @@@ -25,9 -25,7 +25,9 @@@
>> =A0#include <linux/spi/ads7846.h>
>> =A0#include <linux/regulator/machine.h>
>> =A0#include <linux/i2c/twl.h>
>> - #include <linux/spi/wl12xx.h>
>> + #include <linux/wl12xx.h>
>> =A0+#include <linux/mtd/partitions.h>
>> =A0+#include <linux/mtd/nand.h>
>> =A0#include <linux/leds.h>
>> =A0#include <linux/input.h>
>> =A0#include <linux/input/matrix_keypad.h>
>>
>
