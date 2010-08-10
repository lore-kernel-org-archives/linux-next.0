From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [patch -NEXT] usb/gadget/webcam: fix Kconfig depends again
Date: Tue, 10 Aug 2010 07:48:57 -0700
Message-ID: <4C6166D9.60607@oracle.com>
References: <20100809132314.789e13f3.sfr@canb.auug.org.au> <20100809105520.d17e4795.randy.dunlap@oracle.com> <201008101416.31188.laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201008101416.31188.laurent.pinchart@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, lud <linux-usb@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Brownell <dbrownell@users.sourceforge.net>
List-Id: linux-next.vger.kernel.org

On 08/10/10 05:16, Laurent Pinchart wrote:
> Hi Randy,
> 
> Thanks for the patch.
> 
> On Monday 09 August 2010 19:55:20 Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> The USB gadget webcam driver uses V4L2 interfaces, so it should depend
>> on VIDEO_V4L2 instead of VIDEO_DEV.  This fixes a lot of build errors
>> when V4L2 is not enabled:
>>
>> ERROR: "v4l2_event_unsubscribe" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_queue" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_device_release" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_usercopy" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_dequeue" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_register_device" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_device_alloc" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_subscribe" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_unregister_device" [drivers/usb/gadget/g_webcam.ko]
>> undefined!
>> ERROR: "v4l2_fh_init" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_pending" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_init" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "video_devdata" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_event_alloc" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_fh_add" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_fh_del" [drivers/usb/gadget/g_webcam.ko] undefined!
>> ERROR: "v4l2_fh_exit" [drivers/usb/gadget/g_webcam.ko] undefined!
> 
> All those symbols should be defined when VIDEO_DEV is selected.
> 
>> ERROR: "v4l2_ctrl_fill" [drivers/media/video/v4l2-common.ko] undefined!
>> ERROR: "v4l2_ctrl_get_menu" [drivers/media/video/v4l2-common.ko] undefined!
> 
> Those 2 symbols require VIDEO_V4L2 but are not used by the webcam gadget 
> driver.
> 
>> ERROR: "v4l2_device_unregister_subdev" [drivers/media/video/v4l2-common.ko]
>> undefined!
>> ERROR: "v4l2_device_register_subdev" [drivers/media/video/v4l2-common.ko]
>> undefined!
> 
> Those two symbols should be defined when VIDEO_DEV is selected. They are not 
> used by the webcam gadget driver.
> 

Summary:  I should drop this patch and look elsewhere for the problem,
Right?

Thanks for your help.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
