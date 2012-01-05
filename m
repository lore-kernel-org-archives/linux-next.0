From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Thu, 5 Jan 2012 08:19:21 +0000
Message-ID: <20120105081921.GJ23916@ZenIV.linux.org.uk>
References: <20120105173521.9adbe29e16ca0e7361f79c36@canb.auug.org.au>
 <20120105080657.GH23916@ZenIV.linux.org.uk>
 <20120105191434.6a21befed93e6ec39a3da62d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120105191434.6a21befed93e6ec39a3da62d@canb.auug.org.au>
Sender: reiserfs-devel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jan 05, 2012 at 07:14:34PM +1100, Stephen Rothwell wrote:
> > by the second (i.e. replace mnt->mnt_sb with dentry->d_sb).  Incidentally,
> 
> OK, I may apply that fix tomorrow.

FWIW, incremental is simply

--- a/fs/reiserfs/super.c	2012-01-05 03:18:03.000000000 -0500
+++ b/fs/reiserfs/super.c	2012-01-05 03:09:45.000000000 -0500
@@ -598,9 +598,9 @@
 	reiserfs_write_unlock_once(inode->i_sb, lock_depth);
 }
 
-static int reiserfs_show_options(struct seq_file *seq, struct vfsmount *vfs)
+static int reiserfs_show_options(struct seq_file *seq, struct dentry *root)
 {
-	struct super_block *s = vfs->mnt_sb;
+	struct super_block *s = root->d_sb;
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
 	long opts = REISERFS_SB(s)->s_mount_opt;
 
