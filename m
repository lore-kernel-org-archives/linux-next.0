From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
Date: Tue, 24 May 2011 08:53:51 +0300
Message-ID: <1306216431.2785.46.camel@localhost>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	 <20110523113709.4357b4ba.randy.dunlap@oracle.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:49851 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763Ab1EXF6L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2011 01:58:11 -0400
In-Reply-To: <20110523113709.4357b4ba.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>

On Mon, 2011-05-23 at 11:37 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>=20
> Fix build warnings in physmap.h:
>=20
> include/linux/mtd/physmap.h:25: warning: 'struct platform_device' dec=
lared inside parameter list
> include/linux/mtd/physmap.h:25: warning: its scope is only this defin=
ition or declaration, which is probably not what you want
> include/linux/mtd/physmap.h:26: warning: 'struct platform_device' dec=
lared inside parameter list
> include/linux/mtd/physmap.h:27: warning: 'struct platform_device' dec=
lared inside parameter list
>=20
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Oh, this was missed during review.  This was introduced in
b7281ca2a4b00044c60c25059f467d05772cdbe3 which is going in via Russel's
tree, so I guess Russel could pick up your patch.

CCed relevant people.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
