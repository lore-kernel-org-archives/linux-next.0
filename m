From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 07:41:19 -0800
Message-ID: <56C1F19F.8090100@roeck-us.net>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59302 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbcBOPlV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 10:41:21 -0500
In-Reply-To: <20160215105909.GH12289@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02/15/2016 02:59 AM, Uwe Kleine-K=F6nig wrote:
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
>
> Can you provide a complete boot log? This might already reveal which
> device is failing. It might not be the mmci device but something it
> depends on (clock, bus parent, irq).
>

Sure, something else may be failing, but why does reverting your patch
fix the problem ?

Anyway, complete logs are at http://kerneltests.org/builders.

http://kerneltests.org/builders/qemu-arm-next/builds/376/steps/qemubuil=
dcommand/logs/stdio

is the most recent log (next-20120215). Look for the vexpress crashes; =
the overo
crash bisected to to 'PM / OPP: Disable OPPs that aren't supported by t=
he regulator',
in next-20160212, which I have not fully analyzed yet, and the beagle c=
rashes
as well as the 'new' overo crash are brand new.

Guenter
