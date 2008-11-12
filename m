From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 12 Nov 2008 16:30:06 +1100
Message-ID: <20081112163006.d526f0eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Nov_2008_16_30_06_+1100_zEZ7uXoFFYuD0fmK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40069 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750995AbYKLFaR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 00:30:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__12_Nov_2008_16_30_06_+1100_zEZ7uXoFFYuD0fmK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflicts in
security/keys/internal.h and security/keys/process_keys.c between commit
1f8f5cf6e4f038552a3e47b66085452c08556d71 ("KEYS: Make request key
instantiate the per-user keyrings") from Linus' tree and
f71e534c1149637f4eb186b351e6afeb8584551c ("KEYS: Alter use of key
instantiation link-to-keyring argument") from the creds tree.

It needs local knowledge to fix up, so I will drop the creds tree for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_Nov_2008_16_30_06_+1100_zEZ7uXoFFYuD0fmK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkaad4ACgkQjjKRsyhoI8zhRQCffJ1Sfh3sMGdCxHyw0cxM16U8
JwIAnjvok90rr+gcvIk2zmupL5j9n4iz
=ZEHM
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Nov_2008_16_30_06_+1100_zEZ7uXoFFYuD0fmK--
