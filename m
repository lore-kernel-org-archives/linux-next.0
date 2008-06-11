From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc32 build failure
Date: Wed, 11 Jun 2008 19:32:09 +1000
Message-ID: <20080611193209.163fa2be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_19_32_09_+1000_aQKoEYKtC/AXJ8dB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43646 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751323AbYFKJcW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 05:32:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__11_Jun_2008_19_32_09_+1000_aQKoEYKtC/AXJ8dB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Sam,

Today's linux-next build (sparc32 defconfig) failed like this:

  Building modules, stage 2.
/opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sparc64-=
unknown-linux-gnu-ld: .tmp_kallsyms2.o: No such file: No such file or direc=
tory
make[2]: *** [arch/sparc/boot/image] Error 1

I am guessing some kbuild change that sparc32 doesn't like.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_19_32_09_+1000_aQKoEYKtC/AXJ8dB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPm5kACgkQTgG2atn1QN+CRQCeK7iqgT/oEGqQ2pny3sjUhVOr
gDoAn3rkQ9W9Ex9VZx4+L2zaJn5cHmmy
=r72Q
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_19_32_09_+1000_aQKoEYKtC/AXJ8dB--
