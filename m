From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 14 (staging#2)
Date: Fri, 14 Nov 2008 10:11:11 -0800
Message-ID: <20081114101111.f138c2ba.randy.dunlap@oracle.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:35176 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbYKNSLX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 13:11:23 -0500
In-Reply-To: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 14 Nov 2008 18:40:21 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20081113:
> 
> New tree:
> 	staging

ERROR: "usb_deregister" [drivers/staging/asus_oled/asus_oled.ko] undefined!
ERROR: "usb_get_dev" [drivers/staging/asus_oled/asus_oled.ko] undefined!
ERROR: "usb_bulk_msg" [drivers/staging/asus_oled/asus_oled.ko] undefined!
ERROR: "usb_put_dev" [drivers/staging/asus_oled/asus_oled.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/asus_oled/asus_oled.ko] undefined!

(CONFIG_USB=n)

---
~Randy
