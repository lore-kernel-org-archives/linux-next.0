From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Fri, 21 Nov 2008 14:19:13 +1100
Message-ID: <20081121141913.90d05091.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__21_Nov_2008_14_19_13_+1100_GuY7K+MKofBKrSxT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49332 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756461AbYKUDT1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 22:19:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__21_Nov_2008_14_19_13_+1100_GuY7K+MKofBKrSxT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/usb/core/usb.c:958:76: error: macro "__module_param_call" requires =
7 arguments, but only 6 given

Caused by commit 636c06e04b23e9dabf709c496cb9a28459f63eaa
("param:core_param-really-really-early").

I have dropped the rr tree again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__21_Nov_2008_14_19_13_+1100_GuY7K+MKofBKrSxT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkmKLEACgkQjjKRsyhoI8ye8gCglZA7quYKyz55TRQbc1sP+/5I
6+oAn3oqtMXyfVrbnZVsobM2+5Cu6/bU
=xpKW
-----END PGP SIGNATURE-----

--Signature=_Fri__21_Nov_2008_14_19_13_+1100_GuY7K+MKofBKrSxT--
