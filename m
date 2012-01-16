From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: Re: linux-next: Tree for Jan 4 (usb/otg)
Date: Sun, 15 Jan 2012 22:15:43 -0800
Message-ID: <4F13C08F.8040405@xenotime.net>
References: <20120104191656.de575406a93b3c5226c531b2@canb.auug.org.au> <4F04E96F.6040501@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F04E96F.6040501-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 01/04/2012 04:06 PM, Randy Dunlap wrote:
> On 01/04/2012 12:16 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20120103:
> 
> 
> 
> ERROR: "usb_add_hcd" [drivers/usb/otg/mv_otg.ko] undefined!
> ERROR: "usb_remove_hcd" [drivers/usb/otg/mv_otg.ko] undefined!
> 
> 
> Full randconfig file is attached.


This is still a problem in linux-next of 20120116.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
