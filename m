From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH -next v2] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Mon, 21 May 2012 11:48:13 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0020698BAC23B@AUSP01VMBX24.collaborationhost.net>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
 <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com>
 <4FB6FFBF.6000509@xenotime.net> <4FB7AB4D.5040900@mvista.com>
 <4FB7C028.80406@xenotime.net> <20120519161207.GA31712@kroah.com>
 <4FB7CACF.9030302@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail131.messagelabs.com ([216.82.242.99]:53073 "EHLO
	mail131.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499Ab2EUQs3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 12:48:29 -0400
In-Reply-To: <4FB7CACF.9030302@xenotime.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Frank Mori Hess <fmhess@users.sourceforge.net>, Sergei Shtylyov <sshtylyov@mvista.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Saturday, May 19, 2012 9:31 AM, Randy Dunlap wrote:
>
> Add stubs for some usb core functions when CONFIG_USB
> is not enabled.  This fixes these comedi build errors:
>
> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

Sorry about causing the trouble with my changes to the comedi staging driver.

I, wrongly, assumed that the usb register/deregister functions are already
stubbed like the pci functions. I'll make sure the check in the future.

Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>
