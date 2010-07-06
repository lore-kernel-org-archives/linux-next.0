From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the usb tree with the v4l-dvb tree
Date: Tue, 06 Jul 2010 09:34:51 -0300
Message-ID: <4C3322EB.2050806@infradead.org>
References: <20100706175332.952fec90.sfr@canb.auug.org.au> <201007061018.21674.laurent.pinchart@ideasonboard.com> <20100706185132.7dd72993.sfr@canb.auug.org.au> <201007061310.06197.laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:55544 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000Ab0GFMew (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Jul 2010 08:34:52 -0400
In-Reply-To: <201007061310.06197.laurent.pinchart@ideasonboard.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em 06-07-2010 08:10, Laurent Pinchart escreveu:
> Hi Stephen,
> 
> On Tuesday 06 July 2010 10:51:32 Stephen Rothwell wrote:
>> On Tue, 6 Jul 2010 10:18:20 +0200 Laurent Pinchart wrote:
>>>> diff --cc include/linux/usb/video.h
>>>> index 2d5b7fc,429c91a..0000000
>>>> --- a/include/linux/usb/video.h
>>>> +++ b/include/linux/usb/video.h
>>>> @@@ -160,12 -160,402 +160,409 @@@
>>>
>>> [snip]
>>>
>>>>  +/* 4.1.2. Control Capabilities */
>>>>  +#define UVC_CONTROL_CAP_GET                           (1 << 0)
>>>>  +#define UVC_CONTROL_CAP_SET                           (1 << 1)
>>>>  +#define UVC_CONTROL_CAP_DISABLED                      (1 << 2)
>>>>  +#define UVC_CONTROL_CAP_AUTOUPDATE                    (1 << 3)
>>>>  +#define UVC_CONTROL_CAP_ASYNCHRONOUS                  (1 << 4)
>>>>  +
>>>
>>> Can you move those to the first part of the header file, with the other
>>> constants ?
>>
>> Sure, I just put it there because of the section numbering in the
>> comments.  This, of course, will not influence how the file looks after
>> Linus merges it - unless the conflict is fixed up by one of the
>> maintainers before Linus gets it.
> 
> I had the impression that the conflict resolutions in linux-next would end up 
> in mainline. I must have been wrong, sorry.
> 
> Mauro, can the uvc-gadget patches go through the linux-media tree ?

If Greg is ok, that's fine for me.

Cheers,
Mauro.
 
