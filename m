From: nick.dyer@itdev.co.uk
Subject: [PATCH] Input: atmel_mxt_ts - fix build error in mxt_read_t9_resolution
Date: Tue, 20 May 2014 10:54:57 +0100
Message-ID: <1400579697-23217-1-git-send-email-nick.dyer@itdev.co.uk>
References: <20140520174513.26247582@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140520174513.26247582@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, dmitry.torokhov@gmail.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Dyer <nick.dyer@itdev.co.uk>
List-Id: linux-next.vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Stephen Rothwell reports this build error:

drivers/input/touchscreen/atmel_mxt_ts.c: In function 'mxt_read_t9_resolution':
drivers/input/touchscreen/atmel_mxt_ts.c:1043:2: warning: passing argument 1 of '__swab16s' makes pointer from integer without a cast [enabled by default]
  le16_to_cpus(range.x);
  ^

I believe this is a correct fix.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index d8ea3ed..97495c7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1040,8 +1040,8 @@ static int mxt_read_t9_resolution(struct mxt_data *data)
 	if (error)
 		return error;
 
-	le16_to_cpus(range.x);
-	le16_to_cpus(range.y);
+	le16_to_cpus(&range.x);
+	le16_to_cpus(&range.y);
 
 	error =  __mxt_read_reg(client,
 				object->start_address + MXT_T9_ORIENT,
-- 
1.8.3.2
