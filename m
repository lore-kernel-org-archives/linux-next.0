From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Bad ux500 merge fix leads to linux-next failure
Date: Tue, 22 May 2012 20:03:46 -0400
Message-ID: <20120523000346.GB3610@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:52398 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757749Ab2EWAD7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 May 2012 20:03:59 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Hi Olof,

This change:

-                                  id.o usb.o timer.o
+                                  id.o pins.o usb.o timer.o

breaks the u8500_defconfig as follows:

make[2]: *** No rule to make target `arch/arm/mach-ux500/pins.o', needed
by `arch/arm/mach-ux500/built-in.o'.  Stop.
make[1]: *** [arch/arm/mach-ux500/] Error 2
make: *** [sub-make] Error 2

A bisect shows the following:
  
cda6f4d8cae969e08e6662573b538db73191873b is the first bad commit
commit cda6f4d8cae969e08e6662573b538db73191873b
Author: Olof Johansson <olof@lixom.net>
Date:   Wed May 16 14:47:24 2012 -0700

    ARM: ux500: fix mismerge in for-next

    Signed-off-by: Olof Johansson <olof@lixom.net>

:040000 040000 abc42227f7daa6a7ff6153e0908add25ffb38a54
45d2618822e6075aea188089191791091c2e5c38 M      arch
bisect run success

The linux-next fail is here:
	http://kisskb.ellerman.id.au/kisskb/buildresult/6348609/

Can you have a look please?

Thanks,
Paul.
