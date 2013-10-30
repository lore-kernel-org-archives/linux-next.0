From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] Fix build without CONFIG_INPUT_LEDS [Was: mmotm
 2013-10-29-16-22 uploaded (input)]
Date: Wed, 30 Oct 2013 12:46:24 +0100
Message-ID: <20131030114624.GY5442@type.youpi.perso.aquilenet.fr>
References: <20131029232351.D2E6F31C173@corp2gmr1-1.hot.corp.google.com>
 <52706790.9090602@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52706790.9090602@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Randy Dunlap, le Tue 29 Oct 2013 18:57:36 -0700, a =E9crit :
> arc_ps2.c:(.text+0x500): multiple definition of `input_led_connect'

D'oh.  I indeed hadn't tested the inlines, sorry about this.

Andrew, could you add the following patch on top of
input-route-kbd-leds-through-the-generic-leds-layer.patch
or perhaps rather fold into it?

Samuel



Really mark inlines as static inlines, so they are not defined multiple
times.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

--- include/linux/input.h.orig	2013-10-30 12:42:41.169038670 +0100
+++ include/linux/input.h	2013-10-30 12:42:42.908987157 +0100
@@ -540,12 +540,12 @@
=20
 #else
=20
-int input_led_connect(struct input_dev *dev)
+static inline int input_led_connect(struct input_dev *dev)
 {
 	return 0;
 }
=20
-void input_led_disconnect(struct input_dev *dev)
+static inline void input_led_disconnect(struct input_dev *dev)
 {
 }
=20
