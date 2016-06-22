From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] mwifiex: Reduce endian conversion for REG Host Commands
Date: Wed, 22 Jun 2016 13:51:47 +0300
Message-ID: <87eg7ph4xo.fsf@kamboji.qca.qualcomm.com>
References: <201606220027.euqOehrM%fengguang.wu@intel.com>
	<1466591125-32128-1-git-send-email-prasunmaiti87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466591125-32128-1-git-send-email-prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Prasun Maiti's message of "Wed, 22 Jun 2016 15:55:25 +0530")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> For multiple REG Host Commands (e.g HostCmd_CMD_802_11_EEPROM_ACCESS,
> HostCmd_CMD_MAC_REG_ACCESS etc.) "cpu_to_leX"-converted values are
> saved to driver. So, "leX_to_cpu" conversion is required too many
> times afterwards in driver.
>
> This patch reduces the endian: conversion without saving "cpu_to_leX"
> converted values in driver. This will convert endianness in prepare
> command and command response path.
>
> Signed-off-by: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

If you send a new version of the patch mark it as [PATCH v2] and always
include a change log so that people don't need to guess what has
changed:

http://kernelnewbies.org/FirstKernelPatch#head-5c81b3c517a1d0bbc24f92594cb734e155fcbbcb

So now you should send a v3 and include a changelog.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
