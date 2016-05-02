From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the mips tree
Date: Mon, 2 May 2016 15:52:01 +1000
Message-ID: <20160502155201.306e1cef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38271 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbcEBFwD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 01:52:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Pistirica <andrei.pistirica@microchip.com>, Joshua Henderson <joshua.henderson@microchip.com>, Vladimir Murzin <vladimir.murzin@arm.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/Makefile
  include/uapi/linux/serial_core.h

between commit:

  a484a06f7cb1 ("serial: pic32_uart: Add PIC32 UART driver")

from the mips tree and commit:

  041f031def33 ("serial: mps2-uart: add MPS2 UART driver")

from the tty tree.

I fixed it up (see below - I assume the numbers in
uapi/linux/serial_core.h are meant to be unique?) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/tty/serial/Makefile
index 74914aafac61,81e9057a0f68..000000000000
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@@ -91,7 -91,7 +91,8 @@@ obj-$(CONFIG_SERIAL_MEN_Z135)	+= men_z1
  obj-$(CONFIG_SERIAL_SPRD) += sprd_serial.o
  obj-$(CONFIG_SERIAL_STM32)	+= stm32-usart.o
  obj-$(CONFIG_SERIAL_MVEBU_UART)	+= mvebu-uart.o
+ obj-$(CONFIG_SERIAL_MPS2_UART)	+= mps2-uart.o
 +obj-$(CONFIG_SERIAL_PIC32)	+= pic32_uart.o
  
  # GPIOLIB helpers for modem control lines
  obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+= serial_mctrl_gpio.o
diff --cc include/uapi/linux/serial_core.h
index a539a638ec10,9aef04c5f7bc..000000000000
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@@ -264,7 -264,7 +264,10 @@@
  /* MVEBU UART */
  #define PORT_MVEBU	114
  
+ /* MPS2 UART */
+ #define PORT_MPS2UART	115
+ 
 +/* Microchip PIC32 UART */
- #define PORT_PIC32	114
++#define PORT_PIC32	116
 +
  #endif /* _UAPILINUX_SERIAL_CORE_H */
