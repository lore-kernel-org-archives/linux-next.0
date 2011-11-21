From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: linux-next: build warning after merge of the Linus' tree
Date: Mon, 21 Nov 2011 09:25:06 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1111210922090.10414@axis700.grange>
References: <20111121131701.44b49fc7da28170c9ee6b524@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:65236 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752175Ab1KUIZX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2011 03:25:23 -0500
In-Reply-To: <20111121131701.44b49fc7da28170c9ee6b524@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen

On Mon, 21 Nov 2011, Stephen Rothwell wrote:

> Hi all,
> 
> Building Linus' tree today linux-next (x86_64_allmodconfig)
> produced quite a few of these warnings:
> 
> include/media/soc_camera.h: In function 'soc_camera_i2c_to_vdev':
> include/media/soc_camera.h:257:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> 
> This was introduced by commit 2f0babb7e432 ("[media] V4L: soc-camera:
> make (almost) all client drivers re-usable outside of the framework").
> 
> This warning is caused by the "grp_id" member of "struct v4l2_subdev" -
> which is a u32 - being cast to a pointer.  That pointer is dereferenced,
> so I have no idea how that is supposed to work on any 64 bit platform.

soc-camera atm supports 7 platforms (if I haven't forgotten anyone), none 
of them is 64-bit. But you're right, it shall compile cleanly on 64 bits 
too, I'm working on a patch. Unfortunately, while working on it I came 
across other regressions, that blocked my tests... But a solution will be 
found.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
