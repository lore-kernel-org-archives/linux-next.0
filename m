Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957971;
	b=bqnDdQ7C1JGZju+Eim/VxgLxU0bpgAGjyT9bHjagVEDsWnn+vDegnQ1lwyTlX1AAeUyp
	 9OoKY8oCSJB0+7RDmY33rhegR+6CHT0Y99T5mMKtckKbjmY8EeiKghU3ThPj05y+PD6dZ
	 G+zlTMID4KvqIxcf939piWG9YARFrRFJn/T6uESfcUHX8OcWFKfcmZHif4FDmsH2X4sjx
	 cpjnNU4j2t5xkQwRrO257KDaaEubb9Db7GhwDjQ+5efGolcpiUVkf0jR0NTYaNZWPzOrk
	 sMnjmhMq6tKvVQzql4bNuyrgxzxmfY8dkwGYo+hueGJGT16bUeDXULiodYlZHc1IirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957971;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=qaJG456rSWJDKSb1mEk5GAh4Um6Ldu7TQKotnHutSOU=;
	b=aDIB0MEISBigQHSC+SdBBYyv0SLlgZ9dPyQWRM0kCrcxpybdLE35v0ysINFJdwE1MrbC
	 nfuIrJCJ8yxGguuaf8Rx9rCAfyfx5itXHpievoC9Cg4roOovjRwF0l9jIpGZOzDDWL8XG
	 OLcB3PJ6VLFOL2umyDepoJfCOSZkTM2JjoMOkpaPPuY4llt8imAgqT3E2GuTgYO52HVNc
	 /JsO+0vjtEoEJHe+l0ihecJBwrTkiPK2nA4Z5XsLT7AdcbiLLgNY9SeCe4ZNONw6XgSxC
	 gm/wxXMpQR643e6+oQAer43aLgbAglbW+MNCLkdC+AqTtGdvgoMaxvFmhnR9KBGNV3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGBXVBxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AF606A32C;
	Tue, 17 Nov 2026 23:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGBXVBxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9444E1F000C4;
	Tue, 17 Nov 2026 23:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957971;
	bh=qaJG456rSWJDKSb1mEk5GAh4Um6Ldu7TQKotnHutSOU=;
	h=Date:From:To:Cc:Subject;
	b=CGBXVBxZ4kBrkSxklVAVCi/gBZijrr8oxn119GhoBHzx0N3innik3mofgIbNFE2sx
	 6/QubP5TE4EHAPUwsAvmvb+SlIFHZlqnJk9SCN/Q9fnwWUpOlTWKjaIAy0j6M6j/ZR
	 ol3JmWUsiRREddF29eQzamLrQfwgWA0/LfPfio5qWsbWgfzELT5XFKAQo/sAJemMi0
	 FHlo8a0Bns+xOd3VLw8r4FLWwPFMPQHU9SfQTS3LcOKz2DcAjL2qfrwtH0kK+hDnS/
	 UwsYL1gLDgM68xvwT+2rauxzBgpPWwz/Q7gRz4pyeYh4XeKq18/zwFmlozyizVHbPX
	 toEGkeXL4v8nw==
Date: Tue, 17 Nov 2026 23:26:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pagemap-headers tree with the
 vfs-brauner tree
Message-ID: <avzikEWdwmyD11rJ@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V0VxkwhCc8JEsWId"
Content-Disposition: inline


--V0VxkwhCc8JEsWId
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pagemap-headers tree got a conflict in:

  net/sunrpc/cache.c

between commit:

  64e4b2814cdc7 ("SUNRPC: let procfs copy out reads")

=66rom the vfs-brauner tree and commit:

  487f6c57f2afc ("sunrpc: Remove pagemap.h")

=66rom the pagemap-headers tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/sunrpc/cache.c
index c6b6701ddf7f6,825e47833e095..0000000000000
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@@ -27,8 -27,6 +27,7 @@@
  #include <linux/net.h>
  #include <linux/workqueue.h>
  #include <linux/mutex.h>
- #include <linux/pagemap.h>
 +#include <linux/uio.h>
  #include <asm/ioctls.h>
  #include <linux/sunrpc/types.h>
  #include <linux/sunrpc/cache.h>

--V0VxkwhCc8JEsWId
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr84o8ACgkQJNaLcl1U
h9D1lQf+LBFVhQ4doZFfo9E5ODOek0dKrb4ywmMyQeQQsVx4NZRnzBIVvy0nkRd+
XqoCJ8tYuV/D9pHMkNFBwP/KUdGgipuqklvCU/F2B/UIxTgd/rXzTYb0UtKM2QWV
aRMfdgNJMQFFNBVV3KMxG0WOgdwaO9GKE/3wFvesF68Zs6OUUx6+hcSDBKheOudk
/IVUTGdETNtJPFTHwm5bE9t7ThpFKlITOhh3rWBHasaSky4ny82cehrCUc8sG3UL
I38E8p4niLiThFycKeI5F2E5pnnNcb+JJEj73NoAgvU7g3tLm+afHaG4PXZ26dir
doMuRmCpRZ9BkJLs3ppBGoJemGSGow==
=qegc
-----END PGP SIGNATURE-----

--V0VxkwhCc8JEsWId--
