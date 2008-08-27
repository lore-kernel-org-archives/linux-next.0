From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 27 Aug 2008 16:59:23 +1000
Message-ID: <20080827165923.00a6a25f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Aug_2008_16_59_23_+1000_.=jqiJVoxx+QdIiP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37419 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752399AbYH0G7d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 02:59:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__27_Aug_2008_16_59_23_+1000_.=jqiJVoxx+QdIiP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
include/linux/cred.h between commit
9e2b2dc4133f65272a6d3c5dcb2ce63f8a87cae9 ("CRED: Introduce credential
access wrappers") from Linus' tree and commit
353d37698a27cff3f5663f92ed61434a3209c37a ("CRED: Document the credential
API's (ab)use of const pointers") from the creds tree.

I just used the version from the creds tree.

How's the resync with Linus' tree coming along?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Aug_2008_16_59_23_+1000_.=jqiJVoxx+QdIiP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki0+0sACgkQjjKRsyhoI8yiJQCcCwYY+zpr345v3jCi8tgsQ/h8
HeEAniEAxSPdHEZ9sRl8iAipwnPUji0w
=sToI
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Aug_2008_16_59_23_+1000_.=jqiJVoxx+QdIiP--
