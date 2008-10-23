From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Thu, 23 Oct 2008 20:18:55 +1100
Message-ID: <20081023201855.faf8bec5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33267 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753970AbYJWJwS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 05:52:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next build (powerpc allnoconfig) failed like this:

In file included from include/linux/sched.h:58,
                 from arch/powerpc/kernel/asm-offsets.c:17:
include/linux/cpumask.h:110: error: 'CONFIG_NR_CPUS' undeclared here (not in a function)

Caused by commit d08dde18aebb15633e5c4480814b77d93a4d68f6 ("cpumask:CONFIG_NR_CPUS-always") from the rr tree.  I applied the following patch.

There are several other architectures that don't appear to have been
updated for this change - how confident ae you that none of them have
been broken as powerpc was?
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Oct 2008 20:14:18 +1100
Subject: [PATCH] powerpc: fallout from cpumask CONFIG_NR_CPUS changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/Kconfig.cputype |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 548efa5..e8fd928 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -242,9 +242,9 @@ config SMP
 	  If you don't know what to do here, say N.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-1024)"
-	range 2 1024
-	depends on SMP
+	int "Maximum number of CPUs (2-1024)" if SMP
+	range 2 1024 if SMP
+	default "1" if !SMP
 	default "32" if PPC64
 	default "4"
 
-- 
1.5.6.5
