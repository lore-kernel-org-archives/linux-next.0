From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] ath6kl: force building as a module
Date: Wed, 04 Jan 2012 13:28:55 -0500 (EST)
Message-ID: <20120104.132855.1261837733994182914.davem@davemloft.net>
References: <20120104094134.28754.39652.stgit@x201>
	<4F042078.5040902@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F042078.5040902-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org
Cc: linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, ath6kl-devel-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Date: Wed, 4 Jan 2012 11:48:40 +0200

> On 01/04/2012 11:41 AM, Kalle Valo wrote:
>> Stephen reported that ath6kl fails if both sdio and usb are built
>> into the kernel:
>> 
>> ath6kl/cfg80211.c:27:1: error: expected ')' before 'KBUILD_MODNAME'
>> ath6kl/cfg80211.c:27:1: error: 'KBUILD_MODNAME' undeclared here (not in a function)
>> ath6kl/cfg80211.c:27:1: error: expected ',' or ';' before string constant
>> 
>> As a temporary fix make ath6kl build only as a module. This will be reverted
>> once a separate ath6kl core module is implemented which will fix this
>> properly.
>> 
>> Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
>> Signed-off-by: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
> 
> Sorry, forgot to CC people. The original patch is here:
> 
> http://marc.info/?l=linux-wireless&m=132567025132302&w=2
> 
> John, can you please take this directly so that the build problem gets
> fixed quickly? I will also apply it to ath6kl.git but that should not
> create any merge problems.

John can you very much NOT include this change, and if the ath6kl maintainers
can't fix this properly then revert the changes that caused this regression
in the first place?
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
