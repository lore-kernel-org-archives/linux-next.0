From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Wed, 27 Jan 2010 11:09:37 +1100
Message-ID: <20100127110937.e606616d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Jan_2010_11_09_37_+1100_GmD8HSpnBG8Zn0Gp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41155 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754329Ab0A0AJo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jan 2010 19:09:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>

--Signature=_Wed__27_Jan_2010_11_09_37_+1100_GmD8HSpnBG8Zn0Gp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/gpu/drm/radeon/radeon_agp.c: In function 'radeon_agp_init':
drivers/gpu/drm/radeon/radeon_agp.c:137: warning: format '%d' expects type =
'int', but argument 4 has type 'size_t'

Introduced by commit 0a3f316370da07fcdb11fde4f5a683d60713b7fd
("drm/radeon/kms: Disable AGP is aperture size < 32M").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Jan_2010_11_09_37_+1100_GmD8HSpnBG8Zn0Gp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktfhEEACgkQjjKRsyhoI8yHdACfUzkzugOGYCXaEt2unlJ9gFop
gaIAn2xBchw2TMBurm/9lw9620nCGmU+
=DAHN
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Jan_2010_11_09_37_+1100_GmD8HSpnBG8Zn0Gp--
