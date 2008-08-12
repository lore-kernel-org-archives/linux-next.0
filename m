From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for August 11
Date: Tue, 12 Aug 2008 15:38:51 +1000
Message-ID: <20080812153851.179fc90d.sfr@canb.auug.org.au>
References: <20080811164617.7b06df12.sfr@canb.auug.org.au>
	<48A09CE5.70402@ct.jp.nec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_15_38_51_+1000_xzHoOl7Kg4n7u9sP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49794 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750875AbYHLFjA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 01:39:00 -0400
In-Reply-To: <48A09CE5.70402@ct.jp.nec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hiroshi Shimamoto <h-shimamoto@ct.jp.nec.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alan Cox <alan@redhat.com>, Jeff Dike <jdike@addtoit.com>

--Signature=_Tue__12_Aug_2008_15_38_51_+1000_xzHoOl7Kg4n7u9sP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hiroshi,

On Mon, 11 Aug 2008 13:11:17 -0700 Hiroshi Shimamoto <h-shimamoto@ct.jp.nec=
.com> wrote:
>
> I got an error on um defconfig;
>=20
> arch/um/drivers/line.c: In function 'line_ioctl':
> arch/um/drivers/line.c:306: error: implicit declaration of function 'tioc=
linux'
> make[1]: *** [arch/um/drivers/line.o] Error 1
>=20
>=20
> This commit may cause it.
>=20
> commit 1aa5f1fab397054a9133bcaf511973db5a6b97be
> Author: Alan Cox <alan@redhat.com>
> Date:   Mon Aug 11 10:27:35 2008 +1000
>=20
>     tty-fixup-uml
>=20
>     Add a new nicer hook for tioclinux

It looks like it may be fixed in today's linux-next as that patch has
been updated.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_15_38_51_+1000_xzHoOl7Kg4n7u9sP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihIesACgkQjjKRsyhoI8x3iwCfUEXEW7KR12/XxIf4BCx5xj85
O1kAn3ug2nes6i4bt2QM7sywMGFmfr99
=S9kg
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_15_38_51_+1000_xzHoOl7Kg4n7u9sP--
