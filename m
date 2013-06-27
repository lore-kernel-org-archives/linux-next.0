From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Subject: [PATCH linux-next] videomode: fix compilation warning
Date: Thu, 27 Jun 2013 14:34:57 +0200
Message-ID: <1372336497-2005-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]:24793
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751819Ab3F0MfQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Jun 2013 08:35:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, trivial@kernel.org

Add missing include file to fix the following compilation warning:

  In file included from drivers/video/wm8505fb.c:35:0:
  include/video/of_display_timing.h:18:10: warning: =E2=80=98struct dis=
play_timing=E2=80=99 declared inside parameter list [enabled by default=
]
  include/video/of_display_timing.h:18:10: warning: its scope is only t=
his definition or declaration, which is probably not what you want [ena=
bled by default]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: trivial@kernel.org
---


Hi,

This warning happens on linux-next tag next-20130627, for ARM multi_v7_=
defconfig.

Best regards,

V.


 include/video/of_display_timing.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/video/of_display_timing.h b/include/video/of_displ=
ay_timing.h
index 6562ad9..d43be98 100644
--- a/include/video/of_display_timing.h
+++ b/include/video/of_display_timing.h
@@ -9,6 +9,8 @@
 #ifndef __LINUX_OF_DISPLAY_TIMING_H
 #define __LINUX_OF_DISPLAY_TIMING_H
=20
+#include <video/display_timing.h>
+
 struct device_node;
 struct display_timings;
=20
--=20
1.7.10.4
