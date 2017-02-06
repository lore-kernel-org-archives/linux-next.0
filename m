From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty tree
Date: Mon, 6 Feb 2017 15:16:38 +1100
Message-ID: <20170206151638.6e0f8a60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the tty tree, today's linux-next build
(arm_multi_v7_defconfig) produced this warning:

drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
 static int scif_set_rtrg(struct uart_port *port, int rx_trig)
            ^

Introduced by commit

  a380ed461f66 ("serial: sh-sci: implement FIFO threshold register setting")

Forgot to add a call to this new function?

-- 
Cheers,
Stephen Rothwell
