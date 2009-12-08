From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung tree
Date: Tue, 8 Dec 2009 11:17:22 +1100
Message-ID: <20091208111722.2e8d9527.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Dec_2009_11_17_22_+1100_2pW2R9.8ZAE/68q1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55058 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935584AbZLHARU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2009 19:17:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__8_Dec_2009_11_17_22_+1100_2pW2R9.8ZAE/68q1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

In today's linux-next merge of the samsung tree I noticed that the file
arch/arm/plat-s3c/dev-hsmmc2.c actually has some merge conflict artifacts
in it.

I fixed them up (just by using the version from the arm tree) but it
would be good if this could be fixed in your tree as well (I notice that
Russell has already merged a (presumable) correct version of these files).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Dec_2009_11_17_22_+1100_2pW2R9.8ZAE/68q1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksdmxIACgkQjjKRsyhoI8yriQCeMXRHL3ytHBSqDdgxTTa+MqNu
Q2oAoIpkAnQhI2kek260pMQ41DbzySan
=mOOe
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Dec_2009_11_17_22_+1100_2pW2R9.8ZAE/68q1--
