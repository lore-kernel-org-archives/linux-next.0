From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: manual merge of the mtd tree with Linus' tree
Date: Fri, 27 May 2011 10:43:44 +0300
Message-ID: <1306482224.2785.153.camel@localhost>
References: <20110527140018.993fe260.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.1.47]:47000 "EHLO mgw-sa01.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754080Ab1E0Hsw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 May 2011 03:48:52 -0400
In-Reply-To: <20110527140018.993fe260.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk@arm.linux.org.uk>

On Fri, 2011-05-27 at 14:00 +1000, ext Stephen Rothwell wrote:
> Hi David,
>=20
> Today's linux-next merge of the mtd tree got a conflict in
> drivers/mtd/maps/integrator-flash.c between commit adf0040096e4 ("ARM=
:
> 6906/1: MTD: Remove integrator-flash") from Linus' tree and commit
> ee0e87b174bb ("mtd: convert remaining users to mtd_device_register()"=
)
> from the mtd tree.
>=20
> The former removes the file updated by the latter, so I just removed =
it.

Yes, this is right, thanks.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
