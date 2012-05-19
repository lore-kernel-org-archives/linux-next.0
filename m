From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] comedi: fix build when USB is not enabled
Date: Fri, 18 May 2012 17:51:41 -0700
Message-ID: <4FB6EE9D.8010103@xenotime.net>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au> <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:48058 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932841Ab2ESAve (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 May 2012 20:51:34 -0400
In-Reply-To: <20120519005031.GA27613@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>, devel@driverdev.osuosl.org

On 05/18/2012 05:50 PM, Greg Kroah-Hartman wrote:

> On Fri, May 18, 2012 at 05:46:13PM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> Calls to optional subsystems cannot be made indiscriminately.
>> Enclose all of the usb helper functions inside
>> #if IS_ENABLED(CONFIG_USB)
>> to fix these build errors.
>>
>> (The pci helper functions are OK since there are stubs in
>> linux/pci.h for the called functions when PCI is not enabled.
>> Possibly the same could be done for the called USB functions.)
>>
>> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
>> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
> 
> I would rather stub these out in usb.h instead, care to make a patch for
> that?


I'll see how that goes...

-- 
~Randy
