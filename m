Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7B2F6164;
	Tue,  3 Feb 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770146307; cv=none; b=kk8qmlkqPaQftZcjAzUHvdKdGIx17RwMzd2Yt7EjcKs/qIfY5anlhTE8HHykK8aadFGC/ArVaSV7S599iOm8gKi8AFZKGic52pRYgVOYTQ5ZJi31aTM+dIrKaH30QFBFRl4riG636ay84IHokyqRle4nJ4jXpX6VxV9G5sgKyjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770146307; c=relaxed/simple;
	bh=rxH2m+FoFJnUNHe3cZwvXKG3s0lgRdBWcdA/6pGlIbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3Mdf4W/WxvYol0k7so9TM0UJ59hNeSn6VlW3Xq4InS7tIPVqPMTOk33syHoTqoG50Vs+4Oc8i3/JjUGkXIzH9ORMuE59wLqAhmpxKwt8B8O5nFC9b6QBlKLSatX1nroEOcC1iNDPGIyap6MRcZI3Qo9ajajgnP/+YhNIcwIbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bui75ggt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bui75ggt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCEAC19421;
	Tue,  3 Feb 2026 19:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770146307;
	bh=rxH2m+FoFJnUNHe3cZwvXKG3s0lgRdBWcdA/6pGlIbI=;
	h=Date:From:To:Cc:Subject:From;
	b=Bui75ggtxaFT7zhZm633fu40l4udZA6cy04Suhc09LeqXYefWUjuqtGngClfgih3I
	 NqLXI8qFW9scZHMjyF2BZUqKWh8AVPDsOWsIK2RZmx9jhD8/H3/7cL5vbBSlLkfnQh
	 TZXlPn+P1AQqg11BFaLoelB+eoeXF6l2IGrw1HSuR+bdouyAFgmmuHipATY43U+3ma
	 wNeXvTJVAugejNoInHXGC/QVJI7TCYd9Vo3as81AOlKmVaXDtrwnd0dYN05zeO2xKL
	 glddULsVXN/rGxXNxwqofqaXXE26I5fE9oGOQ/6CMWRNQEP/epb8XWn5k4OMUS/P1/
	 oMMANE8E2KrPA==
Date: Tue, 3 Feb 2026 19:18:23 +0000
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the keys-next tree with the modules tree
Message-ID: <aYJJ_w0_9DjvXYai@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bS7/BB2Y/zfWneex"
Content-Disposition: inline


--bS7/BB2Y/zfWneex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys-next tree got a conflict in:

  scripts/sign-file.c

between commit:

  d7afd65b4acc7 ("sign-file: Use only the OpenSSL CMS API for signing")

=66rom the modules tree and commit:

  0ad9a71933e73 ("modsign: Enable ML-DSA module signing")

=66rom the keys-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/sign-file.c
index 16f2bf2e1e3ce,78276b15ab23c..0000000000000
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@@ -271,20 -314,49 +271,40 @@@ int main(int argc, char **argv
  		digest_algo =3D EVP_get_digestbyname(hash_algo);
  		ERR(!digest_algo, "EVP_get_digestbyname");
 =20
 -#ifndef USE_PKCS7
 -
+ 		unsigned int flags =3D
+ 			CMS_NOCERTS |
+ 			CMS_PARTIAL |
+ 			CMS_BINARY |
+ 			CMS_DETACHED |
+ 			CMS_STREAM  |
+ 			CMS_NOSMIMECAP |
+ #ifdef CMS_NO_SIGNING_TIME
+ 			CMS_NO_SIGNING_TIME |
+ #endif
+ 			use_keyid;
+=20
+ #if OPENSSL_VERSION_NUMBER >=3D 0x30000000L && OPENSSL_VERSION_NUMBER < 0=
x40000000L
+ 		if (EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
+ 		    EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
+ 		    EVP_PKEY_is_a(private_key, "ML-DSA-87")) {
+ 			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
+ 			  * and before.
+ 			  */
+ 			use_signed_attrs =3D 0;
+ 		}
+ #endif
+=20
+ 		flags |=3D use_signed_attrs;
+=20
  		/* Load the signature message from the digest buffer. */
- 		cms =3D CMS_sign(NULL, NULL, NULL, NULL,
- 			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
- 			       CMS_DETACHED | CMS_STREAM);
+ 		cms =3D CMS_sign(NULL, NULL, NULL, NULL, flags);
  		ERR(!cms, "CMS_sign");
 =20
- 		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
- 				     CMS_NOCERTS | CMS_BINARY |
- 				     CMS_NOSMIMECAP | CMS_NOATTR |
- 				     use_keyid),
+ 		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo, flags),
  		    "CMS_add1_signer");
- 		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=3D 1,
+ 		ERR(CMS_final(cms, bm, NULL, flags) !=3D 1,
  		    "CMS_final");
 =20
 -#else
 -		pkcs7 =3D PKCS7_sign(x509, private_key, NULL, bm,
 -				   PKCS7_NOCERTS | PKCS7_BINARY |
 -				   PKCS7_DETACHED | use_signed_attrs);
 -		ERR(!pkcs7, "PKCS7_sign");
 -#endif
 -
  		if (save_sig) {
  			char *sig_file_name;
  			BIO *b;

--bS7/BB2Y/zfWneex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCSf4ACgkQJNaLcl1U
h9AhUwf9FKmJMx8f0zi6ZB+NleucczmjKdAm4nFeNVeDRt7f9YAZIfz2IshbbYtb
RuCuJJGUhETHttWimZs4I4p4pe1ZXml2py9P3yABlSTYcW+0SlY958VQf2Xme12J
CEGVHd8B/PaYjvqoc9LHVVCln0Tah/OUmoXSE+BongJFoPE2iDTIqhqfkwPrj39L
8jk3Nd6BiyE4WK8dDuL06yvmVW2uRwsg+LhqAzZShlXq+yPQFlHdJ09uV49tsHLN
zvRS2o1YCiHumUwfIsDilIt0RDvgzOl3oSvLy+6EEmXXFii1dSeyFZPQyd95D0vF
DGb7Ddt1zE7Xr+W3gXI5Fh0iYIviWA==
=UI6w
-----END PGP SIGNATURE-----

--bS7/BB2Y/zfWneex--
