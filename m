From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Thu, 19 Jan 2017 13:51:30 +1100
Message-ID: <20170119135130.739d4f7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751656AbdASCvd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Jan 2017 21:51:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  include/uapi/linux/audit.h

between commits:

  7ff89ac608d9 ("audit: add exclude filter extension to feature bitmap")
  dcdaa2f9480c ("Merge branch 'stable-4.10' of git://git.infradead.org/users/pcmoore/audit")

from Linus' tree and commit:

  92c82e8a322b ("audit: add feature audit_lost reset")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/audit.h
index 1c107cb1c83f,3f24110ae63c..000000000000
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@@ -330,13 -331,14 +331,16 @@@ enum 
  #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
  #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
  #define AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH	0x00000004
 +#define AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND	0x00000008
  #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
+ #define AUDIT_FEATURE_BITMAP_LOST_RESET		0x00000020
+ 
  #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
  				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
  				  AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH | \
 +				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
- 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER)
+ 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
+ 				  AUDIT_FEATURE_BITMAP_LOST_RESET)
  
  /* deprecated: AUDIT_VERSION_* */
  #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL
