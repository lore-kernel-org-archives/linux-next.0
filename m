From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the moduleh tree with the pm tree
Date: Thu, 11 Aug 2011 15:02:52 +1000
Message-ID: <20110811150252.54c4abf3598edef9bab14bb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751845Ab1HKFC7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Aug 2011 01:02:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ShuoX Liu <shuox.liu@intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Paul,

Today's linux-next merge of the moduleh tree got a conflict in
kernel/power/main.c between commit b57b760a97cf ("PM / Suspend: Add
statistics debugfs file for suspend to RAM") from the pm tree and commit
6320ae56afdf ("kernel: Fix files explicitly needing EXPORT_SYMBOL
infrastructure") from the moduleh tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/power/main.c
index 2757acb,a811007..0000000
--- a/kernel/power/main.c
+++ b/kernel/power/main.c
@@@ -12,8 -12,7 +12,9 @@@
  #include <linux/string.h>
  #include <linux/resume-trace.h>
  #include <linux/workqueue.h>
 +#include <linux/debugfs.h>
 +#include <linux/seq_file.h>
+ #include <linux/export.h>
  
  #include "power.h"
  
