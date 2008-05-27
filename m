From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: hid build failure
Date: Tue, 27 May 2008 11:14:01 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0805271111560.18218@twin.jikos.cz>
References: <20080527131441.06f3a67f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from twin.jikos.cz ([213.151.79.26]:54287 "EHLO twin.jikos.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754549AbYE0JOW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 05:14:22 -0400
In-Reply-To: <20080527131441.06f3a67f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Tue, 27 May 2008, Stephen Rothwell wrote:

> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/hid/usbhid/hiddev.c: In function 'hiddev_compat_ioctl':
> drivers/hid/usbhid/hiddev.c:767: warning: passing argument 1 of 'hiddev_ioctl' from incompatible pointer type
> drivers/hid/usbhid/hiddev.c:767: warning: passing argument 2 of 'hiddev_ioctl' makes integer from pointer without a cast
> drivers/hid/usbhid/hiddev.c:767: error: too many arguments to function 'hiddev_ioctl'
> Caused by commit f888433ea1f5dd6dc8487463c61c9e6d08e7ef62 ("HID: Switch
> hiddev to unlocked_ioctl") which I have reverted.

Hi Stephen,

thanks a lot for reporting, Alan's patch missed to change the prototype in 
the compat handler, and I missed this too. 

Should be now fixed in my tree.

Thanks,

-- 
Jiri Kosina
SUSE Labs

