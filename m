From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: next-2008-11-28 : can't mount UDF DVD
Date: Mon, 1 Dec 2008 01:18:56 +0100
Message-ID: <20081201001854.GA9881@joi>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au> <49332545.5020604@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ik-out-1112.google.com ([66.249.90.183]:20884 "EHLO
	ik-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753457AbYLAATL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 30 Nov 2008 19:19:11 -0500
Received: by ik-out-1112.google.com with SMTP id c29so1803957ika.5
        for <linux-next@vger.kernel.org>; Sun, 30 Nov 2008 16:19:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <49332545.5020604@free.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 01, 2008 at 12:44:05AM +0100, Laurent Riffard wrote:
> Hi,
> 
> With next-2008-11-28, I was unable to mount an UDF-formatted DVD-RW:
> 
> ~$ mount -oro -t udf /dev/sr0 /media/cdrom/
> mount: Not a directory
> 
> There was no problem with 2.6.28-rc6.
> 
> I made a bisection:
> 
> 33284bdf40f88160a154202510b27d983138c805 is first bad commit
> commit 33284bdf40f88160a154202510b27d983138c805
> Author: Marcin Slusarz <marcin.slusarz@gmail.com>
> Date:   Sun Nov 16 20:52:19 2008 +0100
> 
>     udf: implement mode and dmode mounting options
> 
>     "dmode" allows overriding permissions of directories and
>     "mode" allows overriding permissions of files.
> 
>     Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
>     Cc: Jan Kara <jack@suse.cz>
>     Signed-off-by: Jan Kara <jack@suse.cz>
> 
> 
> Indeed, with this commit, I *must* use the dmode option to mount my DVD:

That's not intended behaviour... ;)
 
> ~$ sudo mount -oro,dmode=0755 -t udf /dev/sr0 /media/cdrom/
> ~$ grep /media/cdrom /proc/mounts 
> /dev/scd0 /media/cdrom udf ro,mode=177777,dmode=755,utf8 0 0
                                     ^^^^^^
funny (it's 65535 / (u16)-1)

> ~$ ls -la /media/cdrom/
> total 46
> drwxr-xr-x  5 root    root     344 Dec 24  2007 .
> drwxr-xr-x 12 root    root    4096 Dec  1 00:17 ..
> drwxr-xr-x  2 laurent laurent 7112 Nov 30 20:14 flexbackup
> drwxr-xr-x  2 root    root      40 Nov 20  2005 lost+found
> drwxr-xr-x 10 laurent laurent 4548 Nov 25  2005 patches
> ~$ ls -la /media/cdrom/flexbackup/
> total 4307946
> drwxr-xr-x 2 laurent laurent       7112 Nov 30 20:14 .
> drwxr-xr-x 5 root    root           344 Dec 24  2007 ..
> ?rwsrwsrwt 1 laurent laurent         44 Oct  1  2006 00-index-key
> ...
> 
> Althought I was able to mount it with no special option on 2.6.28-rc6:
> 
> ~$ sudo mount -oro -t udf /dev/sr0 /media/cdrom/
> ~$ grep /media/cdrom /proc/mounts 
> /dev/scd0 /media/cdrom udf ro,utf8 0 0
> ~$ ls -la /media/cdrom/
> total 46
> drwxrwxrwx  5 root    root     344 2007-12-24 18:09 .
> drwxr-xr-x 12 root    root    4096 2008-12-01 00:22 ..
> drwxr-x---  2 laurent laurent 7112 2008-11-30 20:14 flexbackup
> drwxr-xr-x  2 root    root      40 2005-11-20 23:37 lost+found
> drwxr-x--- 10 laurent laurent 4548 2005-11-25 18:18 patches
> ~$ ls -la /media/cdrom/flexbackup/
> total 4307946
> drwxr-x--- 2 laurent laurent       7112 2008-11-30 20:14 .
> drwxrwxrwx 5 root    root           344 2007-12-24 18:09 ..
> -rw-r----- 1 laurent laurent         44 2006-10-01 15:36 00-index-key
> ...
> 
> ~~
> laurent

Can you check whether attached patch fixes it?
What architecture are you testing on?

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 6612a27..9eeb726 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -1222,10 +1222,10 @@ static void udf_fill_inode(struct inode *inode, struct buffer_head *bh)
 	iinfo->i_lenExtents = inode->i_size;
 
 	if (fe->icbTag.fileType != ICBTAG_FILE_TYPE_DIRECTORY &&
-			sbi->s_fmode != -1)
+			sbi->s_fmode != (mode_t)-1)
 		inode->i_mode = sbi->s_fmode;
 	else if (fe->icbTag.fileType == ICBTAG_FILE_TYPE_DIRECTORY &&
-			sbi->s_dmode != -1)
+			sbi->s_dmode != (mode_t)-1)
 		inode->i_mode = sbi->s_dmode;
 	else
 		inode->i_mode = udf_convert_permissions(fe);
diff --git a/fs/udf/super.c b/fs/udf/super.c
index e5d121d..af8a771 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -284,9 +284,9 @@ static int udf_show_options(struct seq_file *seq, struct vfsmount *mnt)
 		seq_printf(seq, ",gid=%u", sbi->s_gid);
 	if (sbi->s_umask != 0)
 		seq_printf(seq, ",umask=%o", sbi->s_umask);
-	if (sbi->s_fmode != -1)
+	if (sbi->s_fmode != (mode_t)-1)
 		seq_printf(seq, ",mode=%o", sbi->s_fmode);
-	if (sbi->s_dmode != -1)
+	if (sbi->s_dmode != (mode_t)-1)
 		seq_printf(seq, ",dmode=%o", sbi->s_dmode);
 	if (UDF_QUERY_FLAG(sb, UDF_FLAG_SESSION_SET))
 		seq_printf(seq, ",session=%u", sbi->s_session);
