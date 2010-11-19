From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for November 19
Date: Fri, 19 Nov 2010 19:35:05 +0100
Message-ID: <AANLkTimC51Rb+7eMGYoJ9biGS1Tp1wPC-Ujg55fkOvHR@mail.gmail.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
	<AANLkTik6Aq+kWzpmYckKkV5yVMFPt-J0E7OMM6Rd4ouO@mail.gmail.com>
	<20101119174257.58bb8e32@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:61885 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755247Ab0KSSfH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Nov 2010 13:35:07 -0500
In-Reply-To: <20101119174257.58bb8e32@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2010/11/19 Alan Cox <alan@lxorguk.ukuu.org.uk>:
> On Fri, 19 Nov 2010 18:40:41 +0100
> Zimny Lech <napohybelskurwysynom2010@gmail.com> wrote:
>
>> Salve,
>>
>> 2010/11/19 Stephen Rothwell <sfr@canb.auug.org.au>:
>> > Hi all,
>> >
>> > Changes since 20101118:
>>
>> This probably should not be available on x86_64
>>
>> =A0 BLD FW =A0drivers/net/wan/wanxlfw.inc
>> /bin/sh: as68k: command not found
>> /home/test/linux-2.6/drivers/net/wan/wanxlfw.S:39:0: fatal error: wh=
en
>> writing output to : Broken pipe
>> compilation terminated.
>> make[4]: *** [drivers/net/wan/wanxlfw.inc] Error 127
>
> If you want to build the wanxl firmware then you need the m68k assemb=
ler
> for the firmware, so it is right.
>

Ok, thanks for the info.

I'll try to find souces for this asm and install it to avoid future
failed builds.

--=20
Slawa!
N.P.S.

Chwa=B3a tobie, Szatanie, cze=B6=E6 na wysoko=B6ciach
Nieba, gdzie kr=F3lowa=B3e=B6, chwa=B3a w g=B3=EAboko=B6ciach
Piek=B3a, gdzie zwyci=EA=BFony, trwasz w dumnym milczeniu!
Uczy=F1, niechaj ma dusza spocznie z Tob=B1 w cieniu
Drzewa Wiedzy, gdy swoje konary rozwinie,
Jak sklepienie ko=B6cio=B3a, kt=F3ry nie przeminie!
