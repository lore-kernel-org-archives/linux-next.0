From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 8 (HID)
Date: Fri, 18 Jul 2008 15:37:32 -0700
Message-ID: <20080718153732.d79f7d9f.randy.dunlap@oracle.com>
References: <20080708192251.3275d283.sfr@canb.auug.org.au>
	<20080708111649.e61b19bc.randy.dunlap@oracle.com>
	<alpine.LNX.1.10.0807090954480.25171@jikos.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:60783 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754075AbYGRWiN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 18:38:13 -0400
In-Reply-To: <alpine.LNX.1.10.0807090954480.25171@jikos.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Jiri Slaby <jslaby@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, Pascal Terjan <pterjan@mandriva.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 9 Jul 2008 09:59:24 +0200 (CEST) Jiri Kosina wrote:

> On Tue, 8 Jul 2008, Randy Dunlap wrote:
> 
> > drivers/built-in.o: In function `usb_kbd_probe':
> > usbkbd.c:(.text+0x1457c9): undefined reference to `usbhid_lookup_quirk'
> > drivers/built-in.o: In function `usb_mouse_probe':
> > usbmouse.c:(.text+0x14603c): undefined reference to `usbhid_lookup_quirk'
> > make[1]: *** [.tmp_vmlinux1] Error 1
> 
> This got introduced by Jiri's
> 
>  	HID: fix quirk handling in usbmouse/kbd
> 
> Added to CC (and added also Pascal).
> 
> The dependency of usbkbd/usbmouse on usbhid is strange anyway. I'd 
> probably remove the whole quirk lookup thing from usbkbd/usbmouse drivers. 
> They introduce this ugly dependency, which is not worth it I guess. Also 
> usbkbd/usbmouse drivers are not needed in the vast majority of cases 
> anyway, and they shouldn't be loaded in standard configurations at all.

Build error still present in linux-next 20080718.
Please fix it in some manner.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
