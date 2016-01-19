From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 19 Jan 2016 12:02:12 +1100
Message-ID: <20160119120212.2a8872a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54827 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932528AbcASBCO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2016 20:02:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  kernel/audit.c

between commit:

  f48a942926c5 ("audit: include auditd's threads in audit_log_start() wait exception")

from Linus' tree and commit:

  14eeba1d242e ("audit: include auditd's threads in audit_log_start() wait exception")

from the audit tree.

This happened because the audit tree was rebased before being sent
to Linus and this patch was "tweaked".  I just used the version from
Linus' tree.  Please clean up the audit tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
