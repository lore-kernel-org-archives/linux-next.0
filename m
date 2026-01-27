Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DC21772A;
	Tue, 27 Jan 2026 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523470; cv=none; b=WJROc+gMQ0JZC2nhrkXKSRgvHJBE7+0gco6dcuJ49spBX4h3C0VjaPePFcLbd0nDdRjcYBuoaQ2HQRBLkhl+pJkxHaDB1E0yk6bv7hLgag7KTzaPOXIg+J89OhXAmE7MrqEP2OM9o8jsJFrty9xNyfYNtKwrEat+U7GrE0rby6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523470; c=relaxed/simple;
	bh=Wej2MOWpAG+SIElNaf3Kl2Rp9CHikAlyCHOcfjpccbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3BCqXTUuW1Q7Tqx2fb4VQYhc7vE8RkkZqAi/gZEsLGa2FfkqSox3aaKfpZ+xYJFQ8kd6m0knc2cl3EDiwUV0vIC+p0paKZBt5WZHbZuM8kaiF2nIHWQAU10ixnEb+XEPxbuwQzmSZXEQOqlQq180Dr4igaLJ+AplQt3Oq43XvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfZPBDvj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfZPBDvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14A2C116C6;
	Tue, 27 Jan 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769523470;
	bh=Wej2MOWpAG+SIElNaf3Kl2Rp9CHikAlyCHOcfjpccbw=;
	h=Date:From:To:Cc:Subject:From;
	b=nfZPBDvjTmcOwjqRY/NDCZdNunfbJ5hvnoAutYLRgdimdA4VmR9cWcvIIA9ek08Ih
	 OTLAdPOTr/ZKtfoT8Zwhas1Nc45J61N3t7LWviAogl4IZk23kZQULkv+VGK4+Lxm0F
	 Kj3G1VUsA5qj7y7ISLMOD3MakIaBWhQx++K4LMIL6CgHORmppnrlWF3U0DM6kP3Nv5
	 zHwAMao3QG/mEKtODiHnQcn2wQBIi0/ha23X+CJgRTfKQtQA53jOa0HpqjkwhjDY8x
	 EwhV6wpf86wUGh4j63cXAgi0PSI99msOT5Qc1ZWKx2VqJzj7wq2Dn9ToLF6B14ndXW
	 OQE5BSCm9pcUg==
Date: Tue, 27 Jan 2026 14:17:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>
Subject: linux-next: manual merge of the drm tree with the mm-unstable tree
Message-ID: <aXjJCmDiKFYA0-P6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MgnZV3muts1xuYCF"
Content-Disposition: inline


--MgnZV3muts1xuYCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_process.c

between commit:

  8635c94737032 ("drm/amd: kill the outdated "Only the pthreads threading m=
odel is supported" checks")

=66rom the mm-unstable tree and commit:

  d59e9d2d556ad ("amdkfd: process pointer of a HIQ should be NULL")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f8ef18a3aa71d,ba25d83c23e78..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c

--MgnZV3muts1xuYCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4yQkACgkQJNaLcl1U
h9BdxAf9HizhRgpOuFZEcZVOt/JDkla+mvNH2QT0ALavkbXjAdtjHHe91j5W6vHu
sOaO1ObsoXNjPEv8REPQNwYvigCUgEM+oihFjxw3KisU3rBrnx19e1unEaMGEVDx
XWCE+n+vDUF5+YOEXPef0d4sW/i9nqYMmqYEybzrnir/QQGTlpr8ZFHseZW5pa5p
uOXdsAgtV3vZevXx4Pn5dfPy6r2vK5crlw0PAF4U6nFidgMaqMpNHFDeWBqnP5Fw
MnyvIuWAC4XMEKxvB6aTQNb0+epOytySQmXjq8SZQm3jyCCBbaKxtM68USFcalsA
yhDfuuuNrYvv2szeHBRIjCDIiuIw9Q==
=npR3
-----END PGP SIGNATURE-----

--MgnZV3muts1xuYCF--
