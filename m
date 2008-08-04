From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: linux-next: Tree for August 4
Date: Mon, 4 Aug 2008 11:51:49 +0200
Message-ID: <20080804095149.GC4747@denkbrett.schottelius.org>
References: <20080804162924.f3c5c3d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:46461 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311AbYHDJvv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2008 05:51:51 -0400
Content-Disposition: inline
In-Reply-To: <20080804162924.f3c5c3d4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Good morning!

Stephen Rothwell [Mon, Aug 04, 2008 at 04:29:24PM +1000]:
> Changes since next-20080801:
=20
I am currently trying to make linux-next a bit more debug-friendly
and merge your tree from time to time.

Thus I do:

   git-merge linux-next/master
   git-checkout linux-next/master $(git-ls-files --unmerged | awk '{ print =
$4 }')
   git-add $(git-ls-files --unmerged | awk '{ print $4 }')
   git-commit

The result can now be found at

   http://unix.schottelius.org/cgi-bin/gitweb.cgi?p=3Dforeign/linux-2.6

respectively

   http://unix.schottelius.org/git/foreign/linux-2.6/

I'll use the merged result for testing linux-next, perhaps adding
other branches later to test which branches you merge from are
directly mergable, without the need for a rebase.

Sincerly,

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiW0TUACgkQuL75KpiFGIy8HQCgkLD6+l69w0iCVHkGrwiAsCiu
oYoAoJT6HxZGFV9mhtK88fhEJuyLL6KS
=nj3Z
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
