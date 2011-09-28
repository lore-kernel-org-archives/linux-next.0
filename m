From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 28 (media/video/mt9p031.c)
Date: Wed, 28 Sep 2011 15:31:11 -0700
Message-ID: <4E83A02F.2020309@xenotime.net>
References: <20110928200404.6ed0d6c34161d233be8994fd@canb.auug.org.au> <4E839FCB.7050403@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E839FCB.7050403@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@redhat.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 09/28/11 15:29, Randy Dunlap wrote:
> On 09/28/11 03:04, Stephen Rothwell wrote:
>> Hi all,
> 
> 
> a.  Source file needs <linux/module.h> added to it unless the dropping
> of the moduleh tree for today already contained that patch.
> 
> b.  Build errors after adding <linux/module.h>:
> 
> when CONFIG_MEDIA_CONTROLLER is not enabled
> and CONFIG_VIDEO_V4L2_SUBDEV_API is not enabled:
> 
> 
> drivers/media/video/mt9p031.c:443:3: error: implicit declaration of function 'v4l2_subdev_get_try_format'
> drivers/media/video/mt9p031.c:457:3: error: implicit declaration of function 'v4l2_subdev_get_try_crop'
> drivers/media/video/mt9p031.c:888:42: error: 'struct v4l2_subdev' has no member named 'entity'


Similar problems with drivers/media/video/mt9t001.c.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
