Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2323AB87;
	Mon, 18 May 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120677; cv=none; b=b8fSPrqndjoYYn2faRscyrd9sHgZ7Fw/GUfCuLf4gTxwMLbiH7JgzVh3oF2BVd2RRVvQ5A1fH/mqSOs/Rg2Y0mTyR3Oho6xUHK4075yvTrnVo+oks+OUsek2Qpe7icih9aso9wJvJC/G2RDWfdHR8ENQaXqTN0ktXh+2wY2Yr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120677; c=relaxed/simple;
	bh=ywtDQQl5QqfiQ34o/2xMw4/89wLWFPrpza6RHwryN3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHCSa1r3J5/FgCQ0Irh94HYj2mDJVVSrmqKgIRl7zX42mevJpr8sFipjVmw7mIJj1R4uGzuTdpHC0Lc6ddCaByy/SrMiiLkPGPVkygkJ0hYB5ZWP6WEWBHhzRETYshWXoHfN0B0oKcNa1ilhJ36aVA6nsuO8KML5TuBWhePgrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEyDPSo2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEyDPSo2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB146C2BCB7;
	Mon, 18 May 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120676;
	bh=ywtDQQl5QqfiQ34o/2xMw4/89wLWFPrpza6RHwryN3A=;
	h=Date:From:To:Cc:Subject:From;
	b=mEyDPSo2ujHnpU3RC3DROB6SrKZXWLFVgNZ9baeX8jYsqhKlK9kHU+CmYqHKmE5et
	 LH3mq9oIJtDaUi9OlF6oB2oLjfRo7u8cnsBsEis5hUij6LUQxBeb51l+xcaFP0un8t
	 OH/mgV5NRAO/2S7dcSrXlVbptaA4Db5JskxhonwtSP/c0ucB59TKp3uWORkFY3JAVY
	 7VFoh7Oj1Fz2HDFSJPLZY0D+RZOCwsLtiht0dRtoccgLFC1SKiaJWEclpcK2qwHg/h
	 P8pbZiO62Lk+YTMR4I5/7WAzzYl/R3XVkfPmDYUquQGHXMLNmAgjGryBhhHe99yZqK
	 v6YeIV4Lq3A1A==
Date: Mon, 18 May 2026 17:11:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final buil
Message-ID: <ags6IM0qGAkndEV5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PTR8nXDGbXQAI61G"
Content-Disposition: inline


--PTR8nXDGbXQAI61G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

During the final builds today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

/tmp/next/build/mm/hugetlb.c: In function 'hugetlb_unshare_pmds':
/tmp/next/build/mm/hugetlb.c:7282:17: error: implicit declaration of function '__huge_pmd_unshare'; did you mean 'huge_pmd_unshare'? [-Wimplicit-function-declaration]
 7282 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
      |                 ^~~~~~~~~~~~~~~~~~
      |                 huge_pmd_unshare
make[4]: *** [/tmp/next/build/scripts/Makefile.build:289

Caused by commit

  2bb8fe16f7bf4 (mm/hugetlb: avoid false positive lockdep assertion)

I have reverted this commit for today.

--PTR8nXDGbXQAI61G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLOh8ACgkQJNaLcl1U
h9DW5gf+IKoWZWT89DN5kVNIDIatGK1SDJhfk4Ej4AXN8Btg2otWCmVPL3/gCmnW
RRA7Dy1l5Q7LJ/litpN683l3BptdqnAJUia9fIDqP0JE7WNTpdYMzJ/7I2x4XGDL
+68vwNyuf8anAgD1dnaSkbMOdewIFzrX8NMculf8dnqZ0vt2EOK9TYapDvSaxr1k
mqjqHmLV0cmrO9xzHq+CztGKxbKZQIKi51JdaQc08ykO5GyCMWaya2CQDSe7kR4n
IOsbsFamUefCI1s+ndLE31Vt9L8ZwVuDkoR/HapDurRvPMcIclqrECT9S4zuxcLU
qEeUH9vtIVb2ikFlbs2pN62hHGL6QA==
=yX2H
-----END PGP SIGNATURE-----

--PTR8nXDGbXQAI61G--
