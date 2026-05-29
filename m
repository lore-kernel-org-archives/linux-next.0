Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA51ABED9;
	Fri, 29 May 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055367; cv=none; b=nGFHhKVnJRuVDMaExHMXwLrcAfCon0UzC7IsLD7O8rOLhJG66VowWkmLaeKKAKAHwLlI6LjriqBcAISuemUc8I3cSFrDpNA/7KDASL2Ofndw7GoqxqCYLyd+vbjVpIeHXAtMaLfKvRd8cpVOjxLdHR4v+rp0tmMCfssppX7KFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055367; c=relaxed/simple;
	bh=3w4m5qS4P0OZi+fsmVolqelN7io0zlv5DKZaSmM1Z1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCabAfkzJWTFWi6DxoOG9pFsiNsX7DIqJA0CjD8xHFRThxARR1zLAaB/6RHcJfgAYHKMcgNGDSPH7xeNJQv0QcDgPRPwhflqCW1ZsE4Ck4F/tGscYww1/n7zaoriVvEzOu+zguikzTakhimzXBUb1OcXby4tE89LCX/kEgofIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhyESZzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhyESZzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA3A1F00893;
	Fri, 29 May 2026 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055366;
	bh=vctOi1QDa7UPflUd8rmWF7IqfOIqGABBvP7IndesWn8=;
	h=Date:From:To:Cc:Subject;
	b=fhyESZzM0XMNLz4Ac94jA5B8FEM6og9FJtrsZonEZwuZhKbV11RMfoWaDg2VFLuBC
	 mjqDSx56f1scyX4EnJiThKbMmvjzBxsQsI6qRAy1HtxWODxvgK+VtHDlCMUr31Zuxp
	 N+FPtcKSpnIy24Fs+0SXkZsw4pe1Ecz2iK4ICXTcRzBY6Q2AlEFIok8G3jE/3ZwuSn
	 5jyqL+iHFxUJ9jtpCQ1An2N0YiEKokw56eVh/rKKQD5HkdZ3JTinsTYQI0Kzce/Myp
	 wFOrKWICElXNSlJGlc28Bv63AqxHOLMxn8YRPUZlYshHqzM8ehtgAzZh9SJo6fQjwg
	 kAAmgHR1KX3Zw==
Date: Fri, 29 May 2026 12:49:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ntfs3 tree
Message-ID: <ahl9QtsR38b4FuXO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+op8YlkodVRxyeK"
Content-Disposition: inline


--3+op8YlkodVRxyeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6b6fbad790ef1 ("ntfs3: Allocate iomap inline_data using alloc_page")

Fixes tag

  Fixes: 099ef9a ("fs/ntfs3: implement iomap-based file operations")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--3+op8YlkodVRxyeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZfUEACgkQJNaLcl1U
h9DlMAf/fzFgB4pdDcmZd4d5vB/FGIPYZjHDNR2IjgdtO/F9kTddj1MFPAUz+kQj
4hFyl8cGZrz2aUCzhenTfMGPlP81UjGn6+T1jV9isDMHl1a7e9AI3sOxtvJX3jrt
/rzAJy23iYPjfAWatbyKuixTPmxRpcfY6Rfv7z068GDoNi71OYjqX5mZY6VBo2p6
ZNMmU6IHQQ2sGK/rI0i6hjwIaPU/2RUVg0c2htzJwjs0u6m3VEk5/H2Yk6WySK4t
SfCBeUjkFyTOrHleuYOfunphjRmlEo6itQqzr1wPfdl/pSruaH7o1bCOBf2lV8Xz
8SBw0GXbSbTIe+BLKSck2ehDzYwCVA==
=ZnZA
-----END PGP SIGNATURE-----

--3+op8YlkodVRxyeK--
