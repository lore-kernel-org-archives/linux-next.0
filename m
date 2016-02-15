From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 18:15:43 +0000
Message-ID: <56C215CF.1030509@arm.com>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de> <56C1F19F.8090100@roeck-us.net>
 <56C20DD6.8050604@arm.com> <20160215180333.GK10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47061 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752055AbcBOSPq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 13:15:46 -0500
In-Reply-To: <20160215180333.GK10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 15/02/16 18:03, Russell King - ARM Linux wrote:
> On Mon, Feb 15, 2016 at 05:41:42PM +0000, Sudeep Holla wrote:
>> Sorry for missing this earlier, I could reproduce this on my TC2.
>> The issue is with card-detect gpio probing. It's not related to AMBA
>> probing as discussed on the mail thread.
>>
>> mfd_add_device adds devices with of_node when cell->of_compatible is
>> matched, but the device created is expected to be matched based on name
>> which the patch under discussion clearly breaks.
>
> If I'm understanding you correctly, you're saying that MFD re-adds
> platform devices with the of_node of a new platform device pointing
> to an existing of_node, but expects this new platform device to
> match a _different_ driver?
>

Sorry if I was not clear.

I don't think it re-adds. IIUC mfd cells are specified inside the
mfd device DT node. MFD adds devices for it's child nodes with the
associated device node but with the name specified by MFD cells
matching the compatible.

> Sounds like MFD needs fixing.  I've said this before: of_node's must
> _never_ be copied between different device structures, especially
> when they are on the _same_ bus - quite simply because the driver
> core _can_ match using the DT compatible.
>

I don't think that's happening in this case at-least. For example:

Device node compatible: arm,vexpress-sysreg
Child node compatible: arm,vexpress-sysreg,sys_mci

MFD device is created for above child node with name
"basic-mmio-gpio.<id>.auto" as it matched the MFD cell of_compatible

Since there's no driver to match "arm,vexpress-sysreg,sys_mci", it fails
with $subject patch applied which otherwise would do normal name matching

-- 
Regards,
Sudeep
