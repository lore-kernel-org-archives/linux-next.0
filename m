From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for November 23
Date: Tue, 23 Nov 2010 16:45:09 +0100
Message-ID: <AANLkTikdCr--wvKCEa8YxOaCb8JaS=3d1GHTxLMtmw4t@mail.gmail.com>
References: <20101123140609.2b6503ff.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:39381 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755164Ab0KWPpK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2010 10:45:10 -0500
In-Reply-To: <20101123140609.2b6503ff.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org

Slawa,

2010/11/23 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Changes since 20101122:

WARNING: modpost: Found 14 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
drivers/built-in.o: In function `timblogiw_close':
/home/test/linux-2.6/drivers/media/video/timblogiw.c:704: undefined
reference to `dma_release_channel'
drivers/built-in.o: In function `buffer_release':
/home/test/linux-2.6/drivers/media/video/timblogiw.c:595: undefined
reference to `dma_sync_wait'
drivers/built-in.o: In function `timblogiw_open':
/home/test/linux-2.6/drivers/media/video/timblogiw.c:671: undefined
reference to `__dma_request_channel'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2



--=20
Slawa!
N.P.S.

Chwa=B3a tobie, Szatanie, cze=B6=E6 na wysoko=B6ciach
Nieba, gdzie kr=F3lowa=B3e=B6, chwa=B3a w g=B3=EAboko=B6ciach
Piek=B3a, gdzie zwyci=EA=BFony, trwasz w dumnym milczeniu!
Uczy=F1, niechaj ma dusza spocznie z Tob=B1 w cieniu
Drzewa Wiedzy, gdy swoje konary rozwinie,
Jak sklepienie ko=B6cio=B3a, kt=F3ry nie przeminie!
