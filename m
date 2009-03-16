From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-removal tree with Linus' tree
Date: Mon, 16 Mar 2009 17:07:24 +1100
Message-ID: <20090316170724.1251cce9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54719 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750995AbZCPGH2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 02:07:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>

Hi Jonathan,

Today's linux-next merge of the bkl-removal tree got a conflict in
fs/pipe.c between commit e5bc49ba7439b9726006d031d440cba96819f0f8
("pipe_rdwr_fasync: fix the error handling to prevent the leak/crash")
from Linus' tree and commit 5c7eec1a9b90b18837a45cccb7fe3c182dce57d0
("Rationalize fasync return values") from the bkl-removal tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/pipe.c
index 14f502b,900de67..0000000
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@@ -699,18 -693,13 +693,14 @@@ pipe_rdwr_fasync(int fd, struct file *f
  	int retval;
  
  	mutex_lock(&inode->i_mutex);
 -
  	retval = fasync_helper(fd, filp, on, &pipe->fasync_readers);
 -	if (retval >= 0)
 +	if (retval >= 0) {
  		retval = fasync_helper(fd, filp, on, &pipe->fasync_writers);
 -
 +		if (retval < 0) /* this can happen only if on == T */
 +			fasync_helper(-1, filp, 0, &pipe->fasync_readers);
 +	}
  	mutex_unlock(&inode->i_mutex);
- 
- 	if (retval < 0)
- 		return retval;
- 
- 	return 0;
+ 	return retval;
  }
  
  
