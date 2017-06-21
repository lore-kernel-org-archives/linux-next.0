From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the file-locks tree with the uuid tree
Date: Wed, 21 Jun 2017 10:10:24 +1000
Message-ID: <20170621101024.3e55b2be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55151 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752377AbdFUAK1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 20:10:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jeff,

Today's linux-next merge of the file-locks tree got a conflict in:

  include/linux/fs.h

between commit:

  85787090a21e ("fs: switch ->s_uuid to uuid_t")

from the uuid tree and commit:

  7356fd927059 ("fs: new infrastructure for writeback error handling and reporting")

from the file-locks tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 3e68cabb8457,df30536e2e57..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -30,8 -30,7 +30,8 @@@
  #include <linux/percpu-rwsem.h>
  #include <linux/workqueue.h>
  #include <linux/delayed_call.h>
 +#include <linux/uuid.h>
- 
+ #include <linux/errseq.h>
  #include <asm/byteorder.h>
  #include <uapi/linux/fs.h>
  
