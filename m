From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 17:41:42 +0000
Message-ID: <56C20DD6.8050604@arm.com>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de> <56C1F19F.8090100@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:46845 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752444AbcBORlp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 12:41:45 -0500
In-Reply-To: <56C1F19F.8090100@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 15/02/16 15:41, Guenter Roeck wrote:
> On 02/15/2016 02:59 AM, Uwe Kleine-K=F6nig wrote:
>> Hello Guenter,
>>
>> On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
>>> Uwe,
>>>
>>> Your patch 'driver-core: platform: probe of-devices only using list=
 of
>>> compatibles' causes the following qemu tests to crash in -next.
>>>
>>> arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
>>> arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
>>> arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
>>> arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>>>
>>> Crash log:
>>>
>>> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error=
 -6
>>> Please append a correct "root=3D" boot option; here are the availab=
le
>>> partitions:
>>> 1f00          131072 mtdblock0  (driver?)
>>> 1f01           32768 mtdblock1  (driver?)
>>> Kernel panic - not syncing: VFS: Unable to mount root fs on
>>> unknown-block(0,0)
>>
>> Can you provide a complete boot log? This might already reveal which
>> device is failing. It might not be the mmci device but something it
>> depends on (clock, bus parent, irq).
>>
>
> Sure, something else may be failing, but why does reverting your patc=
h
> fix the problem ?
>
> Anyway, complete logs are at http://kerneltests.org/builders.
>
> http://kerneltests.org/builders/qemu-arm-next/builds/376/steps/qemubu=
ildcommand/logs/stdio
>
>

Sorry for missing this earlier, I could reproduce this on my TC2.
The issue is with card-detect gpio probing. It's not related to AMBA
probing as discussed on the mail thread.

mfd_add_device adds devices with of_node when cell->of_compatible is
matched, but the device created is expected to be matched based on name
which the patch under discussion clearly breaks.

One other option I see is to set driver_override for mfd devices
(something like below) but I am not sure that can be generic.

--=20
Regards,
Sudeep
