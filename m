From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Thu, 29 Mar 2012 19:25:07 +1100
Message-ID: <20120329192507.64c6c57b65cd0568d5e89ccc@canb.auug.org.au>
References: <20120326121719.dc4c2b1faca5cf12c8d76d93@canb.auug.org.au>
	<1332748641.2836.8.camel@dabdike>
	<20120326140721.GA19827@kroah.com>
	<20120327221721.GA3233@p183.telecom.by>
	<20120327222216.GB469@kroah.com>
	<20120327223510.GB3233@p183.telecom.by>
	<20120328235217.GA17212@kroah.com>
	<20120329073240.GA21382@perelman.Home>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__29_Mar_2012_19_25_07_+1100_rLcnyQ2tw=wR9X.h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:45021 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab2C2IZV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Mar 2012 04:25:21 -0400
In-Reply-To: <20120329073240.GA21382@perelman.Home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gerard Snitselaar <dev@snitselaar.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__29_Mar_2012_19_25_07_+1100_rLcnyQ2tw=wR9X.h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Mar 2012 00:32:40 -0700 Gerard Snitselaar <dev@snitselaar.org> w=
rote:
>
> On Wed Mar 28 12, Greg KH wrote:
> > > > >=20
> > > > > See commits 422f07001d6638fdde28f1909cc9162bc7f571d3..104c4fe25dc=
9bde823ba4591e910a77071b98ab5
> > > > > Especially the first one.
> >=20
> > I don't know where to find these patches, care to send them to me, or
> > point me at a link with them?
> >=20
>=20
> They are visible in next-20120329

I don't think so.  They were in next-2012032[67], but were removed again.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Mar_2012_19_25_07_+1100_rLcnyQ2tw=wR9X.h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPdBxjAAoJEECxmPOUX5FEB3kP/2budbjQT5weQMXtdCsuquWT
n25QDxwNX1TfOk6W4caat2y1EESoDi8C5ECfGF/QoC1CbnpX4sJzpCm9qEdanXXM
fCDzkN8osSMjUot8eBPnR/xVpYLGDIkghKst0fDCDJ3J3PfmaZCu69U0SUXXEFwn
WfcWE+s2KWymk9FmN6BWEpcr4bVbK0QomnQmjE5/0+qwIstCvVZaPWaORDzzOA0B
beUr5KNP6eJCUkBLRYmPGd9Jw8RMil42tFerGHZxQ+UAuKBk1lvrstu9ia1xkBXu
AC5Q2kb9l+tzMZs1FRki6fySmJyPcSXu89aymjyOnzWOFQhZUU98+VxWXB8xU+4u
5aZ7IAbC/ut9c1mZMHQ1ayha9BfICEzpSK5UgasyJjONvxibjDLdWhWd6GiDtP5X
6ykuIkMjsS4+6xvhXOZoa7unz0jhfbZMsOfT4NiDFOzCW/XL45CnKyq9E39FqDmw
c+ECjPQ7bOkR2SJyMGyE4f1MKnh7aCyUsX/UUZpbbFMDLFUDbosXuS7BIrcHDLus
Nf2u7yrgBi+yw1kn+14ELmzXQ9OrpbXNn4tGjH21wakD6H8O+VmciIiAqve/uC/D
n+8k2McMOe7EWQ2gcHGMy6EnMc6DXs7sogYW4FeoMh/jIjB7BNG9/AqPyfiIWNb9
hyHLhi9qgw4Ojsc+fSLM
=loOF
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Mar_2012_19_25_07_+1100_rLcnyQ2tw=wR9X.h--
