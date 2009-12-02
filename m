From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext3 tree build failure
Date: Thu, 3 Dec 2009 10:22:49 +1100
Message-ID: <20091203102249.470d9bc3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Dec_2009_10_22_49_+1100_=21Rf/KHUxiFC29u"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46600 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752199AbZLBXWs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2009 18:22:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Dec_2009_10_22_49_+1100_=21Rf/KHUxiFC29u
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/ext3/super.c: In function 'parse_options':
fs/ext3/super.c:1200: error: expected expression before 'case'

Caused by commit 1bef03b44fd8977ee7f6b556e47a8e97b97f4980 ("ext3: Support
for vfsv1 quota format") which has an obvious patch artifact (a line
begins with '+') in a !CONFIG_QUOTA section.

Please at least build test this stuff!

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Dec_2009_10_22_49_+1100_=21Rf/KHUxiFC29u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksW9skACgkQjjKRsyhoI8yNYQCaA5Wr+xsyYQcZ7UsOU0NUjoWd
py0An25xJIUqejr/Cz3IzbC8JdOJKYQR
=UXFg
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2009_10_22_49_+1100_=21Rf/KHUxiFC29u--
