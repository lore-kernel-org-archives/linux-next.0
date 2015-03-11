From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request the EXTCON remote-tracking branch
Date: Thu, 12 Mar 2015 10:18:07 +1100
Message-ID: <20150312101807.29983bf5@canb.auug.org.au>
References: <54FFA674.2060006@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jGuWBVMuV.dNzHF_kOpL.m5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47761 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750939AbbCKXSN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2015 19:18:13 -0400
In-Reply-To: <54FFA674.2060006@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-next@vger.kernel.org
Cc: Greg KH <greg@kroah.com>

--Sig_/jGuWBVMuV.dNzHF_kOpL.m5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chanwoo,

On Wed, 11 Mar 2015 11:20:36 +0900 Chanwoo Choi <cw00.choi@samsung.com> wro=
te:
>
> I'm a maintainer of EXTCON (External Connector) subsystem. I want to
> merge latest extcon patch-set (extcon-next) to linux-next git repository
> for integration test.
>=20
> EXTCON git repository:
> - git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (bran=
ch name : extcon-next)

That isn't really your repository, now is it? :-)

I used git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git

I have added your tree from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/jGuWBVMuV.dNzHF_kOpL.m5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAM0zAAoJEMDTa8Ir7ZwVR4wP/iWNKvHoCKRA/GX/CoMpu7f+
d1FFNyUpDkdbrBoklk/4CtBCDq2RTuOmNSfmfaSfpNS/dlGiPc7tcQc8N/HpTiYe
waR7QFGpSrfCs7gSXyjJJQPWHSbTMlxnbnCFTIeAHKr5SHMQY+/mF7m0XOJZ31yP
lhk4JC1KnNLcOsYTEx4SyKzEvB65O6c/YfkVuoz3YMCQ2YI718Wlf5YOAgFGMLOm
ZJw8n7iWSiKA72Ac9/oz7EHQUmbE8KPv15aAHevZQ71BlcCzgFNeejw9nEjCEuKM
i+Z2beCBbNXkROvRcyvEDERSNrRacdI7GAd+AzrcMuyL+VYKREIJwo1FxvsqM9BQ
N9BO53a9oAU+EnjuQ61hFKrhW6flIOMUs/nBMqFoIBoGUCwzXfmawkmHSYBxfPQP
lOalWcIaMf6GX6Zx4BCUJzd9DgrLBVTl5cJBtmyTPy2zWfExyiUX1Euol7iOdfxd
qW3d8U4inywX7EwmWi090Wv0ozpkElDctNmCssikRawjp1TN8Y7VO+R1l6TMamF0
v8MnosJYlj6BJ+Hf1+qcChzB0o515PL0yGq6NptA9356fvN5pYKve1/k6Ri++qP6
lHk36pNyVhVGhLzplMmBx4Ods+5EvSNjZC4amUFuj7QlLJtb40ltMboHWMrEIhqJ
YSSxL/8whjLus7kz60CV
=wiL+
-----END PGP SIGNATURE-----

--Sig_/jGuWBVMuV.dNzHF_kOpL.m5--
