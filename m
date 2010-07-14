From: Arnd Bergmann <arnd@arndb.de>
Subject: sound/oss-msnd-pinnacle: ioctl needs the inode
Date: Wed, 14 Jul 2010 15:11:39 +0200
Message-ID: <201007141511.39507.arnd@arndb.de>
References: <20100713144007.55d3abc9.sfr@canb.auug.org.au> <20100713103623.bfb0d9b8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:57141 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753371Ab0GNNLw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Jul 2010 09:11:52 -0400
In-Reply-To: <20100713103623.bfb0d9b8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

This broke in sound/oss: convert to unlocked_ioctl, when I missed one
of the ioctl functions still using the inode pointer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
On Tuesday 13 July 2010, Randy Dunlap wrote:
> On Tue, 13 Jul 2010 14:40:07 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Not unexpectedly, we got some conflicts with the arm defconfig files
> > today ...
> 
> 
> sound/oss/msnd_pinnacle.c:644:error: 'inode' undeclared (first use in this function)
> 

Sorry about that, my fault. Please apply.

I checked all the other files I touched in the same patch, they either did
not have this problem, or I had done it correctly.

--- a/sound/oss/msnd_pinnacle.c
+++ b/sound/oss/msnd_pinnacle.c
@@ -641,7 +641,7 @@ static int mixer_ioctl(unsigned int cmd, unsigned long arg)
 
 static long dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	int minor = iminor(inode);
+	int minor = iminor(file->f_path.dentry->d_inode);
 	int ret;
 
 	if (cmd == OSS_GETVERSION) {
