From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 31 (new arm, arm64, s390 failures)
Date: Mon, 31 Aug 2015 11:57:14 -0700
Message-ID: <55E4A38A.6070306@roeck-us.net>
References: <20150831195420.371e8849@canb.auug.org.au>	<20150831141736.GA19616@roeck-us.net>	<20150831163103.2e13b301@arm.com>	<55E476FB.2040208@roeck-us.net>	<20150831171807.27d78ff0@arm.com>	<55E4838B.5000500@roeck-us.net>	<20150831180922.4392875e@arm.com> <20150831192657.557e45cc@why.wild-wind.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39711 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751577AbbHaS5S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 14:57:18 -0400
In-Reply-To: <20150831192657.557e45cc@why.wild-wind.fr.eu.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "pi-cheng.chen" <pi-cheng.chen@linaro.org>, Alexei Starovoitov <ast@plumgrid.com>, Mark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>

Hi Marc,

On 08/31/2015 11:26 AM, Marc Zyngier wrote:
[ ... ]
>
> Actually, the kernel dies because of this:
>
> commit adaac459759db4a1fd35baddbe47bac700095496
> Author: Markus Pargmann <mpa@pengutronix.de>
> Date:   Sun Aug 30 09:33:53 2015 +0200
>
>      regmap: Introduce max_raw_read/write for regmap_bulk_read/write
>
>      There are some buses which have a limit on the maximum number of
>      bytes that can be send/received. An example for this is
>      I2C_FUNC_SMBUS_I2C_BLOCK which does not support any reads/writes of
>      more than 32 bytes. The regmap_bulk operations should still be able
>      to utilize the full 32 bytes in this case.
>
>      Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
>      Signed-off-by: Mark Brown <broonie@kernel.org>
>
> which never considers bus to be NULL in __regmap_init. With the
> following patch applied, I can boot to a prompt:
>
>  From 031eae5a1b34f952ba3dcaecb4eb4ec9d3bda352 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <marc.zyngier@arm.com>
> Date: Mon, 31 Aug 2015 19:16:16 +0100
> Subject: [PATCH] regmap: Fix max_raw_read/write handling when bus is NULL
>
> Commit adaac459759d ("regmap: Introduce max_raw_read/write
> for regmap_bulk_read/write") added new fields to regmap_bus
> and started using them in __regmap_init, but failed to
> consider the case where bus would be NULL, like in the
> vexpress-syscgf case. The box (actually its qemu version)
> ends up dying painfully.
>
> Fix it by testing bus before doing anything else.
>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Yes, that fixes the vexpress failures.

Tested-by: Guenter Roeck <linux@roeck-us.net>

However, I still need to revert your patches to get my realview-pb-a8
and realview-eb tests to work again.

I am a bit concerned about the use of of_address_to_resource(),
which can return an error, leaving cpu_res undefined. Also, if
both CONFIG_OF and CONFIG_ACPI are not configured, supports_deactivate
is set to true by default. This is the configuration used in my
failing tests.

With that in mind, I ran a simple test.

-static struct static_key supports_deactivate = STATIC_KEY_INIT_TRUE;
+static struct static_key supports_deactivate = STATIC_KEY_INIT_FALSE;

Bingo, problem solved. Can you try to find a clean solution ?

I wonder how it comes that you get a console output from qemu, but I don't.
Did you use multi_v7_defconfig or some other configuration ?

Thanks,
Guenter
