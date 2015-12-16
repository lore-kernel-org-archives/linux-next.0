From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Wed, 16 Dec 2015 15:48:13 +1100
Message-ID: <20151216154813.2566a655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47467 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751068AbbLPEsQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Dec 2015 23:48:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Wolfram,

After merging the i2c tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

drivers/i2c/busses/i2c-ibm_iic.c:102:15: error: redefinition of 'struct i2c_timings'
 static struct i2c_timings {
               ^
In file included from drivers/i2c/busses/i2c-ibm_iic.c:42:0:
include/linux/i2c.h:424:8: note: originally defined here
 struct i2c_timings {
        ^

Caused by commit

  e1dba01ca620 ("i2c: add generic routine to parse DT for timing information")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Dec 2015 15:34:10 +1100
Subject: [PATCH] ii2c: rename i2c_timings struct due to clash with generic version

Fixes: e1dba01ca620 ("i2c: add generic routine to parse DT for timing information")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index ab492301581a..51154fada1df 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -99,7 +99,7 @@ static void dump_iic_regs(const char* header, struct ibm_iic_private* dev)
 #endif
 
 /* Bus timings (in ns) for bit-banging */
-static struct i2c_timings {
+static struct ibm_i2c_timings {
 	unsigned int hd_sta;
 	unsigned int su_sto;
 	unsigned int low;
@@ -241,7 +241,7 @@ static int iic_dc_wait(volatile struct iic_regs __iomem *iic, u8 mask)
 static int iic_smbus_quick(struct ibm_iic_private* dev, const struct i2c_msg* p)
 {
 	volatile struct iic_regs __iomem *iic = dev->vaddr;
-	const struct i2c_timings* t = &timings[dev->fast_mode ? 1 : 0];
+	const struct ibm_i2c_timings* t = &timings[dev->fast_mode ? 1 : 0];
 	u8 mask, v, sda;
 	int i, res;
 
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
