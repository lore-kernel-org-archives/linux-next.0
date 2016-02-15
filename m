From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 18:39:53 +0000
Message-ID: <56C21B79.8000408@arm.com>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de> <56C1F19F.8090100@roeck-us.net>
 <20160215170025.GJ12289@pengutronix.de> <56C21518.5030606@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47231 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752143AbcBOSj5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 13:39:57 -0500
In-Reply-To: <56C21518.5030606@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 15/02/16 18:12, Guenter Roeck wrote:

[...]

>
> I added some debugging on top of your patch, and get:
>
> platform basic-mmio-gpio.1.auto: Device node exists
> [/smb/motherboard/iofpga@7,00000000/sysreg@00000/sys_led@08],
> of_driver_match_device() failed
> platform basic-mmio-gpio.1.auto: platform_match_id() succeeded
> platform basic-mmio-gpio.2.auto: Device node exists
> [/smb/motherboard/iofpga@7,00000000/sysreg@00000/sys_mci@48],
> of_driver_match_device() failed
> platform basic-mmio-gpio.2.auto: platform_match_id() succeeded
> platform basic-mmio-gpio.3.auto: Device node exists
> [/smb/motherboard/iofpga@7,00000000/sysreg@00000/sys_flash@4c],
> of_driver_match_device() failed
> platform basic-mmio-gpio.3.auto: platform_match_id() succeeded
>
> So it isn't the mmc driver failing to instantiate directly,
> but (I think) vexpress-sysreg.
>

That's correct, I could reproduce this issue and reported with similar
analysis earlier [1]

--
Regards,
Sudeep

[1] http://www.spinics.net/lists/arm-kernel/msg483107.html
