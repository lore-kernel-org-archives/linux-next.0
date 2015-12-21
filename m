From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20151221 build: 2 failures 13 warnings (next-20151221)
Date: Mon, 21 Dec 2015 15:05:33 +0100
Message-ID: <201512211505.34074.arnd@arndb.de>
References: <E1aAyjj-0007DR-4T@optimist>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:62572 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbbLUOGS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 09:06:18 -0500
In-Reply-To: <E1aAyjj-0007DR-4T@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Just looking at the remaining warnings/errors in linux-next:

On Monday 21 December 2015, Build bot for Mark Brown wrote:
> ../fs/orangefs/orangefs-kernel.h:773:2: error: implicit declaration of function 'ornagefs_inode_lock' [-Werror=implicit-function-declaration]
> ../fs/orangefs/orangefs-kernel.h:773:2: error: implicit declaration of function 'ornagefs_inode_lock' [-Werror=implicit-function-declaration]
> ../fs/orangefs/orangefs-kernel.h:773:2: error: implicit declaration of function 'ornagefs_inode_lock' [-Werror=implicit-function-declaration]
> ../fs/orangefs/orangefs-kernel.h:773:2: error: implicit declaration of function 'ornagefs_inode_lock' [-Werror=implicit-function-declaration]

I just sent a patch for this.

> arm64-allmodconfig : PASS, 0 errors, 5 warnings, 0 section mismatches
> 
> Warnings:
>         ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]

I have a trivial patch, need to send it out.

>         ../drivers/staging/emxx_udc/emxx_udc.c:843:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>         ../drivers/staging/emxx_udc/emxx_udc.c:1085:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>         ../drivers/staging/emxx_udc/emxx_udc.c:2731:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Submitted this one again last week, I had sent it a month ago, but the maintainer was busy.

>         ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

rmk pointed out the problem when the patch was sent originally, no idea what we should do
about it other than reverting the patch that introduced the unused code.

> Warnings:
>         <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

Not sure how we can improve this, the same thing seems to happen every time a new syscall gets
introduced. The actual change is trivial, but we need a better method to sync all architectures.

>         ../kernel/printk/nmi.c:143:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]

Sent a patch the other day.

>         ../drivers/gpio/gpiolib.c:225:31: warning: 'iterator' may be used uninitialized in this function [-Wmaybe-uninitialized]

Introduced by Bamvor, currently discussing a solution with him and Linus. We can either shut up
the compiler or rewrite the function in a nicer way.

> arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches
> 
> Warnings:
>         arch/arm/configs/multi_v7_defconfig:433:warning: symbol value 'm' invalid for MFD_DA9063

I need to look into this, probably the result of a defconfig change we merged, but it's not
clear whether the driver should be a module, or the defconfig should have it built-in.

>         ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
>         ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]

I don't see these with gcc-5.1

>         ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]

no this one. If we want to fix it, it's probably best to change the
optimization level of the file, something gets misoptimzed here and it's
clear it should not use that much stack.

	Arnd
