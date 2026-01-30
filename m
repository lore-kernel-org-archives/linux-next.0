Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107002E06E6;
	Fri, 30 Jan 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793614; cv=none; b=CWbspszI1EOtZDlRCNSINgVilgavy2rOgbrAkYR5GcKlMlkbjx7fJ0jwS3FVOx96AlB2Y1N3Ez/y3bbs7Y1Yqr4zR4KWFwQpdRiswRAhyCOCF+m5mOdktXct7KfE1e4LTZYS9QZouOJao0AcHMhK+eEcniCsp4U1BPU8HU5+pFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793614; c=relaxed/simple;
	bh=SpwfvTyeZIZwbLVUT0SOkCYfcU+WB08zL+Gvb471nJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seFyq93zkOXfCn5/nmraSZkABoA6ZGqVkfvqKdKnhuGnjqahG4QNLD871hFRFMK/lQ71yv2gkcagEFmDXIriHKBBW8xzzxHOAfL9z/iba+iXG/WGQ8PC2RYS1L3M84m5cMt9xOeF0HXmpJwoXSAatpFCXhaG1074jWJngwsRwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqmXuy6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqmXuy6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA70C4CEF7;
	Fri, 30 Jan 2026 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769793613;
	bh=SpwfvTyeZIZwbLVUT0SOkCYfcU+WB08zL+Gvb471nJU=;
	h=Date:From:To:Cc:Subject:From;
	b=tqmXuy6PxtGRfzBmt4ttegtSBq1q3Mz3EVMnLE9ThcS3CW8Rbxb67QzSKCMkdFwyr
	 U/YsExb4YXRg0LeRIrRMCeMrdPOkka61L2kOXxinPTwSBKSfqt3o072mwFkg0JQBCi
	 eK4gyBfekFGLzzCmVSW6E/ec3psD1/KQwzF6VuvCTvBtC+U7c4QlS10I6MBvW8mWKK
	 kfvUkS4dIXFQGuSiIon8RqOoG+EtjpQIDLiLZuY8nENN6zcT0EuQt9YAIa8KyNWKq1
	 EQ1rNuBaK4rLqfvVI1RMdbPzsMn3daB0Y/cnosll1SKMLN3G9qBLZ6WoBdl3AaO5zR
	 GYWj3ue7q8eSQ==
Date: Fri, 30 Jan 2026 17:20:09 +0000
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the keys-next tree with the modules tree
Message-ID: <aXzoSci8NPhIwDf-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeuXsVOTjfjAlXPB"
Content-Disposition: inline


--SeuXsVOTjfjAlXPB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys-next tree got a conflict in:

  scripts/sign-file.c

between commit:

  d7afd65b4acc7 ("sign-file: Use only the OpenSSL CMS API for signing")

=66rom the modules tree and commit:

  7ca1c9dcb7b0c ("modsign: Enable ML-DSA module signing")

=66rom the keys-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/sign-file.c
index 16f2bf2e1e3ce,547b970972301..0000000000000
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@@ -271,20 -314,46 +271,37 @@@ int main(int argc, char **argv
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
+ 			CMS_NO_SIGNING_TIME |
+ 			use_keyid;
+=20
+ 		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
+ 		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
+ 		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
+ 		    OPENSSL_VERSION_MAJOR < 4) {
+ 			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
+ 			  * and before.
+ 			  */
+ 			use_signed_attrs =3D 0;
+ 		}
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

--SeuXsVOTjfjAlXPB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml86EgACgkQJNaLcl1U
h9CQCwf+OdaiKkEIBpKd0m1rYUfrqVh87Cowhwt9uVMGhHMqnzg5Zaq/1/M+qURV
uyCptPOwPXg5Qd3a/6BSOO7z4DpaTS5HhHWULz2qG3rmtHeAxKk0rtKmr5Z47elP
c4FbMImor8WGpU8laF1P3lbrBriU+qvlCpH6LOzX/uJOnWy66Goj7ZUWrnj1vYDV
5jx/w3jMs4xTchHFjtySQmrFWPgrQ3TFPr6upb4KuWuGTxNqDoh4ky5sd8uOjoRM
t79XGDhDj4qnHAhJEIX6DIUbOv0N92z9Mj7rXjAdv+lSXBENjPfjg+e+Ov7RQRD3
FBZPL2R8OMzrP4010f0Pp8BERCiW5A==
=lGW6
-----END PGP SIGNATURE-----

--SeuXsVOTjfjAlXPB--
