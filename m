From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 21 (staging/easycap)
Date: Mon, 21 Jun 2010 09:00:49 -0700
Message-ID: <20100621090049.c7f11c2d.randy.dunlap@oracle.com>
References: <20100621170056.2fcf10ad.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100621170056.2fcf10ad.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 21 Jun 2010 17:00:56 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100618:


When CONFIG_USB is not enabled:

ERROR: "usb_kill_urb" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_deregister_dev" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "video_register_device" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_deregister" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "video_unregister_device" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_set_interface" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_register_dev" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_control_msg" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_submit_urb" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_get_dev" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_find_interface" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_free_urb" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "usb_alloc_urb" [drivers/staging/easycap/easycap.ko] undefined!


Adding "depends on USB" to EASYCAP is a good start.
After that and enabling CONFIG_USB, build of easycap gets:

ERROR: "video_register_device" [drivers/staging/easycap/easycap.ko] undefined!
ERROR: "video_unregister_device" [drivers/staging/easycap/easycap.ko] undefined!

because there is no media/video support enabled.  Also no SOUND enabled,
so I expect there to be build errors associated with sound also, meaning that
the Kconfig file should probably modified with something like

config EASYCAP
+	depends on USB && VIDEO_DEV && SND


This is something that the driver author should know the answer to and submit a
patch for.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
