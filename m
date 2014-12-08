From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the bcm2835 tree with the arm-soc
 tree
Date: Mon, 8 Dec 2014 13:49:03 +0000
Message-ID: <20141208134903.GN3951@x1>
References: <20141208120619.68287b54@canb.auug.org.au>
 <2406890.FlzRjyvuXd@wuerfel>
 <20141208130009.GL3951@x1>
 <3348703.0b5FTH9Sa3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f170.google.com ([209.85.216.170]:58134 "EHLO
	mail-qc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755231AbaLHNtI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2014 08:49:08 -0500
Received: by mail-qc0-f170.google.com with SMTP id x3so3498468qcv.15
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2014 05:49:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <3348703.0b5FTH9Sa3@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Matthias Klein <matthias.klein@linux.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Mon, 08 Dec 2014, Arnd Bergmann wrote:

> On Monday 08 December 2014 13:00:09 Lee Jones wrote:
> > On Mon, 08 Dec 2014, Arnd Bergmann wrote:
> >=20
> > > On Monday 08 December 2014 12:06:19 Stephen Rothwell wrote:
> > > > Hi Stephen,
> > > >=20
> > > > Today's linux-next merge of the bcm2835 tree got a conflict in
> > > > arch/arm/boot/dts/Makefile between commit 302a5ef29d49 ("ARM: B=
CM5301X:
> > > > Add DT for Netgear R6300 V2") from the arm-soc tree and commit
> > > > 6298ed17a404 ("ARM: bcm2835: Add device tree for Raspberry Pi m=
odel
> > > > B+") from the bcm2835 tree.
> > > >=20
> > > > I fixed it up (the bcm2835 tree patch is also in the arm-soc tr=
ee as
> > > > commit ba2a1d6959ac ("ARM: bcm2835: Add device tree for Raspber=
ry Pi
> > > > model B+"), so I just used the arm-soc version) and can carry t=
he fix
> > > > as necessary (no action is required).
> > >=20
> > > Thanks a lot for the notification!
> > >=20
> > > Lee, do you know what is going on? Did you accidentally rebase a =
commit
> > > that you already sent for inclusion in arm-soc?
> >=20
> > Nope.  The branch hasn't changed at all.
> >=20
> > OOI why would a re-base affect anything?  I sent you it in patch fo=
rm.
>=20
> Ah, I looked at the wrong branch and didn't see that I applied a patc=
h
> instead of a pull request. It's all fine then, as long as you never
> intend to send any pull requests based on top of your current branch.
>=20
> You can possibly make Stephen's life a tiny bit simpler if you just
> drop all patches from your for-next branch as soon as we've picked
> them up into arm-soc.

That is something I thought about, but I believe we have users of that
branch.  I guess we could always point them to ARM-SoC, or reset the
branch to the aforementioned.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
