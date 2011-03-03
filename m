From: Linus Walleij <linus.walleij@linaro.org>
Subject: Build problems in kisskb ARM configs
Date: Thu, 3 Mar 2011 15:09:08 +0100
Message-ID: <AANLkTi=Vwx4-uW26S31JBzypRsjLe_q+sDjnf3RouVW+@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:37647 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758333Ab1CCOJI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2011 09:09:08 -0500
Received: by pwi15 with SMTP id 15so207366pwi.19
        for <linux-next@vger.kernel.org>; Thu, 03 Mar 2011 06:09:08 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

When I inspect the last few days of kernel builds over here:
http://kisskb.ellerman.id.au/kisskb/branch/9/

I find that many ARM archs fail compilation at the final linking
stage like this:

  LD      arch/arm/boot/compressed/vmlinux
/opt/crosstool/gcc-4.4.0-nolibc/arm-linux/bin/arm-linux-ld:--defsym
_image_size=: syntax error
make[3]: *** [arch/arm/boot/compressed/vmlinux] Error 1
make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 2
make[1]: *** [zImage] Error 2
make: *** [sub-make] Error 2

Is this some known problem? Is it the ARM linker script
that needs fixing or what may be causing this?

Yours,
Linus Walleij
