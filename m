From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 22 Nov 2016 16:29:36 +1100
Message-ID: <20161122162936.674b7531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54915 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750942AbcKVF3j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 00:29:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  include/uapi/linux/audit.h

between commit:

  7ff89ac608d9 ("audit: add exclude filter extension to feature bitmap")

from Linus' tree and commit:

  0489410368df ("audit: add support for session ID user filter")

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
index 208df7b44e90,c8dc97bc2c1b..000000000000
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@@ -329,11 -330,11 +330,13 @@@ enum 
  #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
  #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
  #define AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH	0x00000004
 +#define AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND	0x00000008
+ #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
  #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
  				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
  				  AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH | \
- 				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND)
++				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
+ 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER)
  
  /* deprecated: AUDIT_VERSION_* */
  #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL
