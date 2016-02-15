From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 10:12:40 -0800
Message-ID: <56C21518.5030606@roeck-us.net>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de> <56C1F19F.8090100@roeck-us.net>
 <20160215170025.GJ12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160215170025.GJ12289@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On 02/15/2016 09:00 AM, Uwe Kleine-K=F6nig wrote:
> On Mon, Feb 15, 2016 at 07:41:19AM -0800, Guenter Roeck wrote:
>> On 02/15/2016 02:59 AM, Uwe Kleine-K=F6nig wrote:
>>> Hello Guenter,
>>>
>>> On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
>>>> Uwe,
>>>>
>>>> Your patch 'driver-core: platform: probe of-devices only using lis=
t of
>>>> compatibles' causes the following qemu tests to crash in -next.
>>>>
>>>> arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
>>>> arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
>>>> arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
>>>> arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>>>>
>>>> Crash log:
>>>>
>>>> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): erro=
r -6
>>>> Please append a correct "root=3D" boot option; here are the availa=
ble partitions:
>>>> 1f00          131072 mtdblock0  (driver?)
>>>> 1f01           32768 mtdblock1  (driver?)
>>>> Kernel panic - not syncing: VFS: Unable to mount root fs on unknow=
n-block(0,0)
>>>
>>> Can you provide a complete boot log? This might already reveal whic=
h
>>> device is failing. It might not be the mmci device but something it
>>> depends on (clock, bus parent, irq).
>>>
>>
>> Sure, something else may be failing, but why does reverting your pat=
ch
>> fix the problem ?
>
> Well, my patch made matching of platform devices to platform drivers
> more strict. Your machine relies on the respective binding though. So=
 of
> course reverting my patch "repairs" your machine, but that doesn't
> necessarily mean that my patch is wrong. Even though I'm convinced in
> the meantime by Russell that there are false positives it doesn't
> necessarily imply that your case is such a false positive, too.
>
> One example of a combination of driver + device I intended to break w=
ith
> my patch was drivers/mtd/nand/mxc_nand.c and devices that got bound t=
o
> that by name. The driver does:
>
> 	const struct of_device_id *of_id =3D
> 		of_match_device(mxcnd_dt_ids, host->dev);
>
> and doesn't handle of_id being NULL after that. Some people argued (a=
lso
> for other drivers in similar situations) that this cannot happen beca=
use
> all compatibles had a non-NULL device_id. That is an error that is ea=
sy
> to make and so the idea was to just not bind in such a case and safe =
the
> user from the surprise.
>

I added some debugging on top of your patch, and get:

platform basic-mmio-gpio.1.auto: Device node exists [/smb/motherboard/i=
ofpga@7,00000000/sysreg@00000/sys_led@08], of_driver_match_device() fai=
led
platform basic-mmio-gpio.1.auto: platform_match_id() succeeded
platform basic-mmio-gpio.2.auto: Device node exists [/smb/motherboard/i=
ofpga@7,00000000/sysreg@00000/sys_mci@48], of_driver_match_device() fai=
led
platform basic-mmio-gpio.2.auto: platform_match_id() succeeded
platform basic-mmio-gpio.3.auto: Device node exists [/smb/motherboard/i=
ofpga@7,00000000/sysreg@00000/sys_flash@4c], of_driver_match_device() f=
ailed
platform basic-mmio-gpio.3.auto: platform_match_id() succeeded

So it isn't the mmc driver failing to instantiate directly,
but (I think) vexpress-sysreg.

Guenter
