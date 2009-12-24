From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kgdb tree build failure
Date: Thu, 24 Dec 2009 23:18:37 +1100
Message-ID: <20091224231837.1d19254c.sfr@canb.auug.org.au>
References: <20091224115624.77c910d6.sfr@canb.auug.org.au>
	<4B32E6FC.40103@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Dec_2009_23_18_37_+1100_kyWoBP8H6uW6eneR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52412 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751478AbZLXMSn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Dec 2009 07:18:43 -0500
In-Reply-To: <4B32E6FC.40103@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__24_Dec_2009_23_18_37_+1100_kyWoBP8H6uW6eneR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Wed, 23 Dec 2009 21:58:52 -0600 Jason Wessel <jason.wessel@windriver.com=
> wrote:
>
> All the kdb patches were dropped from kgdb-next / linux-next.  All the
> embedded type configs build and boot just fine.   The root of the
> problem was that there was a gap in testing all the various combinations
> where you can builds some things as a module or somethings as a built in.
>=20
> The error you reported is already fixed, but the code base will not be
> resubmitted until a new round of build and boot tests are completed.

Thanks for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Dec_2009_23_18_37_+1100_kyWoBP8H6uW6eneR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkszXB0ACgkQjjKRsyhoI8xnGACeJdmsl/z0ui4AIGvl67rEes/3
dNMAn2ohGPO/HsCJC/Qyg6iLLmAWN6kz
=HLuQ
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Dec_2009_23_18_37_+1100_kyWoBP8H6uW6eneR--
