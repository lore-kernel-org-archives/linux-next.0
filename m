From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: How to debug linux-next? (was: Re: xorg problems with
	v2.6.27-rc1-2457-gdcb80fd)
Date: Thu, 31 Jul 2008 15:23:44 +0200
Message-ID: <20080731132344.GC4201@denkbrett.schottelius.org>
References: <20080731125630.GB4201@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:49414 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751474AbYGaNXr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Jul 2008 09:23:47 -0400
Received: from denkbrett.schottelius.org (natgw.netstream.ch [62.65.128.28])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.schottelius.org (Postfix) with ESMTPSA id DA7FE316280
	for <linux-next@vger.kernel.org>; Thu, 31 Jul 2008 15:23:41 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <20080731125630.GB4201@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again!

Some questions about using and debugging linux-next:

- Where to report errors? to this ml? cc-ing the related subsystem
  maintainer(s)?

- What's the normal way of finding out the source for a problem, if you know
  a good commit (9bead9ae16728973cd31d9fd60c496e0e2fabbd1) and a
  bad commit (dcb80fdb8cffd3fa06cd322b3e8227632ec23597)?

- As far as I can see, you are doing rebase on linux-next. Why don't you
  continue to do git-merge?

- And would a non-rebased tree not make life much easier for debugging
  purposes?

My motivation is to find out the reason why xorg crashes now together
with the xorg guys. But currently it seems to be impossible for me to
detect which commits have been between to snapshots of the master
branch of linux-next.

Sincerly,

Nico

Nico -telmich- Schottelius [Thu, Jul 31, 2008 at 02:56:30PM +0200]:
> Hello!
>=20
> When booting this kernel, xorg crashes. Details can be found on
>=20
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D493101.
>=20
> Possibly more an xorg issue, just wanted to report that xorg still works
> with 2.6.26-next-20080725.
>=20
> Sincerly,
>=20
> Nico
>=20
> --=20
> Think about Free and Open Source Software (FOSS).
> http://nico.schottelius.org/documentations/foss/the-term-foss/
>=20
> PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C



--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiRvOAACgkQuL75KpiFGIyLVQCgpZvAlVmZ5nK24t216NdyaHg5
TN8An0ktjJCgBBIEFf9JJkugk0llQsUm
=yYTO
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
