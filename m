From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree
Date: Wed, 5 Nov 2008 16:33:14 +1100
Message-ID: <20081105163314.30c72d57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_16_33_14_+1100_atU4XaXLLH0A/GdT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35251 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750889AbYKEFd2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 00:33:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>

--Signature=_Wed__5_Nov_2008_16_33_14_+1100_atU4XaXLLH0A/GdT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Serge,

Today's linux-next merge of the userns tree got conflicts caused by the
creds tree that the userns tree is based on.  I excluded the creds tree
(since the conflicts were a bit complex) so I need to exclude the userns
tree as well for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_16_33_14_+1100_atU4XaXLLH0A/GdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRMBoACgkQjjKRsyhoI8wbxACggIyd6Yw6+iz4t3/ePzUufngA
faMAnA3l3ebcDKI9Bu6mHX9dSSE8xFLQ
=dPFJ
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_16_33_14_+1100_atU4XaXLLH0A/GdT--
