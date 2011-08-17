From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: [PATCH] evm: add MAINTAINERS entry
Date: Wed, 17 Aug 2011 18:52:24 -0400
Message-ID: <1313621544-9239-1-git-send-email-zohar@linux.vnet.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:43769 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752974Ab1HQWwh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2011 18:52:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-security-module@vger.kernel.org
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>

Update the MAINTAINERS file with an entry for EVM.

Reported-by: Randy Dunlap <rdunlap@xenotimenet>
Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
---
 MAINTAINERS |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51d42fb..02a60b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,6 +2555,11 @@ S:	Maintained
 F:	Documentation/filesystems/ext4.txt
 F:	fs/ext4/
 
+Extended Verification Module (EVM)
+M:	Mimi Zohar <zohar@us.ibm.com>
+S:	Supported
+F:	security/integrity/evm/
+
 F71805F HARDWARE MONITORING DRIVER
 M:	Jean Delvare <khali@linux-fr.org>
 L:	lm-sensors@lm-sensors.org
-- 
1.7.3.4
