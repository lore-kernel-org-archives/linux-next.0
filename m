From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 1 (tmpfs)
Date: Sat, 2 May 2009 15:24:14 +1000
Message-ID: <20090502152414.547a8052.sfr@canb.auug.org.au>
References: <20090501163405.973f9088.sfr@canb.auug.org.au>
	<49FB12D0.5030809@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__2_May_2009_15_24_14_+1000_zqHFeFzCGRX_.I2g"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38087 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750746AbZEBFYS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 2 May 2009 01:24:18 -0400
In-Reply-To: <49FB12D0.5030809@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <gregkh@suse.de>

--Signature=_Sat__2_May_2009_15_24_14_+1000_zqHFeFzCGRX_.I2g
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just added some cc's]

On Fri, 01 May 2009 08:18:40 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>=20
> When CONFIG_SHMEM=3Dn:
>=20
> init/built-in.o: In function `kernel_init':
> main.c:(.init.text+0x8be): undefined reference to `init_tmpfs'
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__2_May_2009_15_24_14_+1000_zqHFeFzCGRX_.I2g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn72P4ACgkQjjKRsyhoI8yUNQCfSsDBcLL8oTmcIQ69giSG8gzO
vSsAn2dUspDIKizsGcfyFpirsuMGMTXX
=FbEb
-----END PGP SIGNATURE-----

--Signature=_Sat__2_May_2009_15_24_14_+1000_zqHFeFzCGRX_.I2g--
