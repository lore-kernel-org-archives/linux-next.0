Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B07335562;
	Fri, 17 Jul 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295048; cv=none; b=OHzFxZ8uHUrFZrgGjA+hvqdS/ZTWfFDC4QygH9ejQi8wgBNWFSizIBgRcRXIXG/FRyrigLcVneoWMfZxyJdAK1n9v45vTZoEbX/ms/ljZhgdl0xlq3HmPeh0xg5w+o0+GVerH+fWVicqnkY3Y3s8TATlQafmc5uOQlE7S7zaXwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295048; c=relaxed/simple;
	bh=CGTv7ei3Vh1bs9ZkJ3NsHsqbbDFveVOvq2yAlRfcLSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSvKYCpYSfj/s+VCpF3GjjNHo3z/YJTP+PisnbuQaGBfAAt3yXSJGlBu2Mm6GaIHS93Omf4NxiA6+khekwHYpvX5HpRzgb7xxSirgCqeMJe7rUaG71pTSSTKch8ZKy/MpDhZqTOmo0vnEORj5fa2JTB1DasYayg+VHyaoRl0KvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5VQsbix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5VQsbix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BD61F000E9;
	Fri, 17 Jul 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295047;
	bh=7Tsm3hpo5hHlIZ+af1QXLvQU8K0c+DZaaEtqVcnWEBc=;
	h=Date:From:To:Cc:Subject;
	b=m5VQsbixKFf5yx/OlgD3Iv2aM5BdFJNIAqMlGA8jE3UdgeU8YYqyxblBPL0HgJkSI
	 QrjpghO26howb+xSfnXKRVkCb06C7MKvN/zPAxAAI02ob1+cDoEPLmgqE1cyQTmIQX
	 8Rf6H0u6nRl0C39o8On27Ai1ykPHrsZV3dU/LbM/fTgbKz1aNLIQsBwCeMva5Wj6Qe
	 Dh/SPR8tdHCBJebg5N9FQiYNTpP0KRQQqYOk+As+v3XN3kzgGrYQFa1mbX0hcQpv10
	 lPeYy1a0QQOm1Gym4cGaYFL7rGqyRtLGvuGPZjnwzrp3JnWTLqXEPvwQ+xslGU/YgF
	 lDiOCS6Mc66KA==
Date: Fri, 17 Jul 2026 14:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drm-fixes tree
Message-ID: <aloug6sR_dZqRqkX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8mp/SNMY+Ae6Jj4E"
Content-Disposition: inline


--8mp/SNMY+Ae6Jj4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  c9ab9622f5b27 ("Revert "drm/amd/display: Restore 5s vbl offdelay for NV3x+ DGPUs"")
  d73f4e118dc4c ("drm/amd/display: check GRPH_FLIP status before sending event")
  d094bc1f17783 ("drm/amd/display: consolidate DCN vblank/flip handling onto vupdate_no_lock")
  2979ff0595f84 ("drm/amdgpu: fix bo->pin leaking in amdgpu_bo_create_reserved")
  cee666427f280 ("drm/amdgpu/userq: fix indefinite fence wait during GPU reset")
  57cf172be2827 ("drm/amd/display: fix dcn42b det allocation order")
  bdd22e186a959 ("drm/amd/display: fix dcn42 det allocation order")

are missing a Signed-off-by from their committers

--8mp/SNMY+Ae6Jj4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLoIACgkQJNaLcl1U
h9Ay2gf+Ko2K0RalcgllZDq/Ezhl7OU7Yyl7TzucQc6snNuucMEnrAhR5SAdRCt8
DG6UN+j5s/5g57d9HNBWc/2m3thYhP05p17OAJ6fFFS3Y6vcwOzJ28K0UIpcKOE7
YBmRZMSqABFOiR6cJnHR9pkPUhs121W5BlQQ9bzokpqtraSmDRgBbF0+ng7e4YjC
5T7jx7AjiLDlVlhJ2yIE+bYKZEd7zT0+sYQR5dH60jD6WqlgTVxXnCLIvRzyBPtK
o4g8JlYl5ambDaXU1e2dDOgoIG/BG0+1BrszwgRUVD7Qb11FgmsgD8V/jifMjLsj
Yqx60oB1wkHrW7qxZt06SQpOBaGoeQ==
=c7ie
-----END PGP SIGNATURE-----

--8mp/SNMY+Ae6Jj4E--
