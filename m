From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Tue, 1 Dec 2009 10:10:24 +1100
Message-ID: <20091201101024.e5a92d95.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Dec_2009_10_10_24_+1100_wo2mqTbgzSV8.iZn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57319 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752749AbZK3XKW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 18:10:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Signature=_Tue__1_Dec_2009_10_10_24_+1100_wo2mqTbgzSV8.iZn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus, David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/9p/cache.c: In function '__v9fs_fscache_release_page':
fs/9p/cache.c:346: error: 'vnode' undeclared (first use in this function)

Caused by commit 201a15428bd54f83eccec8b7c64a04b8f9431204 ("FS-Cache:
Handle pages pending storage that get evicted under OOM conditions").

Please, at least build files that have been modified ...

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Dec_2009_10_10_24_+1100_wo2mqTbgzSV8.iZn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksUUOAACgkQjjKRsyhoI8yV3QCfZ18X44OhJ87ckQ46eRsIE2cU
MO8AnAzU+U/z55BXvegAew1Vr2kdwECK
=Iie9
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Dec_2009_10_10_24_+1100_wo2mqTbgzSV8.iZn--
