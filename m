From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the s390 tree
Date: Mon, 22 Aug 2011 12:37:05 +1000
Message-ID: <20110822123705.d947c6a2548082168df9c86a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40638 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751972Ab1HVChL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Aug 2011 22:37:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in
arch/s390/include/asm/thread_info.h between commit 5f67c275efe7 ("[S390]
fix _TIF_SINGLE_STEP definition") from the s390 tree and commit
c9ff4d7b50c4 ("freezer: remove now unused TIF_FREEZE") from the pm tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/include/asm/thread_info.h
index f9a9a10,589708a..0000000
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@@ -117,8 -116,7 +116,7 @@@ static inline struct thread_info *curre
  #define _TIF_SIE		(1<<TIF_SIE)
  #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
  #define _TIF_31BIT		(1<<TIF_31BIT)
 -#define _TIF_SINGLE_STEP	(1<<TIF_FREEZE)
 +#define _TIF_SINGLE_STEP	(1<<TIF_SINGLE_STEP)
- #define _TIF_FREEZE		(1<<TIF_FREEZE)
  
  #ifdef CONFIG_64BIT
  #define is_32bit_task()		(test_thread_flag(TIF_31BIT))
