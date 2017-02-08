From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Wed, 8 Feb 2017 09:24:25 +0000
Message-ID: <20170208092425.azqkx3nwf4jhsfz5@dell>
References: <20170208161113.1b597c01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170208161113.1b597c01@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

The commits mentioned below adapt the GPIO API to allow more information
to be passed directly through devm_get_gpiod_from_child() in the first
instance.  This facilitates the removal of subsequent calls, such as
gpiod_direction_output().  This patch firstly moves to utilise the new
API and secondly removes the now superfluous call do set the direction.

Fixes: a264d10ff45c ("gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO")
Fixes: b2987d7438e0 ("gpio: Pass GPIO label down to gpiod_request")
Fixes: 4b0947974e59 ("gpio: Rename devm_get_gpiod_from_child()")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/st-asc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
index bcf1d33..c334bcc 100644
--- a/drivers/tty/serial/st-asc.c
+++ b/drivers/tty/serial/st-asc.c
@@ -575,12 +575,13 @@ static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
 			pinctrl_select_state(ascport->pinctrl,
 					     ascport->states[NO_HW_FLOWCTRL]);
 
-			gpiod =	devm_get_gpiod_from_child(port->dev, "rts",
-							  &np->fwnode);
-			if (!IS_ERR(gpiod)) {
-				gpiod_direction_output(gpiod, 0);
+			gpiod = devm_fwnode_get_gpiod_from_child(port->dev,
+								 "rts",
+								 &np->fwnode,
+								 GPIOD_OUT_LOW,
+								 np->name);
+			if (!IS_ERR(gpiod))
 				ascport->rts = gpiod;
-			}
 		}
 	}
 
-- 
2.9.3
