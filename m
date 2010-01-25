From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pcmcia tree build failure
Date: Mon, 25 Jan 2010 13:13:43 +1100
Message-ID: <20100125131343.9934da5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Jan_2010_13_13_43_+1100_AWIerRkYbhIM3Rd3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37299 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751665Ab0AYCNv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Jan 2010 21:13:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__25_Jan_2010_13_13_43_+1100_AWIerRkYbhIM3Rd3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/built-in.o:(.toc1+0xd118): undefined reference to `pcmcia_dev_list_=
lock'

Caused by commit fc53c3482805cb3281dbeb0bd29dd892aaa53303 ("pcmcia:
simplify locking").

I have used the pcmcia tree from next-20100122 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Jan_2010_13_13_43_+1100_AWIerRkYbhIM3Rd3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktc/lcACgkQjjKRsyhoI8zzGQCZAQTv94/evtKbp92FXE4dsFgg
qlcAoLBe3ep6OofXOHbbiISiz7/YCDin
=J/Hz
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Jan_2010_13_13_43_+1100_AWIerRkYbhIM3Rd3--
