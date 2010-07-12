From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] uvc: Fix multiple symbols definitions with UVC gadget
 and host drivers
Date: Mon, 12 Jul 2010 14:12:45 -0700
Message-ID: <4C3B854D.9050201@oracle.com>
References: <1278789185-24989-1-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:32080 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554Ab0GLVNL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2010 17:13:11 -0400
In-Reply-To: <1278789185-24989-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@infradead.org, mingo@elte.hu, sfr@canb.auug.org.au, linux-next@vger.kernel.org

Laurent Pinchart wrote:
> The UVC gadget driver borrowed code from the UVC host driver without
> changing the symbol names. This results in a namespace clash with
> multiple definitions of several symbols when compiling both drivers in
> the kernel.
> 
> Make all generic UVC functions and variables static in the UVC gadget
> driver, as the symbols are not referenced outside of the gadget driver.
> Rename the uvc_trace_param global variable to uvc_gadget_trace_param.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  drivers/usb/gadget/f_uvc.c     |    4 +-
>  drivers/usb/gadget/uvc.h       |   10 +--
>  drivers/usb/gadget/uvc_queue.c |  153 +++++++++++++++++++++-------------------
>  drivers/usb/gadget/uvc_queue.h |   20 -----
>  drivers/usb/gadget/uvc_v4l2.c  |    2 +-
>  drivers/usb/gadget/uvc_video.c |    6 +-
>  drivers/usb/gadget/webcam.c    |    4 +-
>  7 files changed, 89 insertions(+), 110 deletions(-)
