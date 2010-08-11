From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: remove inode_setattr
Date: Wed, 11 Aug 2010 10:45:03 +1000
Message-ID: <20100811104503.4082f68f.sfr@canb.auug.org.au>
References: <201008101859.o7AIx9BM026915@hera.kernel.org>
	<20100810155011.b9657102.akpm@linux-foundation.org>
	<20100811101751.1afdded8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100811101751.1afdded8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Linus Torvalds <torvalds@linux-foundation.org>, Eric Van Hensbergen <ericvh@gmail.com>, Sripathi Kodi <sripathik@in.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi All,

On Wed, 11 Aug 2010 10:17:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Reported by me June 22 with a fixup, reminded Aug 4 and yesterday ... it
> needed to be fixed up by Linus when he merged Al's tree ...

I will apply this fix patch to linux-next today ... Al, Christoph, this
is the fix I sent out earlier.  Is it correct enough for Linus to apply
it?

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jun 2010 11:15:01 +1000
Subject: [PATCH] v9fs: fixup for inode_setattr being removed

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/9p/vfs_inode.c |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index f027a42..2ec7bfa 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -1052,10 +1052,19 @@ static int v9fs_vfs_setattr_dotl(struct dentry *dentry, struct iattr *iattr)
 		return PTR_ERR(fid);
 
 	retval = p9_client_setattr(fid, &p9attr);
-	if (retval >= 0)
-		retval = inode_setattr(dentry->d_inode, iattr);
+	if (retval < 0)
+		return retval;
 
-	return retval;
+	if ((iattr->ia_valid & ATTR_SIZE) &&
+	    iattr->ia_size != i_size_read(dentry->d_inode)) {
+		retval = vmtruncate(dentry->d_inode, iattr->ia_size);
+		if (retval)
+			return retval;
+	}
+
+	setattr_copy(dentry->d_inode, iattr);
+	mark_inode_dirty(dentry->d_inode);
+	return 0;
 }
 
 /**
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
