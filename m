From: Jonathan Bowie <eudjtb@gmail.com>
Subject: [PATCH v3] staging: greybus: loop_backtest: fixed consistent spacing
 style issue
Date: Wed, 1 Mar 2017 02:09:43 -0800
Message-ID: <20170301100943.GA9503@mod.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33885 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751755AbdCAKLb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Mar 2017 05:11:31 -0500
Received: by mail-pf0-f195.google.com with SMTP id x66so3174354pfb.1
        for <linux-next@vger.kernel.org>; Wed, 01 Mar 2017 02:10:00 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-next@vger.kernel.org

Fixed incosistent spacing around arithmetic operator.

Signed-off-by: Jonathan Bowie <eudjtb@gmail.com>
---
 drivers/staging/greybus/tools/loopback_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 18d7a3d..d5bb8d2 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -476,7 +476,7 @@ int format_output(struct loopback_test *t,
 			r->gbphy_firmware_latency_jitter);
 
 	} else {
-		len += snprintf(&buf[len], buf_len- len, ",%s,%s,%u,%u,%u",
+		len += snprintf(&buf[len], buf_len - len, ",%s,%s,%u,%u,%u",
 			t->test_name, dev_name, t->size, t->iteration_max,
 			r->error);
 
-- 
2.7.4

v2 
 -tried to fix summary and commit message
v3
 -actually fixed summary and commit message
 -CCed staging mailing list
