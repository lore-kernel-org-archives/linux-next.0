Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54E421F06;
	Fri, 27 Feb 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772200851; cv=none; b=lY870yKX9hXEqVb6zyPeC5/Kk5z+7CuqDnPzB7TEfwnfiIIuYa4Pde9sc3UOhGeiwQT/g1nCwFrHLeBOGgOwzo08ORrz7UALUDXDw5LATY9ItPOBT6MFDVkYF8pSAVnDoz8m7KZ6JdJF0gmoJaTEtQewxfgvvM256XSm8lgnskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772200851; c=relaxed/simple;
	bh=oSodLCJFdvbZqAQz8kOiQlqanJHWkMYKjUUhvzjwWz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMHHs+/fs/KD7UQCOzyDOau9SwaoVO6SP+TOHoM7u3COOh3vzGQGwV2xb+d01WEY+NT5gOnSSPXQ4dal/EThuHr++MUMY29xhV273MO0tagHKPKsCsix+WiPqEl70p5tvT6NbBKn65GGMrVCiNeoCByy1IAHMTc393tG8ibFHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdNVqKY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdNVqKY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12917C19425;
	Fri, 27 Feb 2026 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200851;
	bh=oSodLCJFdvbZqAQz8kOiQlqanJHWkMYKjUUhvzjwWz8=;
	h=Date:From:To:Cc:Subject:From;
	b=KdNVqKY88cRNysTKJPDlw4Py+RBwSj5xbGeHLHBCiYOALQv66xwqE7FUZ/meYbeBd
	 wtLbcpr93+kkj2FGA3j39rAwjqaGe6w1tW1vXGCoBv92UwqkbOWQaLyikQTUNWbIAV
	 ZqEROO3lDna/m3auV7jw8WCRqxha3ayam/6+nnWihX/TxzG5AW72TMvi51q08/S7kU
	 gZKfjFKs8eASLMlvnGeDkqykdtBYJyZFrx7joLwkgRuFRRyop3opDJf1XM8qPfDnMV
	 +EqNbQqwoh6paFsX+b/UyfBviwX09PJWXx+BjqzSWkqZKo3Yg/YYzELtedKIjHw0F/
	 KUND1Y3W1OhOA==
Date: Fri, 27 Feb 2026 14:00:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <aaGjj5oDM-IvP49x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0GRb65ZMW50GbIL7"
Content-Disposition: inline


--0GRb65ZMW50GbIL7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

between commit:

  64ac7c09fc449 ("drm/amdgpu: add upper bound check on user inputs in wait =
ioctl")

=66rom the drm-fixes tree and commits:

  fcec012c66424 ("drm/amdgpu: add upper bound check on user inputs in wait =
ioctl")
  4ca06f6fb45da ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_us=
erq_signal_ioctl")
  2de9353e193fd ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_us=
erq_wait_ioctl")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 7e9cf1868cc9f,844c2db35e4a1..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

--0GRb65ZMW50GbIL7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmho44ACgkQJNaLcl1U
h9CfQAf+JfJvi96KDaaglLF85B1B2A7xeWrQODQLsVlKpvac36kuZ8XmklL6i1Fa
b/XxpxWT0cyim7UpTgdgWs6hNEWRCcMA6LtFx9r0APJmHAyAUUJ17Fjb9f9IZ+3N
CgJ7k4FE2D/MpO1e0z7INAdsewFSxlnXWm9YXn2v+P5WoWdIeojpCIaTC4JLiqv4
Jg8wnCd7FP7IDZIZJNloCLrU7cZm2EL1KQ9L2J9F3Dcdy37fONor4x6qzPix8WZu
ShJKcEPlwG3WXbAhMQCbV4BZnlnEs1Ycn0PzAOjuGzZNFcFIVgvbm09KUH53B7R+
Zp/Id/BA7Bbl4JzpXjsyBHlKskJg/g==
=6QgM
-----END PGP SIGNATURE-----

--0GRb65ZMW50GbIL7--
