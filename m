From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the userns tree
Date: Fri, 26 Jan 2018 12:05:12 +1100
Message-ID: <20180126120512.1b431ac7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751382AbeAZBFU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 20:05:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Eric,

After merging the userns tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kernel/mce.c: In function 'machine_process_ue_event':
arch/powerpc/kernel/mce.c:276:5: error: too many arguments to function 'memory_failure'
     memory_failure(pfn, SIGBUS, 0);
     ^~~~~~~~~~~~~~
In file included from include/linux/pid_namespace.h:7:0,
                 from include/linux/ptrace.h:10,
                 from arch/powerpc/kernel/mce.c:27:
include/linux/mm.h:2571:12: note: declared here
 extern int memory_failure(unsigned long pfn, int flags);
            ^~~~~~~~~~~~~~

Caused by commit

  83b57531c58f ("mm/memory_failure: Remove unused trapno from memory_failure")

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Jan 2018 11:54:39 +1100
Subject: [PATCH] mm/memory_failure: update powerpc for memory_failure() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/mce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index d2fecaec4fec..efdd16a79075 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -273,7 +273,7 @@ static void machine_process_ue_event(struct work_struct *work)
 
 				pfn = evt->u.ue_error.physical_address >>
 					PAGE_SHIFT;
-				memory_failure(pfn, SIGBUS, 0);
+				memory_failure(pfn, 0);
 			} else
 				pr_warn("Failed to identify bad address from "
 					"where the uncorrectable error (UE) "
-- 
2.15.1

-- 
Cheers,
Stephen Rothwell
