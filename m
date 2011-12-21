From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: Re: linux-next: Tree for Dec 19 (nfc)
Date: Wed, 21 Dec 2011 11:57:19 -0800
Message-ID: <4EF23A1F.60803@xenotime.net>
References: <20111219185556.f07c1f43e28cfd594aaa5fe0@canb.auug.org.au>	 <4EEFA21B.5010305@xenotime.net> <1324399181.5354.0.camel@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324399181.5354.0.camel@sortiz-mobl>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <samuel-jcdQHdrhKHMdnm+yROfE0A@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 12/20/2011 08:39 AM, Samuel Ortiz wrote:
> Hi Randy,
> 
> On Mon, 2011-12-19 at 12:44 -0800, Randy Dunlap wrote:
>> On 12/18/2011 11:55 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20111216:
>>
>>
>> (not new today, just not reported earlier)
> John applied my fix for this one. It should be fixed now.

Hi Samuel,

Is this supposed to be fixed in linux-next?
It still fails today (linux-next 20111221).


data.c:(.text+0x3e0): multiple definition of `nfc_llcp_mac_is_down'
data.c:(.text+0x400): multiple definition of `nfc_llcp_mac_is_up'
ntf.c:(.text+0xb60): multiple definition of `nfc_llcp_mac_is_down'
ntf.c:(.text+0xb80): multiple definition of `nfc_llcp_mac_is_up'
rsp.c:(.text+0x750): multiple definition of `nfc_llcp_mac_is_down'
rsp.c:(.text+0x770): multiple definition of `nfc_llcp_mac_is_up'
netlink.c:(.text+0x14e0): multiple definition of `nfc_llcp_mac_is_down'
netlink.c:(.text+0x1500): multiple definition of `nfc_llcp_mac_is_up'
af_nfc.c:(.text+0xe0): multiple definition of `nfc_llcp_mac_is_down'
af_nfc.c:(.text+0x100): multiple definition of `nfc_llcp_mac_is_up'
rawsock.c:(.text+0x1000): multiple definition of `nfc_llcp_mac_is_down'
rawsock.c:(.text+0x1020): multiple definition of `nfc_llcp_mac_is_up'


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
