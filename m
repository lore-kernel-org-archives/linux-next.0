From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the bluetooth tree
Date: Sat, 20 Jun 2015 16:22:24 +1000
Message-ID: <20150620162224.24da2d9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lWH9uYDFegFwJ3cJpKyc0tK"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44283 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751122AbbFTGWd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 02:22:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Vincent <simon.vincent@xsilon.com>, Marcel Holtmann <marcel@holtmann.org>

--Sig_/lWH9uYDFegFwJ3cJpKyc0tK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  net/mac802154/llsec.c

between commit:

  5b0579850017 ("mac802154: fix llsec authentication without encryption BUG=
")

from the bluetooth tree and commit:

  25528fdae4ab ("mac802154: Switch to new AEAD interface")

from the crypto tree.

I just used the crypto tree version (effectively dropping the former
commit) since it is more extensive and so a better conflict resolution
is needed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/lWH9uYDFegFwJ3cJpKyc0tK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhQalAAoJEMDTa8Ir7ZwVPdYQAJWmIuGf/br4N1Nv/L5bE0Fz
x5b3JoD6aArI/pHC26Gud/0NtbSl5SZZkPJmuchpIv+cQjdkyRdolCiQCIKAgXk+
KXza+TaUz8kpqvT33qQWjPhG/5TaQ4ONf5A9OhU2mhnHLng+m+uqTreb0vn1cgDX
qR3rONMWz91AiYPbSlEVBVVKWWlbK9RJQMwlco1ulEelOx1AJw22ch/iJNCDfsV3
aC9ryVfZ/VZeIY648lcWDwPS7eXVmV8rTFA3rcDT7cg+Ft2xHtexqH/NwrJbiHy5
x8YLSGEFRUadHWLI3WA7ZTngEle4Nsc6bkRWXc4qowpP5fdV45Gs+4HL3xh0O8Cf
iQqUQFOiz9srIwu6DvSyYAZMl7k+jZDJnzJNOQd7y8BC8l6wnDk7Az0Rh7Bkt7i0
DLpkz8k8CTrThSMuRlYXzYCsEtoWSJBQ69XhzoFXQVpgTA2UrqKJvG4dqKqtklgv
7hg5DYeyqOhJYQZ1Wk0PD5cqqmqwkF7zovFd2zZpi8jbqAIhm5O+ViGz9xYUvWlE
r5+nqZ5fJRV/usN6q8P5jMTSgvRQhANxDeUDLwZLThK9LOkVdc/QY7Xbk2jYKIBz
qfgi6SthHMuxeucKPJDBVeDa5P90PHoIp38wph4ru+++B2R1c4ueOkTE/XDzbmzm
FfKHhgmauCweJgaOzmDy
=DpsN
-----END PGP SIGNATURE-----

--Sig_/lWH9uYDFegFwJ3cJpKyc0tK--
