From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Fri, 7 Aug 2015 14:15:41 +1000
Message-ID: <20150807141541.772edd2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34197 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751304AbbHGEPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2015 00:15:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>, Ameen Ali <ameenali023@gmail.com>

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  kernel/audit.c

between commit:

  5985de6754a6 ("audit: code clean up")

from Linus' tree and commit:

  84cb777e6781 ("audit: use macros for unset inode and device values")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/audit.c
index f9e6065346db,060153dc47d4..000000000000
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@@ -1761,7 -1759,7 +1761,7 @@@ void audit_log_name(struct audit_contex
  	} else
  		audit_log_format(ab, " name=(null)");
  
- 	if (n->ino != (unsigned long)-1)
 -	if (n->ino != AUDIT_INO_UNSET) {
++	if (n->ino != AUDIT_INO_UNSET)
  		audit_log_format(ab, " inode=%lu"
  				 " dev=%02x:%02x mode=%#ho"
  				 " ouid=%u ogid=%u rdev=%02x:%02x",
