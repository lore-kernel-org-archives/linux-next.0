From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] wireless: make WEXT_SPY and WEXT_PRIV select WEXT_CORE
Date: Wed, 07 Oct 2009 15:54:53 -0700
Message-ID: <4ACD1C3D.3030506@oracle.com>
References: <20091007105720.a2457e5b.randy.dunlap@oracle.com>	 <1254949672-24022-1-git-send-email-linville@tuxdriver.com>	 <4ACD0E5A.7060106@oracle.com> <1254954842.3713.7.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1254954842.3713.7.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Johannes Berg wrote:
> On Wed, 2009-10-07 at 14:55 -0700, Randy Dunlap wrote:
>> John W. Linville wrote:
>>> Should prevent this build error reported by Randy...
>>>
>>> net/wireless/wext-priv.c:206: error: implicit declaration of function 'call_commit_handler'
>>> make[3]: *** [net/wireless/wext-priv.o] Error 1
>>>
>>> Reported-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>> Sorry, it did not work for me.
> 
>> linux-next-20091007/net/wireless/wext-priv.c:206: error: implicit declaration of function 'call_commit_handler'
>> make[3]: *** [net/wireless/wext-priv.o] Error 1
>>
>> Drivers like hostap and orinoco (hermes) select WEXT_PRIV regardless
>> of the setting of WEXT_CORE.  oh, and staging/ drivers do that also.
> 
> But they also select WIRELESS_EXT, which should cause WEXT_CORE to be
> turned on. Is it possible that is failing?

# CONFIG_WIRELESS is not set
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_SPY=y
CONFIG_WEXT_PRIV=y

WEXT_CORE is not enabled.  I haven't found the culprit, but I suspect "select".

but what in WIRELESS_EXT would also cause WEXT_CORE to be enabled?

~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
