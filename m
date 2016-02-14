From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Sun, 14 Feb 2016 13:08:42 -0800
Message-ID: <56C0ECDA.1000203@roeck-us.net>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45951 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751191AbcBNVIp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2016 16:08:45 -0500
In-Reply-To: <20160214195501.GA12289@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>

On 02/14/2016 11:55 AM, Uwe Kleine-K=F6nig wrote:
> [adding lakml and rmk to Cc]
>
> Hello Guenter,
>
> On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
>> Uwe,
>>
>> Your patch 'driver-core: platform: probe of-devices only using list =
of
>> compatibles' causes the following qemu tests to crash in -next.
>>
>> arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
>> arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
>> arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
>> arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>>
>> Crash log:
>>
>> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error =
-6
>> Please append a correct "root=3D" boot option; here are the availabl=
e partitions:
>> 1f00          131072 mtdblock0  (driver?)
>> 1f01           32768 mtdblock1  (driver?)
>> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-=
block(0,0)
>>
>> ie the mmc driver no longer instantiates. Reverting the patch fixes =
the problem.
>
> The driver is drivers/mmc/host/mmci.c, right? and the relevant device
> tree snippet is:
>
> 	mmci@05000 {
> 		compatible =3D "arm,pl180", "arm,primecell";
> 		...
> 	};
>

Yes, I think so, or one of the many other similar mmc entries.

> ? So the unexpected abnormality here is that even though this device =
is
> instantiated by dt, the driver doesn't provide any compatibles.
> Either my expectation is wrong, then 67d02a1bbb33455 should be revert=
ed
> (or handle this case in a different way), or the mmci driver should
> declare compatibles (but then it needs to be a platform driver and no=
t
> an amba driver?).
>

No idea what the correct solution would be. I do see

         if (of_device_is_compatible(bus, "arm,primecell")) {
                 /*
                  * Don't return an error here to keep compatibility wi=
th older
                  * device tree files.
                  */
                 of_amba_device_create(bus, bus_id, platform_data, pare=
nt);
                 return 0;
         }

in drivers/of/platform.c, which suggests some special handling for amba
devices. No idea if and how that is related, but I do have some concern
that fixing the problem for mmc alone might not fix it for all the othe=
r
devices instantiated with "arm,primecell". After all, my boot tests are
really rudimentary (it boots, therefore it works).

Thanks,
Guenter
