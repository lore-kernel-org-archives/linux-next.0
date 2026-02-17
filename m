Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492D36AB7A;
	Tue, 17 Feb 2026 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338240; cv=none; b=X4/0J8D+FTJN7/C00NkRyCTuIzG4wUDXQJQALDcRW3DqbKkPmLXy7Waqlvethm1cf9DKmtXI6+/RNXSYNZ/mBzloW/NJdo0ZFCvdxBHyylBcCWBtCe9Jn9W0c4Q4jEeypZ9vnu16l0L6bqMHVx7ZEfrf6mqC7eB5tDtiwHAHUmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338240; c=relaxed/simple;
	bh=SSLQPz96Hs7wezPOswuv2lh94n8DhOrJpnDjld/DNbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSt1FpPbaui2rWFAmqqx0/gaU2+topnxeH5Wuc7ADwo4bTL7ErtKW7gDQmxB8eQ6VVXDJk7+4ilEGWlUKB+RdHGwMgiLMgtLdMS1yrsoBOR6MMr/5U0oASgCUJe1tmc+KS5rtkhltDFboJtI7r99xQ4RCdoHHwrkNTog6CT4VLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoH1ll6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoH1ll6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546CC4CEF7;
	Tue, 17 Feb 2026 14:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771338239;
	bh=SSLQPz96Hs7wezPOswuv2lh94n8DhOrJpnDjld/DNbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoH1ll6A3U34DWI2jhqTRgJDLbsvFFmqPRrufbpCWIk9+2Kxzuj07dTj7yUFUf7KG
	 jKnDCHCUsw55OAt/l+kBSc5SKrN8wkhvWi8Agz+QdG1o5B1vSuvgGFI4h5KFiHxbvF
	 UYh01Aq4xRBqNJQLrxXtJ+ilSzsQeztzNyHPi223pVwnL0O+TM6fVjD4IOhGED0veR
	 q+HUkYAa0xv2CFCPT6WsonmSE3p574/G9O0YioJF2tfeATndHA9J3Rj2taYaO38v1+
	 tpbCJeqqZE49QMQOc8ttm7IKwiWzfRbdrZDSYUXeQ/9jnpi3cam0EFXXmv0NUr4n4m
	 ul51/rVmqjkPw==
Date: Tue, 17 Feb 2026 14:23:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next inclusion request : ntfs filesystem
Message-ID: <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQNFeSlXIEsSJp4A"
Content-Disposition: inline
In-Reply-To: <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk>
X-Cookie: Information is the inverse of entropy.


--qQNFeSlXIEsSJp4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 04:05:42PM +0000, Mark Brown wrote:
> On Sun, Feb 15, 2026 at 03:02:34PM +0900, Namjae Jeon wrote:
>=20
> > Could you please add ntfs -ntfs-next tree to linux-next ?
>=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-=
next
>=20
> I've done this, with you as the contact - let me know if you want to add
> anyone else.  It should start appearing tomorrow, though I note that it
> is the middle of the merge window so if it were going to go to Linus
> this time around it should really have already been there already.  If
> you want to also add a separate fixes branch let me know about that too.

This is breaking at least an arm multi_v7_defconfig in conjunction with
things already in -next:

/tmp/next/build/fs/ntfs/file.c: In function 'ntfs_file_mmap_prepare':
/tmp/next/build/fs/ntfs/file.c:657:19: error: 'struct vm_area_desc' has no =
member named 'vm_flags'; did you mean 'vma_flags'?
  657 |         if (desc->vm_flags & VM_WRITE) {
      |                   ^~~~~~~~
      |                   vma_flags

so I'll drop it for now, I'll try again after -rc1 (next week).

--qQNFeSlXIEsSJp4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUefsACgkQJNaLcl1U
h9CxMAf/TvTfjA4nQTc175sS2noBnQeCdh/y92fVq4oxWKPjvH3NckWtQu7UwvL8
XLbQHVQxphtQQLh9+loQX7mds5dLg24+S/xPpi4TAbO9jX11apJuJAWE7hpHVS3l
L2SjYHfPPfcU/i0lHQ9iNPIWKLzq7giJxgWnR8Uq9ZsSSBRKN1ZNY28iybcpFo6r
Bd/iDkr1fztmOUjQdIOw5NyBDQbEEQMne+mJXZrQh3UJ/xyWn4/r1MiDDGc4UYDd
xaarZtS2G80OlsedsAyTx4nuaOlZNaHaJWXQredIT/aStXlTTagXrIiKTfq8aDWf
cN0J8pGcf2McNyC8RGNxbYoBZZgQAw==
=ZL72
-----END PGP SIGNATURE-----

--qQNFeSlXIEsSJp4A--
