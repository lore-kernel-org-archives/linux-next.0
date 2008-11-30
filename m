From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Mon, 1 Dec 2008 10:46:39 +1100
Message-ID: <20081201104639.5080f12e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_10_46_39_+1100_O0Ic0KN.36GKwQPU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34786 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753457AbYK3XrM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 18:47:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Mon__1_Dec_2008_10_46_39_+1100_O0Ic0KN.36GKwQPU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

  GEN     /scratch/sfr/powerpc_ppc64_defconfig/Makefile
***
*** Can't find default configuration "arch/sparc/configs/ppc64_defconfig"!
***

Caused by commit 9cdcf85e1bf5dca97c1304292810041af2fcbd42 ("Subject:
[PATCH 08/10] sparc,sparc64: unify Makefile") which seems to arbitrarily
set SRCARCH in the top level make file to sparc!

(One way to take over the world, I guess :-))

I have dropped the sparc tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_10_46_39_+1100_O0Ic0KN.36GKwQPU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzJd8ACgkQjjKRsyhoI8yL/gCeK0j/SFYj4lxy0pXk6qiTuTGX
c9sAmgI+s93Vc+vvT5nYHgSiPFvM+gBf
=SfYU
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_10_46_39_+1100_O0Ic0KN.36GKwQPU--
