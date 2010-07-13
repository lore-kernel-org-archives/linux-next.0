From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the sound tree
Date: Tue, 13 Jul 2010 12:13:48 +1000
Message-ID: <20100713121348.c9e76987.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35855 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754173Ab0GMCNv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jul 2010 22:13:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/um/drivers/hostaudio_kern.c between commit
90dc763fef4c869e60b2a7ad92e1a7dab68575ea ("sound: push BKL into open
functions") from the sound tree and commit
6aad4054c113f2d8a8bbdee64e7167950dd06c92 ("param:lock-charp-simple") from
the rr tree.

Overlapping additions.  I fixed it up (see below) and carry the fix as necessary.

I was not sure if the kparam_(un)block_sysfs_write() calls needed to be
surrounded by the (un)lock_kernel() calls or vice verse.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/um/drivers/hostaudio_kern.c
index 68142df,162855c..0000000
--- a/arch/um/drivers/hostaudio_kern.c
+++ b/arch/um/drivers/hostaudio_kern.c
@@@ -199,10 -200,9 +201,12 @@@ static int hostaudio_open(struct inode 
  	if (file->f_mode & FMODE_WRITE)
  		w = 1;
  
 +	lock_kernel();
+ 	kparam_block_sysfs_write(dsp);
  	ret = os_open_file(dsp, of_set_rw(OPENFLAGS(), r, w), 0);
+ 	kparam_unblock_sysfs_write(dsp);
 +	unlock_kernel();
 +
  	if (ret < 0) {
  		kfree(state);
  		return ret;
@@@ -258,13 -258,15 +262,17 @@@ static int hostmixer_open_mixdev(struc
  	if (file->f_mode & FMODE_WRITE)
  		w = 1;
  
 +	lock_kernel();
+ 	kparam_block_sysfs_write(mixer);
  	ret = os_open_file(mixer, of_set_rw(OPENFLAGS(), r, w), 0);
+ 	kparam_unblock_sysfs_write(mixer);
 +	unlock_kernel();
  
  	if (ret < 0) {
+ 		kparam_block_sysfs_write(dsp);
  		printk(KERN_ERR "hostaudio_open_mixdev failed to open '%s', "
  		       "err = %d\n", dsp, -ret);
+ 		kparam_unblock_sysfs_write(dsp);
  		kfree(state);
  		return ret;
  	}
