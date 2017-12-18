From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Mon, 18 Dec 2017 14:28:26 +1100
Message-ID: <20171218142826.63e7a0c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

.config:4300:warning: symbol value '' invalid for SERIAL_SH_SCI_NR_UARTS
*
* Restart config...
*
*
* Serial drivers
*
8250/16550 and compatible serial support (SERIAL_8250) [M/y/?] m
	.
	.
	.
SuperH SCI(F) serial port support (SERIAL_SH_SCI) [M/n/y] m
  Maximum number of SCI(F) serial ports (SERIAL_SH_SCI_NR_UARTS) [] (NEW) aborted!

Console input/output is redirected. Run 'make oldconfig' to update configuration.


Caused by commit

  f6731485a519 ("tty: serial: sh-sci: Hide number of ports config question")

I have used the tty tree from next-20171215 for today.

-- 
Cheers,
Stephen Rothwell
