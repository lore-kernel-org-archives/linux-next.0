From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 26 (usbcore)
Date: Mon, 26 Mar 2012 13:38:52 -0700
Message-ID: <4F70D3DC.6070004@xenotime.net>
References: <Pine.LNX.4.44L0.1203261550290.1179-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1203261550290.1179-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/26/2012 01:06 PM, Alan Stern wrote:

> On Mon, 26 Mar 2012, Greg KH wrote:
> 
>> On Mon, Mar 26, 2012 at 09:58:36AM -0700, Randy Dunlap wrote:
>>> On 03/25/2012 09:28 PM, Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Reminder: please do not add stuff destined for v3.5 to linux-next
>>>> included trees/branches until after v3.4-rc1 has been released.
>>>>
>>>> Changes since 20120323:
>>>
>>>
>>>
>>> on x86_64:
>>>
>>> ERROR: "utf16s_to_utf8s" [drivers/usb/core/usbcore.ko] undefined!
>>> ERROR: "usb_speed_string" [drivers/usb/core/usbcore.ko] undefined!
>>>
>>> Full randconfig file is attached.
>>
>> Odd, nothing in the usb core has changed in a while in this area,
>> although we might have gotten some core dependancies mixed up for random
>> configurations like this.
> 
> This is puzzling.
> 
> 	utf16s_to_utf8s is defined in fs/nls/nls_base.c,
> 	which is built according to CONFIG_NLS (in fs/nls/Makefile),
> 	which is selected by CONFIG_USB (in drivers/usb/Kconfig).
> 
> But the config that Randy attached had CONFIG_USB set to M and 
> CONFIG_NLS not set.  How is that possible?
> 
> 	usb_speed_string is defined in drivers/usb/usb-common.c,
> 	which is built according to CONFIG_USB_COMMON (in
> 		drivers/usb/Makefile),
> 	which defaults to Y if CONFIG_USB_SUPPORT and either
> 		CONFIG_USB or CONFIG_USB_GADGET is set (in 
> 		drivers/usb/Kconfig).
> 
> The problem here was that CONFIG_USB_SUPPORT isn't set but CONFIG_USB
> is set to M.  This used not to be possible, since CONFIG_USB was
> defined inside an "if USB_SUPPORT" section.  Maybe that got changed and
> needs to be fixed (but
> https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git thinks
> it's still not possible).  Or maybe Randy's tree is a little out of 
> date.


My tree is just linux-next to Mar. 26.

I'll look into it.

-- 
~Randy
