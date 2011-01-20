From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Reorganization of git.secretlab.ca branches
Date: Thu, 20 Jan 2011 11:16:10 +1100
Message-ID: <20110120111610.6a704c18.sfr@canb.auug.org.au>
References: <AANLkTim0+NLeK=RK3aVSrX+ij113rz+BTExr8zUhCErY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Jan_2011_11_16_10_+1100_llp1b0+ICzFj1XGJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754304Ab1ATAQS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Jan 2011 19:16:18 -0500
In-Reply-To: <AANLkTim0+NLeK=RK3aVSrX+ij113rz+BTExr8zUhCErY@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next <linux-next@vger.kernel.org>

--Signature=_Thu__20_Jan_2011_11_16_10_+1100_llp1b0+ICzFj1XGJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Wed, 19 Jan 2011 10:35:26 -0700 Grant Likely <grant.likely@secretlab.ca>=
 wrote:
>
> I've reorganized my git tree to be clearer, so I'd like to update the
> list of branches that you're pulling from me for linux-next:
>=20
> Here are the branches you're currently pulling:
>=20
> gcl-current	git	git://git.secretlab.ca/git/linux-2.6#merge
> 52xx-and-virtex	git	git://git.secretlab.ca/git/linux-2.6#next
> devicetree	git	git://git.secretlab.ca/git/linux-2.6#next-devicetree
> spi		git	git://git.secretlab.ca/git/linux-2.6#next-spi
>=20
> I've been using 2 branches for each subsystem that I'm maintaining;
> one for bug fixes that should be merged relatively quickly, and one
> for linux-next.  Most of the time the 'merge' branches are empty, but
> once in a while I've got a bugfix that I want to give wider testing
> before asking Linus to pull.  So, I'm thinking that I'd like to change
> the trees that you merge to:
>=20
> 52xx-and-virtex-current	git	git://git.secretlab.ca/git/linux-2.6#powerpc/=
merge
> 52xx-and-virtex	git	git://git.secretlab.ca/git/linux-2.6#powerpc/next
>=20
> devicetree-current	git	git://git.secretlab.ca/git/linux-2.6#devicetree/me=
rge
> devicetree	git	git://git.secretlab.ca/git/linux-2.6#devicetree/next
>=20
> spi-current		git	git://git.secretlab.ca/git/linux-2.6#spi/merge
> spi		git	git://git.secretlab.ca/git/linux-2.6#spi/next
>=20
> Does this sound reasonable to you?

Looks good and all done.  I think you may have not put your powerpx fix
into your powerpc/merge branch yet, though.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Jan_2011_11_16_10_+1100_llp1b0+ICzFj1XGJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNN37KAAoJEDMEi1NhKgbsYDAH/2bk2J9Zrt1hzerlPf0VrKm6
mn26F/4xoWqDGdCpCQEE6LOXZT70/Cd1YIFVgBzH3ZwcyPkUeU1gotcw0yX9+3SN
2c2U2O7X9QpiU30Xx8L+lKZUnQWXMVgjZth2GGNfb9CzhvKj/FlxFgEFA5hVjhxK
QX+uv/xUdSb1RP/4q32GCvzCWFvCf92neO4dEDTQY5AJ0Pha2jZThMKBwyoUQYvn
DBWsQU6O5P1neGQF25Fm9hPU3Ay7lHpT25iKMFzpkgJ7UEUp7C06vvLHyhMKdBNU
9dSw1LMvAIbZ2ABierCozcI7Bi5AqeIruvuV/t3awz89kdZVeyPgnmKhqubWOjg=
=vNNV
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Jan_2011_11_16_10_+1100_llp1b0+ICzFj1XGJ--
