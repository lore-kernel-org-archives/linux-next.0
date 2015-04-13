From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the pci tree
Date: Mon, 13 Apr 2015 19:48:51 +1000
Message-ID: <20150413194851.47df3cb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hx2oVg1VX=Gy5cBaC+KJSep"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32886 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753385AbbDMJs4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 05:48:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/hx2oVg1VX=Gy5cBaC+KJSep
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in
Documentation/PCI/pci.txt between commit 37a9c502c0af ("PCI: Clarify
policy for vendor IDs in pci.txt") from the pci tree and commit
a708ec6790bb ("pci.txt: clarify vendor ID policy") from the vhost tree.

I fixed it up (I just used the pci tree version) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/hx2oVg1VX=Gy5cBaC+KJSep
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK5EHAAoJEMDTa8Ir7ZwV6UQP/1QVynpSCwuy0DDeHN4H4ToR
UnkoesbFLqC00kpUcW35YsN3eNGQXM/9meFOC1sSzqaxfE4jGb3+xG6os+09fZOT
Hr/BihPjrbCLwuGeBitcyagAwAfatVZg5MeRQOIWK9sRb789WijpHe0+fzl1T6+/
NUWNYX3r0/8X8u4x0Z6lanPFtV14vPA5WKXCSjC7Yv8nJGTNRwvulP28gmpw7FV2
98Dr4XTiSmhljt8eA0xKVwSuVCeNykL8QAiv8/zIysM4P/Ews+/VOEY9rdajdXvV
pLXuOPn/t+fAJIxPvJ7nuiUkw9MiLD7qBFqR+/3rIxY5VnhGJ4YaqNWzvrKfdzYK
/0xPcWwMn+CGkWuHSuQu5H1kNWk7aCZNXSkDiCnU/aViilEWNkD22vCXZIwnSFpf
plJSBVAdap+XYzwTb2OWTlmqxms5oJmvxXPZyIqg8msEks0z2ZNzNlaWKjwcREOd
ayeNrY+5QoTWSqbacaYMeWyLVRwMT9wfnsYsG8o20DjZ4I4BEa/qyGIu+qMBvQtv
n4IB8g4sWBm3CZqkHDFwt9+5Ol/1GZdx8iefwyZk7l3SWxHz7vcwiyQuSDgE7x/m
coR17RUBKWla+oo2klO2OrWFYC5AkchdPsLGLrQyrtiKUzuGfuiAd9l/eBGC8atU
+PgOKcnGTBwbVfdH0gRf
=7NMz
-----END PGP SIGNATURE-----

--Sig_/hx2oVg1VX=Gy5cBaC+KJSep--
