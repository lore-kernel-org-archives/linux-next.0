From: Tejun Heo <tj@kernel.org>
Subject: [PATCH suspend-2.6#linux-next] PM / freezer: add missing include
Date: Thu, 08 Oct 2009 18:21:28 +0900
Message-ID: <4ACDAF18.2030705@kernel.org>
References: <20091008153051.37f043fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756470AbZJHJWg@vger.kernel.org>
In-Reply-To: <20091008153051.37f043fa.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Fix compile failure caused by a48145a7cbf3b0555ba3ad61aaf2c38719bab95d
forgetting to include delay.h.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/power/process.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/power/process.c b/kernel/power/process.c
index 66161f0..5ade1bd 100644
--- a/kernel/power/process.c
+++ b/kernel/power/process.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/syscalls.h>
 #include <linux/freezer.h>
+#include <linux/delay.h>
 
 /* 
  * Timeout for stopping processes
