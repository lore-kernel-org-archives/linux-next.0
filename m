From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for December 2
Date: Thu, 2 Dec 2010 14:52:56 +0100
Message-ID: <AANLkTi=aZ3Gm5rkqAh8j-bOvvKULge6Hm5cN_mEovVdq@mail.gmail.com>
References: <20101202140943.c9742beb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:62211 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757552Ab0LBNw5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2010 08:52:57 -0500
In-Reply-To: <20101202140943.c9742beb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>

Ave

2010/12/2 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Changes since 20101201:
>

WARNING: modpost: Found 4 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
drivers/built-in.o: In function `pch_request_dma':
/home/test/linux-2.6/drivers/serial/pch_uart.c:565: undefined
reference to `__dma_request_channel'
/home/test/linux-2.6/drivers/serial/pch_uart.c:577: undefined
reference to `__dma_request_channel'
/home/test/linux-2.6/drivers/serial/pch_uart.c:580: undefined
reference to `dma_release_channel'
drivers/built-in.o: In function `pch_free_dma':
/home/test/linux-2.6/drivers/serial/pch_uart.c:519: undefined
reference to `dma_release_channel'
/home/test/linux-2.6/drivers/serial/pch_uart.c:523: undefined
reference to `dma_release_channel'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2


-- 
Slawa!
Zimny "Spie dziadu!" Lech z Wawelu

That is not dead which can eternal lie.
And with strange aeons even death may die.
