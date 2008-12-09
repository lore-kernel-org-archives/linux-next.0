From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Tue, 9 Dec 2008 18:34:04 +1100
Message-ID: <20081209183404.637d3331.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_18_34_04_+1100_q7Knm9wxHD0C/E_a"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53791 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751962AbYLIHeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 02:34:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@redhat.com>
Cc: linux-next@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>

--Signature=_Tue__9_Dec_2008_18_34_04_+1100_q7Knm9wxHD0C/E_a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/gpu/drm/drm_gem.c: In function 'drm_gem_mmap':
drivers/gpu/drm/drm_gem.c:519: error: '_PAGE_CACHE_WC' undeclared (first us=
e in this function)

Caused by commit 33b801854540a4f5205c0b2b4b91987e7f21af08 ("drm: GEM mmap
support").  I tried to revert just that commit, but it lead me down a
road of dependent commits, so I have reverted the whole drm tree for
today.

_PAGE_CACHE_WC appears to be defined only for x86 and, before the above
commit, was not used outside arch/x86.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_18_34_04_+1100_q7Knm9wxHD0C/E_a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+H2wACgkQjjKRsyhoI8ywlACguMXG1wqZ0Ya68HDx9e7YWCMA
dt0AoKiaDPmWZGiJ4BBq5weOlsfeDBl/
=k35K
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_18_34_04_+1100_q7Knm9wxHD0C/E_a--
