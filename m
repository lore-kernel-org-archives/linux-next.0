From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 24 (hwmon/sch56xx)
Date: Thu, 24 May 2012 11:08:21 -0700
Message-ID: <4FBE7915.2000704@xenotime.net>
References: <20120524164915.fc6b1d90b75c50baab856280@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:58688 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S964862Ab2EXSIV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 May 2012 14:08:21 -0400
In-Reply-To: <20120524164915.fc6b1d90b75c50baab856280@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lm-sensors@lm-sensors.org, Hans de Goede <hdegoede@redhat.com>

On 05/23/12 23:49, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120523:




when CONFIG_WATCHDOG is not enabled:

drivers/built-in.o: In function `sch56xx_watchdog_register':
(.text+0x50711c): undefined reference to `watchdog_register_device'
drivers/built-in.o: In function `sch56xx_watchdog_unregister':
(.text+0x507171): undefined reference to `watchdog_unregister_device'

or when SCH56XX_COMMON=m:

ERROR: "watchdog_unregister_device" [drivers/hwmon/sch56xx-common.ko] undefined!
ERROR: "watchdog_register_device" [drivers/hwmon/sch56xx-common.ko] undefined!


-- 
~Randy
