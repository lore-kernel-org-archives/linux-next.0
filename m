From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH] serial: imx: Fix build breakage
Date: Thu, 10 Jul 2014 22:36:46 -0400
Message-ID: <1405046206-14495-1-git-send-email-peter@hurleysoftware.com>
References: <20140711112108.7631911b@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140711112108.7631911b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>
List-Id: linux-next.vger.kernel.org

Fix breakage introduced by
commit c557d392fbf5badd693ea1946a4317c87a26a716,
'serial: Test for no tx data on tx restart'.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/tty/serial/imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 23c1dae..be1c842 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -563,7 +563,7 @@ static void imx_start_tx(struct uart_port *port)
 	struct imx_port *sport = (struct imx_port *)port;
 	unsigned long temp;
 
-	if (uart_circ_empty(&port.state->xmit))
+	if (uart_circ_empty(&port->state->xmit))
 		return;
 
 	if (USE_IRDA(sport)) {
-- 
2.0.0
