From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: suspend  tree build failure
Date: Mon, 17 Aug 2009 18:40:48 +1000
Message-ID: <20090817184048.db6d94f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52112 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757330AbZHQIkv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 04:40:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[Sorry if some get this twice, I fixed up the subject.]

Hi Rafael,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/base/power/runtime.c:948: error: __ksymtab_pm_runtime_disable causes a section type conflict

Caused by commit d9d4cc5169ca18df9ff5afd31c6e6b715ecb454a ("PM: Introduce
core framework for run-time PM of I/O devices (rev. 17)") from the
suspend tree.  This commit EXPORTs pm_runtime_disable which is an inline
function that calls __pm_runtime_disable (which is probably what was
meant to be EXPORTed).

I wish we could get these type of errors to fail on x86 as well ...

I have applied the following patch for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Aug 2009 18:34:28 +1000
Subject: [PATCH] suspend: EXPORT the correct function.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/base/power/runtime.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 28a3f91..38556f6 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -945,7 +945,7 @@ void __pm_runtime_disable(struct device *dev, bool check_resume)
  out:
 	spin_unlock_irq(&dev->power.lock);
 }
-EXPORT_SYMBOL_GPL(pm_runtime_disable);
+EXPORT_SYMBOL_GPL(__pm_runtime_disable);
 
 /**
  * pm_runtime_enable - Enable run-time PM of a device.
-- 
1.6.3.3
