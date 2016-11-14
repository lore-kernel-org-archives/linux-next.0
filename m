From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Mon, 14 Nov 2016 16:31:14 +1100
Message-ID: <20161114163114.76998008@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753890AbcKNFbQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 00:31:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpio/gpiolib-acpi.c: In function 'acpi_gpiochip_add':
drivers/gpio/gpiolib-acpi.c:925:9: warning: 'lflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
   ret = gpiod_hog(desc, name, lflags, dflags);
         ^
drivers/gpio/gpiolib-acpi.c:912:16: note: 'lflags' was declared here
   unsigned int lflags, dflags;
                ^
drivers/gpio/gpiolib-acpi.c:925:7: warning: 'dflags' may be used uninitialized in this function [-Wmaybe-uninitialized]
   ret = gpiod_hog(desc, name, lflags, dflags);
       ^
drivers/gpio/gpiolib-acpi.c:912:24: note: 'dflags' was declared here
   unsigned int lflags, dflags;
                        ^

These presumably have appeared since -Wmaybe-uninitialized has been
reenabled in Linus Torvald's tree.

-- 
Cheers,
Stephen Rothwell
