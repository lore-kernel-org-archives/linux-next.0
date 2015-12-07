From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the file-locks tree
Date: Mon, 7 Dec 2015 12:57:28 +1100
Message-ID: <20151207125728.101b1aff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51707 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755189AbbLGB5a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 20:57:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jeff Layton <jlayton@poochiereds.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jeff.layton@primarydata.com>, Christoph Hellwig <hch@lst.de>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  include/linux/fs.h

between commit:

  9e8925b67a80 ("locks: Allow disabling mandatory locking at compile time")

from the file-locks tree and commit:

  9e48b0c90a29 ("locks: new locks_mandatory_area calling convention")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/fs.h
index cbf08d5c246e,59bf96d82d1d..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2027,12 -2035,9 +2035,9 @@@ extern struct kobject *fs_kobj
  
  #define MAX_RW_COUNT (INT_MAX & PAGE_CACHE_MASK)
  
- #define FLOCK_VERIFY_READ  1
- #define FLOCK_VERIFY_WRITE 2
- 
 -#ifdef CONFIG_FILE_LOCKING
 +#ifdef CONFIG_MANDATORY_FILE_LOCKING
  extern int locks_mandatory_locked(struct file *);
- extern int locks_mandatory_area(int, struct inode *, struct file *, loff_t, size_t);
+ extern int locks_mandatory_area(struct file *, loff_t, loff_t, unsigned char);
  
  /*
   * Candidates for mandatory locking have the setgid bit set
@@@ -2065,55 -2070,18 +2070,56 @@@ static inline int locks_verify_truncate
  				    struct file *filp,
  				    loff_t size)
  {
- 	if (inode->i_flctx && mandatory_lock(inode))
- 		return locks_mandatory_area(
- 			FLOCK_VERIFY_WRITE, inode, filp,
- 			size < inode->i_size ? size : inode->i_size,
- 			(size < inode->i_size ? inode->i_size - size
- 			 : size - inode->i_size)
- 		);
- 	return 0;
+ 	if (!inode->i_flctx || !mandatory_lock(inode))
+ 		return 0;
+ 
+ 	if (size < inode->i_size) {
+ 		return locks_mandatory_area(filp, size, inode->i_size - 1,
+ 				F_WRLCK);
+ 	} else {
+ 		return locks_mandatory_area(filp, inode->i_size, size - 1,
+ 				F_WRLCK);
+ 	}
  }
  
 +#else /* !CONFIG_MANDATORY_FILE_LOCKING */
 +
 +static inline int locks_mandatory_locked(struct file *file)
 +{
 +	return 0;
 +}
 +
- static inline int locks_mandatory_area(int rw, struct inode *inode,
- 				       struct file *filp, loff_t offset,
- 				       size_t count)
++static inline int locks_mandatory_area(struct file *filp, loff_t start,
++		loff_t end, unsigned char type)
 +{
 +	return 0;
 +}
 +
 +static inline int __mandatory_lock(struct inode *inode)
 +{
 +	return 0;
 +}
 +
 +static inline int mandatory_lock(struct inode *inode)
 +{
 +	return 0;
 +}
 +
 +static inline int locks_verify_locked(struct file *file)
 +{
 +	return 0;
 +}
 +
 +static inline int locks_verify_truncate(struct inode *inode, struct file *filp,
 +					size_t size)
 +{
 +	return 0;
 +}
 +
 +#endif /* CONFIG_MANDATORY_FILE_LOCKING */
 +
 +
 +#ifdef CONFIG_FILE_LOCKING
  static inline int break_lease(struct inode *inode, unsigned int mode)
  {
  	/*
