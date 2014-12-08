From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the bcm2835 tree with the arm-soc
 tree
Date: Mon, 8 Dec 2014 13:00:09 +0000
Message-ID: <20141208130009.GL3951@x1>
References: <20141208120619.68287b54@canb.auug.org.au>
 <2406890.FlzRjyvuXd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:56131 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051AbaLHNAP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2014 08:00:15 -0500
Received: by mail-qg0-f46.google.com with SMTP id z107so3367023qgd.19
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2014 05:00:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <2406890.FlzRjyvuXd@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Matthias Klein <matthias.klein@linux.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Mon, 08 Dec 2014, Arnd Bergmann wrote:

> On Monday 08 December 2014 12:06:19 Stephen Rothwell wrote:
> > Hi Stephen,
> >=20
> > Today's linux-next merge of the bcm2835 tree got a conflict in
> > arch/arm/boot/dts/Makefile between commit 302a5ef29d49 ("ARM: BCM53=
01X:
> > Add DT for Netgear R6300 V2") from the arm-soc tree and commit
> > 6298ed17a404 ("ARM: bcm2835: Add device tree for Raspberry Pi model
> > B+") from the bcm2835 tree.
> >=20
> > I fixed it up (the bcm2835 tree patch is also in the arm-soc tree a=
s
> > commit ba2a1d6959ac ("ARM: bcm2835: Add device tree for Raspberry P=
i
> > model B+"), so I just used the arm-soc version) and can carry the f=
ix
> > as necessary (no action is required).
>=20
> Thanks a lot for the notification!
>=20
> Lee, do you know what is going on? Did you accidentally rebase a comm=
it
> that you already sent for inclusion in arm-soc?

Nope.  The branch hasn't changed at all.

OOI why would a re-base affect anything?  I sent you it in patch form.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
