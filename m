From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
Date: Wed, 01 Jun 2011 10:45:54 +0300
Message-ID: <1306914354.4405.49.camel@localhost>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	 <20110523113709.4357b4ba.randy.dunlap@oracle.com>
	 <1306216431.2785.46.camel@localhost> <1306216683.2785.47.camel@localhost>
	 <20110524074020.GA9490@flint.arm.linux.org.uk>
	 <1306222943.2785.55.camel@localhost>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:34393 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755488Ab1FAHuV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2011 03:50:21 -0400
In-Reply-To: <1306222943.2785.55.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Randy Dunlap <randy.dunlap@oracle.com>, Russell King <rmk@arm.linux.org.uk>

On Tue, 2011-05-24 at 10:42 +0300, Artem Bityutskiy wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> Subject: [PATCH] mtd: fix physmap.h warnings
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
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

David, it looks like Russel did not merge this patch and people
complain. Could you please merge it?

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
