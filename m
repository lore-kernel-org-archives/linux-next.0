From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the vfs tree
Date: Tue, 10 Aug 2010 12:19:00 +1000
Message-ID: <20100810121900.cbceb878.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43087 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753505Ab0HJCTD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Aug 2010 22:19:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Boaz Harrosh <bharrosh@panasas.com>, Al Viro <viro@ZenIV.linux.org.uk>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
fs/exofs/inode.c between commit 21883a7d05d4c1e97943fa1a587aa2c2a3b09e8c
("exofs: New truncate sequence") from the vfs tree and commit
426d31071ac476ea62c62656b242930c17b58c00 ("fix printk typo 'faild'") from
the trivial tree.

Just context changes.  I fixed it up (see below) and can carry it for a
while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/exofs/inode.c
index eb7368e,5862ae8..0000000
--- a/fs/exofs/inode.c
+++ b/fs/exofs/inode.c
@@@ -713,8 -709,8 +713,8 @@@ int exofs_write_begin(struct file *file
  		ret = simple_write_begin(file, mapping, pos, len, flags, pagep,
  					 fsdata);
  		if (ret) {
- 			EXOFS_DBGMSG("simple_write_begin faild\n");
+ 			EXOFS_DBGMSG("simple_write_begin failed\n");
 -			return ret;
 +			goto out;
  		}
  
  		page = *pagep;
@@@ -726,12 -722,9 +726,12 @@@
  		if (ret) {
  			/*SetPageError was done by _readpage. Is it ok?*/
  			unlock_page(page);
- 			EXOFS_DBGMSG("__readpage_filler faild\n");
+ 			EXOFS_DBGMSG("__readpage_filler failed\n");
  		}
  	}
 +out:
 +	if (unlikely(ret))
 +		_write_failed(mapping->host, pos + len);
  
  	return ret;
  }
