From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: staging tree build failure
Date: Thu, 11 Dec 2008 19:37:39 +1100
Message-ID: <20081211193739.57277b63.sfr@canb.auug.org.au>
References: <20081208204303.3c99dfa4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_19_37_39_+1100_8CVE5f9_pX3m45BM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49460 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754757AbYLKIhr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 03:37:47 -0500
In-Reply-To: <20081208204303.3c99dfa4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Thu__11_Dec_2008_19_37_39_+1100_8CVE5f9_pX3m45BM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 8 Dec 2008 20:43:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/staging/agnx/xmit.c: In function 'fill_agnx_hdr':
> drivers/staging/agnx/xmit.c:629: error: 'struct <anonymous>' has no membe=
r named 'retry_limit'
> drivers/staging/agnx/xmit.c:630: error: 'struct <anonymous>' has no membe=
r named 'retry_limit'
	.
	.
	.
>=20
> Commit "STAGING: Move staging drivers back to staging-specific menu"
> allowed them to build in the allmodconfig again.  I have dropped the
> staging tree for today.

This failure is still happening.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_19_37_39_+1100_8CVE5f9_pX3m45BM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklA0VMACgkQjjKRsyhoI8xtdgCgnsV2Jqb6LRyyJ9e/2Wtr9XqL
+VEAn2eKAIMOkFGYRrN0g0iE9cAPuGf7
=14VK
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_19_37_39_+1100_8CVE5f9_pX3m45BM--
