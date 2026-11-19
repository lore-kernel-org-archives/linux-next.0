Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103148;
	b=j4gGl1Udzt4/EiXWU6Z8SDUuWQy33n15G9R3iFnWkcx2XJqDbd7cVMjaVgD8KTljxy4q
	 rM57jHLuuvT6mpTuw3URjsi84oO6BJ8qxskFAf0DLY7+ExmMUvWZopOr6mnOK6N2LWBCc
	 XZ6jYWW8B5YhfgJztW09d7BjeOf6YwvI++0PjE8yXsD/46wjwZSN/NQjRE2PPcfUnwOey
	 LeyMSPQVguWWDXDGB697aCBh8BltU8FhChBrjhUrFY6OQJ5Empep08moA+choUaA4vUmu
	 tgklpND/Sj0VSQjmleb2KqIlLo9o0kRI/rnHbCuN1q4x6V+OhObogZrgGHipIKmIjGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103148;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=uhwbWbwezQMKTneP5Rq7mAr3OzOECYlGrnFNDcwBY4k=;
	b=scE/AeJvuFe7CsQk88QC0CXcDpdDEyXrL1/0eH9Tkw+iMT1ndMO2FZnowENqxjy6Qqxc
	 XrSSV6hH7hPF0iVt4XvYGohwkP8P+YYPLpzfI6T4LLm/KjYjvcdxwyEYDWgxexRvbjWpj
	 4O4NbYeqgB/M8vAhSC0UEyOodyzVDF2sM+ZUZSoGpWr6Z93i8O5VcdHaxqx1323jruyQw
	 /hba8wrNtnrhLtY/vg9aXuyPM+RtlZEpt4+7/Q6TOsXHKhxr3wTu8ToJUe/cwshiMNDkr
	 FEDsffL9yO/r1ml1jxpEaI/Tfml0ZJlw9Nky2XqNiH5xT+ZFj46ziyVxO6t4HGVyfog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mz3hVslT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9F606A320;
	Thu, 19 Nov 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mz3hVslT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A011F000C4;
	Thu, 19 Nov 2026 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103147;
	bh=uhwbWbwezQMKTneP5Rq7mAr3OzOECYlGrnFNDcwBY4k=;
	h=Date:From:To:Cc:Subject;
	b=Mz3hVslTqsu+fqmTg8nI50cQsB2wkf6Qv2K9S9AEoSE1BOm/aV0JdIHR4LB5Mf5b+
	 9VIHuwtR1wneAaATA4XFECYp/179AtYqc0Msp5FOOIijDdiHVRuFaf6vnv4Eox912R
	 xQMjzJzkRzW4pvVeeev23GtYnQmXi//vVKR4kOGcqrirRu0g79o/VVDIxcTYnhQVBg
	 4/mYZlbVnVZXAYJtRXL6IN9NoJLIie2UvDPAWoFzk8XM+yQHU4emLCWgR/QpKG5vXm
	 xSG808MhZw0LMNR//arr7hrnJHeuth+VLHcwVdy8op3ii5plfCrT+0yMb0RqamkgaY
	 fmz6N0AELa5NA==
Date: Thu, 19 Nov 2026 15:45:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Dezhen Lu <dezhen.lu@student.uni-tuebingen.de>,
	Edward Srouji <edwards@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uri Dar <udar@nvidia.com>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Message-ID: <av8Zp9_kHuIN-wHt@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="A3LzIf6/YMNdIb3r"
Content-Disposition: inline


--A3LzIf6/YMNdIb3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/devx.c

between commit:

  b5c11bf975983 ("RDMA/mlx5: Fix DevX umem page size truncation for pages >=
=3D 4G")

=66rom the rdma-fixes tree and commit:

  bbd8ba74c5a37 ("RDMA/mlx5: Fix DEVX UMEM mailbox size truncation")

=66rom the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/hw/mlx5/devx.c
index 2277160d9a33b,5ba783bc7f9b7..0000000000000
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@@ -2333,7 -2337,9 +2337,9 @@@ static int devx_umem_reg_cmd_alloc(stru
  				   int access)
  {
  	unsigned long pgsz_bitmap;
 -	unsigned int page_size;
 +	unsigned long page_size;
+ 	size_t num_mtt;
+ 	size_t inlen;
  	__be64 *mtt;
  	void *umem;
  	int ret;

--A3LzIf6/YMNdIb3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/GaYACgkQJNaLcl1U
h9AKQgf8Dc29XsDzYzODAXh2othD7+haXtI7SaGZrHDZRznY1TbkI5B/s3TQEzbK
Gl+paZD4U0cZhkYrzJjL9o/yD0UYC1rot+4LUQK1sD7nD86JrCTqkKrnbsg3JdfS
l4g65oKW/dIsuL+K0a2N33O0/XNcfK4Uwlw8rX1mFvaaUJ5NOa+PFTAOgKboYwJh
xPZqvHNmCbwqnUaWbK4PBmDlPhsL7QRhE60u0V8qejGN65vsaNobN67vrYSaBGSu
QDVSTAOAw9e34Vt3BAEpdElqr3umjxm6lxzkFY7kOuNn0XLD6UERKPg8QJC6tcan
TdwPEle851TfbkIR922Fw3MHIDqlag==
=VxH5
-----END PGP SIGNATURE-----

--A3LzIf6/YMNdIb3r--
