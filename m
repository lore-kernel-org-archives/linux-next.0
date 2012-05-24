From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: Tree for May 24 (hwmon/sch56xx)
Date: Thu, 24 May 2012 22:15:32 +0200
Message-ID: <4FBE96E4.5070203@redhat.com>
References: <20120524164915.fc6b1d90b75c50baab856280@canb.auug.org.au> <4FBE7915.2000704@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23586 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756132Ab2EXUQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 May 2012 16:16:04 -0400
In-Reply-To: <4FBE7915.2000704@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lm-sensors@lm-sensors.org

Hi,

On 05/24/2012 08:08 PM, Randy Dunlap wrote:
> On 05/23/12 23:49, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120523:
>
>
>
>
> when CONFIG_WATCHDOG is not enabled:
>
> drivers/built-in.o: In function `sch56xx_watchdog_register':
> (.text+0x50711c): undefined reference to `watchdog_register_device'
> drivers/built-in.o: In function `sch56xx_watchdog_unregister':
> (.text+0x507171): undefined reference to `watchdog_unregister_device'
>
> or when SCH56XX_COMMON=m:
>
> ERROR: "watchdog_unregister_device" [drivers/hwmon/sch56xx-common.ko] undefined!
> ERROR: "watchdog_register_device" [drivers/hwmon/sch56xx-common.ko] undefined!

Thanks for catching this, I'll send a patch to linux-watchdog + linux-next
fixing this.

Regards,

Hans
