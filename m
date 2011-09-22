From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tmem tree with the trivial tree
Date: Thu, 22 Sep 2011 18:06:59 +1000
Message-ID: <20110922180659.1b4c2c4c17d0e2fb4f871444@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Sep_2011_18_06_59_+1000_Bkm2cQxCsjK+Hq1q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:43995 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712Ab1IVIHL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 04:07:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Jiri Kosina <jkosina@suse.cz>

--Signature=_Thu__22_Sep_2011_18_06_59_+1000_Bkm2cQxCsjK+Hq1q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Today's linux-next merge of the tmem tree got a conflict in
mm/cleancache.c between commit c460578a674f ("Documentation: fix broken
references") from the  tree and commit c3adff5aa194 ("mm: cleancache:
report statistics via debugfs instead of sysfs") from the tmem tree.

The latter removed the comment that the former was correcting.  So I sued
the letter version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Sep_2011_18_06_59_+1000_Bkm2cQxCsjK+Hq1q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOeuyjAAoJEDMEi1NhKgbsGUgIAI6mYTXlf8fVAd0QCckjxUAs
X9LhekdJL4aWYJKhESrgtVdSDGtLjwu28FVN5aAAtbw0/l7i18Z8jMCBhvNZ8hAI
yFelG7s1ab4UOpKFxfCWaDJ+XJzMffzPSfR5iQI36s6WDUifSf639IiTdunaS7Ys
FvxFXNZkH4ktCIPTM57EJT/D+aYDSDja/ScgINfaXt9tEzq5oKMDGeGl4KqNc3o1
zA+jyx4UA/1QD1yqVcwDLWo69jBMFkzmZG+gzzk4pBzjCDKi2j8tyQq/o0ejihFq
PM6psi+XZq70DMwq+IZ1MqOFp7SI/i8D2pvYfa4gq4fVNFpy1K2+KLEiEPpyIZs=
=jJVc
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Sep_2011_18_06_59_+1000_Bkm2cQxCsjK+Hq1q--
