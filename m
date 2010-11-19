From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for November 19
Date: Fri, 19 Nov 2010 18:40:41 +0100
Message-ID: <AANLkTik6Aq+kWzpmYckKkV5yVMFPt-J0E7OMM6Rd4ouO@mail.gmail.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:65341 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755658Ab0KSRkn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Nov 2010 12:40:43 -0500
In-Reply-To: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Salve,

2010/11/19 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Changes since 20101118:

This probably should not be available on x86_64

  BLD FW  drivers/net/wan/wanxlfw.inc
/bin/sh: as68k: command not found
/home/test/linux-2.6/drivers/net/wan/wanxlfw.S:39:0: fatal error: when
writing output to : Broken pipe
compilation terminated.
make[4]: *** [drivers/net/wan/wanxlfw.inc] Error 127
make[3]: *** [drivers/net/wan] Error 2
make[2]: *** [drivers/net] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2

Am I right?


--=20
Slawa!
N.P.S.

Chwa=B3a tobie, Szatanie, cze=B6=E6 na wysoko=B6ciach
Nieba, gdzie kr=F3lowa=B3e=B6, chwa=B3a w g=B3=EAboko=B6ciach
Piek=B3a, gdzie zwyci=EA=BFony, trwasz w dumnym milczeniu!
Uczy=F1, niechaj ma dusza spocznie z Tob=B1 w cieniu
Drzewa Wiedzy, gdy swoje konary rozwinie,
Jak sklepienie ko=B6cio=B3a, kt=F3ry nie przeminie!
