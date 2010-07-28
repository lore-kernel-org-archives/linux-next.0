From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 28 (lirc #2)
Date: Wed, 28 Jul 2010 10:24:17 -0700
Message-ID: <20100728102417.be60049a.randy.dunlap@oracle.com>
References: <20100728162855.4968e561.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20100728162855.4968e561.sfr@canb.auug.org.au>
Sender: linux-media-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, lirc-list@lists.sourceforge.net, Jarod Wilson <jarod@wilsonet.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, 28 Jul 2010 16:28:55 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100727:


When USB_SUPPORT is not enabled and MEDIA_SUPPORT is not enabled:


ERROR: "lirc_dev_fop_close" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_open" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_poll" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_write" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_read" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_register_driver" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_string" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_alloc_urb" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_alloc_coherent" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_ioctl" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_get_pdata" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_free_coherent" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_free_urb" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_unregister_driver" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_kill_urb" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_submit_urb" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "usb_deregister" [drivers/staging/lirc/lirc_streamzap.ko] undefined!
ERROR: "lirc_dev_fop_close" [drivers/staging/lirc/lirc_sir.ko] undefined!
ERROR: "lirc_dev_fop_open" [drivers/staging/lirc/lirc_sir.ko] undefined!
ERROR: "lirc_register_driver" [drivers/staging/lirc/lirc_sir.ko] undefined!
ERROR: "lirc_unregister_driver" [drivers/staging/lirc/lirc_sir.ko] undefined!

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
