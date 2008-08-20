From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm tree build failure
Date: Wed, 20 Aug 2008 10:01:06 +1000
Message-ID: <20080820100106.b775b134.sfr@canb.auug.org.au>
References: <20080819155319.23e0e8b4.sfr@canb.auug.org.au>
	<200808191316.21469.marek.vasut@gmail.com>
	<s5hljytw8qf.wl%tiwai@suse.de>
	<20080819160656.GA20537@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__20_Aug_2008_10_01_06_+1000_Jgdl2Bt7tcD8eNcp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46483 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753428AbYHTABP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 20:01:15 -0400
In-Reply-To: <20080819160656.GA20537@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Takashi Iwai <tiwai@suse.de>, Marek Vasut <marek.vasut@gmail.com>, linux-next@vger.kernel.org

--Signature=_Wed__20_Aug_2008_10_01_06_+1000_Jgdl2Bt7tcD8eNcp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, 19 Aug 2008 17:06:56 +0100 Russell King <rmk@arm.linux.org.uk> wrot=
e:
>
> There's nothing in ucb1400.h that would require gpio.h, nor in
> ucb1400_*.c, so I think it's safe to remove.  Mind if I merge your
> patch into Marek's original to avoid bisect problems?
>=20
> Ditto for Stephen's patch?

Fine by me - that goes for all merge/build fixes I do for linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_Aug_2008_10_01_06_+1000_Jgdl2Bt7tcD8eNcp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkirXsIACgkQjjKRsyhoI8ymuACfTqgn2a5aUamMTrB8zuM7V9XQ
KasAnRDkGcEYnwcKYWXZm0mmbBVY69Kv
=Kz/b
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Aug_2008_10_01_06_+1000_Jgdl2Bt7tcD8eNcp--
