From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] net: rfkill: Fix build for the CONFIG_RFKILL_LEDS=n case.
Date: Tue, 28 Apr 2009 23:39:42 +0900
Message-ID: <20090428143942.GA25813@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:35541 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755946AbZD1OpA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2009 10:45:00 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>, "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Commit ("rfkill: Fix broken rfkill LED in 2.6.30-rc1") sprinkles around
references to rfkill_led_trigger() in the common code, which is only defined
if CONFIG_RFKILL_LEDS is set:

  CC      net/rfkill/rfkill.o
net/rfkill/rfkill.c: In function 'update_rfkill_state':
net/rfkill/rfkill.c:99: error: implicit declaration of function 'rfkill_led_trigger'
make[1]: *** [net/rfkill/rfkill.o] Error 1
make: *** [net/rfkill/rfkill.o] Error 2

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: John W. Linville <linville@tuxdriver.com>
Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 net/rfkill/rfkill.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rfkill/rfkill.c b/net/rfkill/rfkill.c
index 53430a7..df96c0c 100644
--- a/net/rfkill/rfkill.c
+++ b/net/rfkill/rfkill.c
@@ -75,6 +75,11 @@ static void rfkill_led_trigger_activate(struct led_classdev *led)
 
 	rfkill_led_trigger(rfkill, rfkill->state);
 }
+#else
+static void rfkill_led_trigger(struct rfkill *rfkill,
+			       enum rfkill_state state)
+{
+}
 #endif /* CONFIG_RFKILL_LEDS */
 
 static void rfkill_uevent(struct rfkill *rfkill)
