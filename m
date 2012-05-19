From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Sat, 19 May 2012 08:48:52 -0700
Message-ID: <4FB7C0E4.4000008@xenotime.net>
References: <Pine.LNX.4.44L0.1205191026400.1348-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:48892 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753547Ab2ESPsp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 19 May 2012 11:48:45 -0400
In-Reply-To: <Pine.LNX.4.44L0.1205191026400.1348-100000@netrider.rowland.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>, devel@driverdev.osuosl.org, USB list <linux-usb@vger.kernel.org>

On 05/19/2012 07:30 AM, Alan Stern wrote:

> On Fri, 18 May 2012, Randy Dunlap wrote:
> 
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> Add stubs for some usb core functions when CONFIG_USB
>> is not enabled.  This fixes these comedi build errors:
>>
>> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
>> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
>>
>> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>> ---
>> I am only adding the stubs that are needed for comedi to build.
>> I expect that more stubs will be needed as more build errors are
>> found.  It seems to me that linux/usb.h might need more (major)
>> moving of lines to support more stubs in the future.
> 
> This doesn't seem like the right thing to do.  If a driver needs to 
> register with the USB core then that driver should depend on 
> CONFIG_USB.
> 
> On the other hand, if the driver is capable of being built without USB 
> support then it should use the necessary preprocessor tests to protect 
> calls to any USB routines.


Yeah, my first patch (not on linux-usb list) to staging/comedi/drivers.c
just surrounded the usb helper functions with IS_ENABLED(CONFIG_USB).
I'm fine with that patch, but Greg said that he wanted stubs...


-- 
~Randy
