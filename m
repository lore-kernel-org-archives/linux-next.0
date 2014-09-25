From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: build warning after merge of the battery tree
Date: Thu, 25 Sep 2014 09:00:34 +0200
Message-ID: <1411628434.16755.3.camel@AMDC1943>
References: <20140925142206.5ebea1eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140925142206.5ebea1eb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-next.vger.kernel.org

On czw, 2014-09-25 at 14:22 +1000, Stephen Rothwell wrote:
> Hi Sebastian,
> 
> After merging the battery tree, today's linux-next build (powerpc
> ppc64_defconfig and x86_64 allmodconfig) produced this warning:
> 
> fs/sysfs/Kconfig:1:error: recursive dependency detected!
> fs/sysfs/Kconfig:1:	symbol SYSFS is selected by CHARGER_MAX14577
> drivers/power/Kconfig:327:	symbol CHARGER_MAX14577 depends on POWER_SUPPLY
> drivers/power/Kconfig:1:	symbol POWER_SUPPLY is selected by HID_SONY
> drivers/hid/Kconfig:649:	symbol HID_SONY depends on NEW_LEDS
> drivers/leds/Kconfig:8:	symbol NEW_LEDS is selected by SENSORS_APPLESMC
> drivers/hwmon/Kconfig:299:	symbol SENSORS_APPLESMC depends on HWMON
> drivers/hwmon/Kconfig:5:	symbol HWMON is selected by EEEPC_LAPTOP
> drivers/platform/x86/Kconfig:496:	symbol EEEPC_LAPTOP depends on HOTPLUG_PCI
> drivers/pci/hotplug/Kconfig:5:	symbol HOTPLUG_PCI depends on SYSFS
> 
> Caused by commit e30110e9c96f ("charger: max14577: Configure
> battery-dependent settings from DTS and sysfs").  Consider depending on
> SYSFS instead of selecting it ... or maybe making your driver work even
> without it.

I'll send a patch changing to "depends on".

Best regards,
Krzysztof
