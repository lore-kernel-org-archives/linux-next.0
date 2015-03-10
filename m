From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] fixup! serial: imx: add support for half duplex rs485
Date: Tue, 10 Mar 2015 09:31:09 +0100
Message-ID: <1425976269-27169-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20150310162816.3301cff5@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150310162816.3301cff5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

---
 drivers/tty/serial/imx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index ddfb672d0152..e9102eba49c4 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1298,7 +1298,7 @@ imx_set_termios(struct uart_port *port, struct ktermios *termios,
 		if (sport->have_rtscts) {
 			ucr2 &= ~UCR2_IRTS;
 
-			if (port->rs485.flags & SER_RS485_ENABLED)
+			if (port->rs485.flags & SER_RS485_ENABLED) {
 				/*
 				 * RTS is mandatory for rs485 operation, so keep
 				 * it under manual control and keep transmitter
@@ -1307,8 +1307,9 @@ imx_set_termios(struct uart_port *port, struct ktermios *termios,
 				if (!(port->rs485.flags &
 				      SER_RS485_RTS_AFTER_SEND))
 					ucr2 |= UCR2_CTS;
-			else
+			} else {
 				ucr2 |= UCR2_CTSC;
+			}
 
 		} else {
 			termios->c_cflag &= ~CRTSCTS;
-- 
2.1.4
