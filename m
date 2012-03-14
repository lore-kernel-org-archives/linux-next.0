From: Chris Kelly <ckelly@ozmodevices.com>
Subject: RE: [PATCH -next] staging: ozwpan depends on NET
Date: Wed, 14 Mar 2012 17:10:44 +0000
Message-ID: <57C28D85C66F5C49B9E212CBFAFDAC1F2AB8D287@CH1PRD0802MB120.namprd08.prod.outlook.com>
References: <20120314181921.59451eca117c276461f7dc28@canb.auug.org.au>
 <4F60CF2F.5050505@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]:43796
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759325Ab2CNRKu convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Mar 2012 13:10:50 -0400
In-Reply-To: <4F60CF2F.5050505@xenotime.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

Hi Randy,

Agreed - many thanks for this.

Chris Kelly

-----Original Message-----
>From: Randy Dunlap [mailto:rdunlap@xenotime.net] 
>Sent: 14 March 2012 5:03 PM
>To: Stephen Rothwell
>Cc: linux-next@vger.kernel.org; LKML; Chris Kelly; Greg Kroah-Hartman; devel@driverdev.osuosl.org
>Subject: [PATCH -next] staging: ozwpan depends on NET

>From: Randy Dunlap <rdunlap@xenotime.net>

>Fix build errors:  add depends on NET.

>ERROR: "skb_clone" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "dev_get_by_name" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "dev_remove_pack" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "init_net" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "__alloc_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "kfree_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "dev_add_pack" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "consume_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "dev_queue_xmit" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>ERROR: "skb_put" [drivers/staging/ozwpan/ozwpan.ko] undefined!

>Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

Acked-by: Chris Kelly <ckelly@ozmodevices.com>

>Cc: Chris Kelly <ckelly@ozmodevices.com>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>---
> drivers/staging/ozwpan/Kconfig |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

>--- linux-next-20120314.orig/drivers/staging/ozwpan/Kconfig
>+++ linux-next-20120314/drivers/staging/ozwpan/Kconfig
>@@ -1,6 +1,6 @@
> config USB_WPAN_HCD
> 	tristate "USB over WiFi Host Controller"
>-	depends on USB
>+	depends on USB && NET
> 	help
> 	  A driver for USB Host Controllers that are compatible with
> 	  Ozmo Devices USB over WiFi technology.
