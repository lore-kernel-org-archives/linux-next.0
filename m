Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2945F2D8DAF;
	Tue, 10 Feb 2026 21:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757706; cv=none; b=I01XuYfr53rE9Yl1Ja9TKIrkZRykLsAuSXyrp9KDQJyRiH+npdzSWtsyHn1hF61T3dWchpxXh94gbnQcqnWE3UxihlayYAvg3X3INyk0wnQv9CXbptoDZrGl4SDgQGjWHE/2hjMd9SILxyevXfdTIOHuRIqeUNCfAQwB8fT6U/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757706; c=relaxed/simple;
	bh=q9aD4wkF20r9cpmWjDfPuLo5f+NJTn9r5H0FI2DRRC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtpEWnUaelJ9hTlOBY1lACBzbzKyniSfq2bTxL8lb3Jr+fDmgAe2ib8gNcekuc8DIzT/AgsuFwWT3sy9SCVmGroGJjpjK0h9K0arh2y+8EBu9nYtMwh6/nvUYxHDbkTFdbThVuvVHFx+DXLKg6rbTg+vCRQcjSED7ttbNlQ2Cl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EozYKVUq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EozYKVUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B455C116C6;
	Tue, 10 Feb 2026 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770757705;
	bh=q9aD4wkF20r9cpmWjDfPuLo5f+NJTn9r5H0FI2DRRC8=;
	h=Date:From:To:Cc:Subject:From;
	b=EozYKVUqC6IAwekeH4I4rMtRM0wQciMSWLnQjZID8rBoAgLdiboW1rmWEyZDi2v/N
	 93lwhaNnLK/VlciZarL4uVZOzfCDz4PsERr3MftcMTCeEDGiGlYMUxvo0u70ltPTJW
	 Qwc8kcoCwpWkRu39jzglqwYTtvNv0LxlscgXbzlmtm9UQv7gUAWCuBubPfLMe2Liyp
	 qUatsQZ+9qskpgY8ek5h6SrSe0krzcn7PyoDbxbTpG1pzZow7B+25Aiqcubfd4EYG6
	 3UPIi6VXIoyaQ+LoxaisQ1mMh3Y2a3HDPy1s+pUWAmzw9ag9oHIAEv3yn+5S6PnEwJ
	 fadY3xx4EWX2Q==
Date: Tue, 10 Feb 2026 21:08:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp tree with the origin tree
Message-ID: <aYueRmtXzWX5UGf2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g+HwwMSfBvC68isZ"
Content-Disposition: inline


--g+HwwMSfBvC68isZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  scripts/coccinelle/api/kmalloc_objs.cocci

between commit:

  bdc5071d7f7bb ("coccinelle: Add kmalloc_objs conversion script")

=66rom the origin tree and commit:

  52d3cfa9bfcd4 ("coccinelle: Add kmalloc_objs conversion script")

=66rom the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined scripts/coccinelle/api/kmalloc_objs.cocci
index db12b7be7247a,916cc3a661b97..0000000000000
--- a/scripts/coccinelle/api/kmalloc_objs.cocci
+++ b/scripts/coccinelle/api/kmalloc_objs.cocci
@@@ -33,18 -33,15 +33,18 @@@ def alloc_array(name)
  typedef u8, u16, u32, u64;
  typedef __u8, __u16, __u32, __u64;
  typedef uint8_t, uint16_t, uint32_t, uint64_t;
 +typedef uchar, ushort, uint, ulong;
  typedef __le16, __le32, __le64;
  typedef __be16, __be32, __be64;
 -type INTEGRAL =3D {u8,__u8,uint8_t,char,unsigned char,
 -		 u16,__u16,uint16_t,unsigned short,
 -		 u32,__u32,uint32_t,unsigned int,
 -		 u64,__u64,uint64_t,unsigned long,
 +typedef wchar_t;
 +type INTEGRAL =3D {u8,__u8,uint8_t,char,unsigned char,uchar,wchar_t,
 +		 u16,__u16,uint16_t,unsigned short,ushort,
 +		 u32,__u32,uint32_t,unsigned int,uint,
 +		 u64,__u64,uint64_t,unsigned long,ulong,
  		 __le16,__le32,__le64,__be16,__be32,__be64};
  char [] STRING;
  INTEGRAL *BYTES;
 +INTEGRAL **BYTES_PTRS;
  type TYPE;
  expression VAR;
  expression GFP;
@@@ -67,10 -64,6 +67,10 @@@ fresh identifier ALLOC_OBJS =3D script:py
  	BYTES =3D ALLOC((sizeof(E)), GFP)
  |
  	BYTES =3D ALLOC((sizeof(TYPE)), GFP)
 +|
 +	BYTES_PTRS =3D ALLOC((sizeof(E)), GFP)
 +|
 +	BYTES_PTRS =3D ALLOC((sizeof(TYPE)), GFP)
  |
  	ALLOC((sizeof(void *)), GFP)
  |
@@@ -85,20 -78,12 +85,20 @@@
  	BYTES =3D ALLOC_ARRAY(COUNT, (sizeof(E)), GFP)
  |
  	BYTES =3D ALLOC_ARRAY(COUNT, (sizeof(TYPE)), GFP)
 +|
 +	BYTES_PTRS =3D ALLOC_ARRAY(COUNT, (sizeof(E)), GFP)
 +|
 +	BYTES_PTRS =3D ALLOC_ARRAY(COUNT, (sizeof(TYPE)), GFP)
  |
  	ALLOC_ARRAY((\(sizeof(STRING)\|sizeof(INTEGRAL)\|sizeof(INTEGRAL *)\)), =
COUNT, GFP)
  |
  	BYTES =3D ALLOC_ARRAY((sizeof(E)), COUNT, GFP)
  |
  	BYTES =3D ALLOC_ARRAY((sizeof(TYPE)), COUNT, GFP)
 +|
 +	BYTES_PTRS =3D ALLOC_ARRAY((sizeof(E)), COUNT, GFP)
 +|
 +	BYTES_PTRS =3D ALLOC_ARRAY((sizeof(TYPE)), COUNT, GFP)
  |
  	ALLOC_ARRAY(COUNT, (sizeof(void *)), GFP)
  |

--g+HwwMSfBvC68isZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLnkUACgkQJNaLcl1U
h9DVywgAhgnfVxo+iuq7CokT96iQ1k3mPdDYiKAk4TlbD61VubQlWlKAWzNj7ALz
cn61DuoOBssgGoYtJR1JCv5G0noZFG1AT1KVvwqglUAXV1j7v624a5Ijh/UYdmeJ
xnpSFae5fEqjo/55M4OfyLewUsOZECb2Hn0CL4Q+W016Enr+OqmcHrKOKGUy6dMY
TUR/Ebuuq/xrIM0guFMTUFv+jCQcdWJAu6M99iLxMz/RLXYQf1RZRyAGdTpQOutY
g9l5UW3ISVcXc+fL/x+X8YKxKuS1lsYZX2hYJfuPEsxbC1lvyHryWidrgBqZNomU
462f+BaWYsBGNOKQRsHxyLZIAJ8/RA==
=Vep3
-----END PGP SIGNATURE-----

--g+HwwMSfBvC68isZ--
