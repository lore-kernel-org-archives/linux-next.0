Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3B231832;
	Sun, 26 Jul 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785101650; cv=none; b=dl5XMSGNnjvLRH2iSjz2C6jcq80js6Hj7Jy3/+30E6jxkyR1L8Q9eKyVUoxBr+oWuGpODLJMUpTqCRnjaxaqDLC59EVK+tEjKFKarZpuDuSVhXLKpNsNsmIB0GdkbtOzaNNsf5MdI8cIBr0/u2dgsP+okhl0unkxP3Ce5w6FVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785101650; c=relaxed/simple;
	bh=n4+UfHsuAKKryJy+mW3v9w/o0vyyqzDCyPz++13qyow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkiGTguAzLLWT7U6a6jSBOr8HprI9zXjWfXJ8QrvPYE2rwFiLsJ4VnglEXwe1MkT1g3SmEyAm0Lcg+OxWJS0Kj7QqfWYgxgdM+npPTRUMtSVk68TYl4VILM4QD8/TJpkfe2kPqYGuyS9akxpgmi9fvBJTDMupmI9TSoWJegmwIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZ+5RIpK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZ+5RIpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACED1F00A3D;
	Sun, 26 Jul 2026 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785101648;
	bh=8KUCJ0ZzM0QD8and2zjInhdJw2vg9OweUb6/pJLo9mk=;
	h=Date:From:To:Cc:Subject;
	b=HZ+5RIpKyG1iMWd0xRiqkj4MdIKfocsPRPgU7eDZ9Sx8JKnuMJ7gnD66CloBSVK/e
	 mFuduSyg2MX8dYrKEGpSrKLqTnTd2akX/CG5+a9KptxeH0+7Ibu1lzYyqfZtAk1hvH
	 gpnfgxAo5Zge0zr2gmr3kCJKtPy1QVGFZ+UC3/sFD6ZkF3FltSjIIhkC9cdfksYTzj
	 AmJM/l39iUQuJErMN/k4nSGXaG5xNQq37szMxURN3x/6k7amDTXJYaIHieTLQ1C/ZR
	 uiIHFT+6BBDbCqxj0az1zVGxWy/BiHAOXILV7DYhYjO3iqNIiW2IcVBPB07B54E5nF
	 3AJJoNqG4pxJA==
Date: Sun, 26 Jul 2026 22:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the liveupdate tree
Message-ID: <amZ9TMnWRcvjlsOH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0iEmTSaLamtcbaNV"
Content-Disposition: inline


--0iEmTSaLamtcbaNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the liveupdate-fixes tree as a different
commit (but the same patch):

  05cf3d87a0bf2 ("liveupdate: reject nonzero reserved value for SESSION_FINISH")
  36882f3392395 ("liveupdate: Reference count outgoing FLB data")
  5c4a03afcb217 ("liveupdate: Remember FLB retrieve() status")
  797fe91e50d69 ("kho: align kho_scratch to MAX_ORDER_NR_PAGES pages")


--0iEmTSaLamtcbaNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmfUsACgkQJNaLcl1U
h9A2kQf+N3SUZ+XsC7LE5dptdvb+YROhq+nrZGE07R9b4xF+vACRxAPNGHCHbdMZ
yjlxICkbsT4rEQSQZPmMwK7kFAq9czFRPNy+w5cZMRBpsyMc9JQtmuRyoAmSh47V
9EBnidWESZewPK14h26iN+vqsl5WN67keQUu/mJpjBRIbUmb34QHRNWvVleMEHQd
4RhY25EznRSklDszN9u9EH1j3MHyq/gQEs5lBIBrcfE+1ifUCMn+FwmV7IAR9xfR
2r7gj3n5JmUKFLApSJjnM+ut0zWhoOMkgC9WalRhg0XKtKdqkmDGmeo1ceNFqNvM
lxF4MesSIqA24Bum5k6eL7nKVUlRuQ==
=3z8H
-----END PGP SIGNATURE-----

--0iEmTSaLamtcbaNV--
