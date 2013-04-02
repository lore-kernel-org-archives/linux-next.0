From: Casey Schaufler <casey@schaufler-ca.com>
Subject: [PATCH] Smack: include magic.h in smackfs.c
Date: Tue, 02 Apr 2013 11:41:18 -0700
Message-ID: <515B264E.2020603@schaufler-ca.com>
References: <20130402190929.62cea8988921a2599588a566@canb.auug.org.au> <515B12EB.50303@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nm14-vm0.access.bullet.mail.sp2.yahoo.com ([98.139.44.162]:25195
	"EHLO nm14-vm0.access.bullet.mail.sp2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760667Ab3DBSlN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Apr 2013 14:41:13 -0400
In-Reply-To: <515B12EB.50303@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module <linux-security-module@vger.kernel.org>, Casey Schaufler <casey@schaufler-ca.com>

As reported for linux-next: Tree for Apr 2 (smack)
Add the required include for smackfs.c

Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/smack/smackfs.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 2479a41..53a08b8 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -26,6 +26,7 @@
 #include <linux/seq_file.h>
 #include <linux/ctype.h>
 #include <linux/audit.h>
+#include <linux/magic.h>
 #include "smack.h"
 
 /*
