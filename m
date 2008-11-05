From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tests tree
Date: Wed, 5 Nov 2008 13:52:11 +1100
Message-ID: <20081105135211.52bbbd8d.sfr@canb.auug.org.au>
References: <20081015170503.1130c183.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_13_52_11_+1100_5ENTJ=sMlwnXWCeD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52777 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754406AbYKECwY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 21:52:24 -0500
In-Reply-To: <20081015170503.1130c183.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__5_Nov_2008_13_52_11_+1100_5ENTJ=sMlwnXWCeD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ananth,

On Wed, 15 Oct 2008 17:05:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tests tree got a conflicts in lib/Kconfig=
.debug.
>=20
> You need to determine if this tree is ever going to be merged into Linus'
> tree.  I am going to drop it until you decide.

Given the discussion, I am dropping the tests tree until something is
decided.  (in which case, I assume the tree will have its conflicts with
Linus' tree fixed up)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_13_52_11_+1100_5ENTJ=sMlwnXWCeD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRClsACgkQjjKRsyhoI8wUZgCcCgJCZUfMJBtAXXle3xKmGxvy
VjYAniV4LeGbPuYVgNL1cZVnN5UTvc8u
=pduy
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_13_52_11_+1100_5ENTJ=sMlwnXWCeD--
