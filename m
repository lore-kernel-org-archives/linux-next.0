From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Tue, 01 Mar 2011 08:21:49 -0300
Message-ID: <4D6CD6CD.90200@infradead.org>
References: <20110228120501.eb6840e0.sfr@canb.auug.org.au> <201102280828.11058.hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:54253 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753794Ab1CALWC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2011 06:22:02 -0500
In-Reply-To: <201102280828.11058.hverkuil@xs4all.nl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em 28-02-2011 04:28, Hans Verkuil escreveu:
> On Monday, February 28, 2011 02:05:01 Stephen Rothwell wrote:
>> Hi Mauro,
>>
>> After merging the v4l-dvb tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> drivers/video/matrox/matroxfb_base.c: In function 'matroxfb_ioctl':
>> drivers/video/matrox/matroxfb_base.c:1155: error: 'VIDIOC_S_CTRL_OLD' undeclared (first use in this function)
>>
>> Caused by commit 0ff69fe7cebb65856eba7feb3fd76fb4ba365bf8 ("[media] v4l:
>> removal of old, obsolete ioctls"). grep is your friend ...
>>
>> I have used the v4l-dvb tree from next-20110225 for today.
>>
> 
> Mauro,
> 
> Here is the trivial fix for this. Must remember next time that matrox borrows
> some of the V4L2 API.

Yes, patch is trivial, but your patch is incomplete ;) The correct one is attached.
Btw, videodev2.h still have the definitions for VIDIOC_*_OLD. So, I'm preparing a
more complete patch removing the docbook definitions for it.

---

matrox: Remove definition for the legacy VIDIOC_*_OLD ioctls

Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/video/matrox/matroxfb_base.c b/drivers/video/matrox/matroxfb_base.c
index a082deb..8c9dbac 100644
--- a/drivers/video/matrox/matroxfb_base.c
+++ b/drivers/video/matrox/matroxfb_base.c
@@ -101,8 +101,6 @@
 
 #include <linux/version.h>
 
-#define __OLD_VIDIOC_
-
 #include "matroxfb_base.h"
 #include "matroxfb_misc.h"
 #include "matroxfb_accel.h"
@@ -1152,7 +1150,6 @@ static int matroxfb_ioctl(struct fb_info *info,
 					return -EFAULT;
 				return err;
 			}
-		case VIDIOC_S_CTRL_OLD:
 		case VIDIOC_S_CTRL:
 			{
 				struct v4l2_control ctrl;
