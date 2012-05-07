From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (battery
 tree related)
Date: Mon, 7 May 2012 11:26:37 +0300
Message-ID: <20120507082637.GH31494@intel.com>
References: <20120507171458.5ce17d20c40856e9440b3e5f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40452 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755447Ab2EGIZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 May 2012 04:25:21 -0400
Content-Disposition: inline
In-Reply-To: <20120507171458.5ce17d20c40856e9440b3e5f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 07, 2012 at 05:14:58PM +1000, Stephen Rothwell wrote:
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/power/smb347-charger.c: In function 'smb347_probe':
> drivers/power/smb347-charger.c:1039:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
> drivers/power/smb347-charger.c:1040:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
> 
> Caused by commit 34298d40e585 ("smb347-charger: Convert to regmap API").

I'm unable to reproduce this on x86 build. I guess <linux/err.h> gets
included implicitly there.

Patch below should fix this. Anton, care to pick this one as well (or fold
it into the 34298d40e585 ("smb347-charger: Convert to regmap API") commit)?

From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] smb347-charger: include missing <linux/err.h>

Without the include we get build errors like:

drivers/power/smb347-charger.c: In function 'smb347_probe':
drivers/power/smb347-charger.c:1039:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
drivers/power/smb347-charger.c:1040:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/power/smb347-charger.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/power/smb347-charger.c b/drivers/power/smb347-charger.c
index 09d19d2..f8eedd8 100644
--- a/drivers/power/smb347-charger.c
+++ b/drivers/power/smb347-charger.c
@@ -11,6 +11,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/err.h>
 #include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
1.7.9.1
