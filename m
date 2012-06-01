From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] s390/signal: fix compile error
Date: Fri, 1 Jun 2012 09:17:05 +0200
Message-ID: <20120601071704.GA3535@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:35556 "EHLO
	e06smtp13.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753629Ab2FAHRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jun 2012 03:17:22 -0400
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 1 Jun 2012 08:17:19 +0100
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q517H5132228422
	for <linux-next@vger.kernel.org>; Fri, 1 Jun 2012 08:17:05 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q517H5mK023184
	for <linux-next@vger.kernel.org>; Fri, 1 Jun 2012 01:17:05 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org

Hi Al,

could you please add/merge the patch below which fixes a simple compile
error in linux-next caused by your signal work?

Thanks,
Heiko

>From 4a3f68ac251d9559b44d511e8b2e44098d59deb9 Mon Sep 17 00:00:00 2001
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Fri, 1 Jun 2012 09:09:28 +0200
Subject: [PATCH] s390/signal: fix compile error

Fix simple compile error caused by "pull clearing RESTORE_SIGMASK into
block_sigmask()" in linux-next.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/kernel/signal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
index 1c961e5..ac565b4 100644
--- a/arch/s390/kernel/signal.c
+++ b/arch/s390/kernel/signal.c
@@ -434,7 +434,7 @@ void do_signal(struct pt_regs *regs)
 		if (is_compat_task())
 			handle_signal32(signr, &ka, &info, oldset, regs);
 		else
-			handle_signal(signr, &ka, &info, oldset, regs));
+			handle_signal(signr, &ka, &info, oldset, regs);
 		return;
 	}
 
-- 
1.7.10.3
