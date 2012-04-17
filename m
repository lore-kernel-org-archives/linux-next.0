From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH -next] wireless: TI wlxxx depends on MAC80211
Date: Tue, 17 Apr 2012 11:29:27 -0700
Message-ID: <4F8DB687.2090701@xenotime.net>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>	 <4F8C784B.2040402@xenotime.net> <1334640620.27247.7.camel@cumari>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334640620.27247.7.camel@cumari>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 04/16/2012 10:30 PM, Luciano Coelho wrote:

> Hi Randy,
> 
> On Mon, 2012-04-16 at 12:51 -0700, Randy Dunlap wrote: 
>> From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
>>
>> wl12xx build fails with many undefined symbol errors when MAC80211
>> and CFG80211 are not enabled, so make WLCORE and WL12XX depend
>> on MAC80211 (which already depends on CFG80211).
>>
>> Here are a few of the many build errors:
>>
> 
> [...]
> 
>> Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
>> Cc:	Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>
>> Cc:	linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc:	"John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>> ---
> 
> Thanks for the patch!
> 
> 
>> --- linux-next-20120416.orig/drivers/net/wireless/ti/wl12xx/Kconfig
>> +++ linux-next-20120416/drivers/net/wireless/ti/wl12xx/Kconfig
>> @@ -1,5 +1,6 @@
>>  config WL12XX
>>         tristate "TI wl12xx support"
>> +	depends on MAC80211
>>         select WLCORE
> 
> Do we really need this one? wl12xx selects WLCORE which in turn depends
> on MAC80211 (with your change below).  Maybe we don't need this?

Hi,

[testing...]

The build fails if either one of these "depends" is omitted.


>> ---help---
>>  	  This module adds support for wireless adapters based on TI wl1271,
>> --- linux-next-20120416.orig/drivers/net/wireless/ti/wlcore/Kconfig
>> +++ linux-next-20120416/drivers/net/wireless/ti/wlcore/Kconfig
>> @@ -1,6 +1,6 @@
>>  config WLCORE
>>  	tristate "TI wlcore support"
>> -	depends on WL_TI && GENERIC_HARDIRQS
>> +	depends on WL_TI && GENERIC_HARDIRQS && MAC80211
>>  	depends on INET
>>  	select FW_LOADER
>>  	---help---
> 



-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
