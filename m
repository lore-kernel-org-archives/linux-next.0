From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build warning
Date: Mon, 13 Jul 2009 17:28:31 +1000
Message-ID: <20090713172831.8875ac2c.sfr@canb.auug.org.au>
References: <20090713172646.55b9acee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__13_Jul_2009_17_28_31_+1000_8cBMSrHo8n.FuXCg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46728 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752773AbZGMH2i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2009 03:28:38 -0400
In-Reply-To: <20090713172646.55b9acee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

--Signature=_Mon__13_Jul_2009_17_28_31_+1000_8cBMSrHo8n.FuXCg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 13 Jul 2009 17:26:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>=20
> drivers/firewire/core-device.c: In function 'init_fw_attribute_group':
> drivers/firewire/core-device.c:315: warning: assignment from incompatible=
 pointer type
>=20
> Introduced by commit 025a6a26b70e5dc12ab9333ea43d70c735f459ac ("driver
> model: constify attribute groups").

Also:

drivers/mtd/mtdcore.c:227: warning: initialization from incompatible pointe=
r type

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__13_Jul_2009_17_28_31_+1000_8cBMSrHo8n.FuXCg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpa4h8ACgkQjjKRsyhoI8xb4ACfXYgZtlRAWAMYmZBT7qt9w1UJ
L9oAmwdpjtPzpEubbu21og3+gqr3hdRI
=fFZe
-----END PGP SIGNATURE-----

--Signature=_Mon__13_Jul_2009_17_28_31_+1000_8cBMSrHo8n.FuXCg--
