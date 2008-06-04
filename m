From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: ldp build failure
Date: Tue, 3 Jun 2008 22:24:03 -0700
Message-ID: <20080604052403.GA13998@kroah.com>
References: <20080604150819.ec26f31f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:42059 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbYFDFZv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 01:25:51 -0400
Content-Disposition: inline
In-Reply-To: <20080604150819.ec26f31f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@infradead.org>, Dean Anderson <dean@sensoray.com>

On Wed, Jun 04, 2008 at 03:08:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/media/video/s2255drv.c:1659: error: unknown field 'vidioc_enum_fmt_cap' specified in initializer
> drivers/media/video/s2255drv.c:1659: warning: initialization from incompatible pointer type
> drivers/media/video/s2255drv.c:1660: error: unknown field 'vidioc_g_fmt_cap' specified in initializer
> drivers/media/video/s2255drv.c:1660: warning: initialization from incompatible pointer type
> drivers/media/video/s2255drv.c:1661: error: unknown field 'vidioc_try_fmt_cap' specified in initializer
> drivers/media/video/s2255drv.c:1661: warning: initialization from incompatible pointer type
> drivers/media/video/s2255drv.c:1662: error: unknown field 'vidioc_s_fmt_cap' specified in initializer
> drivers/media/video/s2255drv.c:1662: warning: initialization from incompatible pointer type
> 
> Caused by commit 7ddf62fca6b9be8867204dfcd062bca43a75bae6 ("V4L/DVB
> (7949): videodev: renamed the vidioc_*_fmt_* callbacks") from the v4l-dvb
> tree.  I applied the patch below.

Thanks for the patch, I'll apply it when I resend the driver to Mauro,
hopefully tomorrow :)

thanks,

greg k-h
