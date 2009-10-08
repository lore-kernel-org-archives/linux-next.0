From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: linux-next: mfd tree build failure
Date: Thu, 8 Oct 2009 01:59:12 -0400
Message-ID: <771cded00910072259m5aeaf900w376deb99b7f2b081@mail.gmail.com>
References: <20091006130202.5e18a332.sfr@canb.auug.org.au>
	 <25B60CDC2F704E4E9D88FFD52780CB4C04B6A3794F@SC-VEXCH1.marvell.com>
	 <20091006145425.a9cc611a.sfr@canb.auug.org.au>
	 <25B60CDC2F704E4E9D88FFD52780CB4C04B6A37960@SC-VEXCH1.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753893AbZJHF7v@vger.kernel.org>
In-Reply-To: <25B60CDC2F704E4E9D88FFD52780CB4C04B6A37960@SC-VEXCH1.marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: Samuel Ortiz <sameo@openedhand.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 2009=C4=EA10=D4=C26=C8=D5 11:54 AM
> To: Haojian Zhuang
> Cc: Samuel Ortiz; linux-next@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Mark Brown
> Subject: Re: linux-next: mfd tree build failure
>
> Hi Haojian,
>
> On Mon, 5 Oct 2009 19:35:05 -0700 Haojian Zhuang <hzhuang1@marvell.co=
m> wrote:
>>
>> Could you send your .config file to me? The 88pm8607 patch is just f=
or mfd-2.6 git tree. I didn't try it in linux-next git tree before. I c=
an try it now. If I could have your .config file, it would be better.
>
> I am sorry, but I don't have the exact .config file any more (I have
> moved on in my creation of linux-next)  however, as I said, this was =
an
> allmodconfig build on x86_64.  I also noted that CONFIG_I2C=3Dm and
> CONFIG_MFD_CORE=3Dm, while the config entry that controls the buildin=
g of
> this driver is a bool so must have been 'y'.  So from a builtin drive=
r,
> you are referring to symbols that are only defined in modules.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>

Hi Stephen & Samuel,

Please ignore the original fix patch on 88pm8607 dependancy. I write a
new patch on it and paste it in below. Please help to review it.

Thanks
Haojian

=46rom 26174b67184759ac2fe33748eeb43d3738732e21 Mon Sep 17 00:00:00 200=
1
=46rom: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Thu, 8 Oct 2009 09:07:05 -0400
Subject: [PATCH] mfd: fix the dependancy of 88PM8607

88PM8607 module is dependant on I2C. I2C module must be built-in.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mfd/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index fbe684b..00064e2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -307,7 +307,7 @@ config EZX_PCAP

 config MFD_88PM8607
        bool "Support Marvell 88PM8607"
-       depends on I2C
+       depends on I2C=3Dy
        select MFD_CORE
        help
          This supports for Marvell 88PM8607 Power Management IC. This =
includes
--
1.5.6.5
