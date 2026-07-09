Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A504229C9;
	Thu,  9 Jul 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600431; cv=none; b=gxur1IYTVPT9nsdxdl8CXRbqiKSJGQ3+cmefTxYnc+m/RVo7HoiC9WojlcOx/M7/f+4SHRu4IYmqje3L27R97gAZ4JZl77wd/TL2HT0ZtMOBCQHp7j9FqIfPMiOQMfiGto1/hFML3VF+oiaKxPA5lljmGnte2MbHYz9783NdHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600431; c=relaxed/simple;
	bh=lpe5Y1gfhYhcyzoAW0A3UZ3YbuMS35t0jeG+RQ0Lacw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qf9+G7pyrbWmLY8BhSQcEya+DUuIwefjSaht0Ab0GSOgRvM83WkQTGNv5blj6VlbrbiQ35/jNw89fHhXJ1QYLtzPBPjPlKkgu3DVjfL41pluwWbdrW0W6KxHuMOw0iCBXPW+mdgL4C/ONcHnJQuqjSBPXJ2J/IsTzlifu7ajgo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wyb6fr+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wyb6fr+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852A81F000E9;
	Thu,  9 Jul 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600429;
	bh=VxCyzKYt+2p3S+jwZw/Xoev9w+MftLxRp12EmyoN6qg=;
	h=Date:From:To:Cc:Subject;
	b=Wyb6fr+0pCxMUPXahLueym4g6s3cML7pvQLcuhdpnJKxBrORwnE2Vp1Z7fL4swA3V
	 ASEoocmKX2BCUatvHAGHq1begAG8KDEY1lXuiFCChp07RPuN9qqSAjK4PNi6GfnC8+
	 z67n2bevu+XyqfUdfIhTgRjHZhadPGSKDl/hH37hHRlQQHOgqlaIC9fHnyEG+UMK+B
	 vJT+kceqvc7xToyrUGhBkdGic7Ce32BrsNvJKJxoY4f7DqJy2v3z/XSfzoNbZlHPZL
	 mOsMhnNQIz5ICWTO8xYziHTYykdhBFqtM+kGWpwbQ4+/i6IRXjsCk8k6Xb1+jiihEf
	 M9mf7ILVhKgdw==
Date: Thu, 9 Jul 2026 13:33:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-misc tree
Message-ID: <ak-VKufd0zg0F8AD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bH6rGYeBd6bmCszn"
Content-Disposition: inline


--bH6rGYeBd6bmCszn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--bH6rGYeBd6bmCszn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlSkACgkQJNaLcl1U
h9AKgwf/RNYiEzszQGfZYdb3GELo4yuwD1Al49eAnwIfZAipRVTgJ/1jqVvHJ+WL
IGvU7NFMNysq4atFQBJLm0O/CIb0uIOXwYpm0Xxe9t3C0/jTgCYPsvZm8Xdd3+Bl
2YzytulHikVL1rZzufMIALPRSpjWBQor7w07hPRGvFC99kZ3LB0USzcw6BWNfYjU
p5sFxU7osiPF8YESyt2W6sl6zfh+FcHx61PeuQZ4AlKu41Lu2+eBjFToVIXHAVoQ
+zN6+3hWXnnoaQAoc/1sLNrfoTyXwpoFdjuHsJt3lczZNbRfN5ZJMl3WlSzhoA5T
dRiuFf1W05o9v/LJRhoLBOd0IAr/Lw==
=wWw7
-----END PGP SIGNATURE-----

--bH6rGYeBd6bmCszn--
