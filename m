Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90C1D45E8;
	Mon, 23 Mar 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272295; cv=none; b=JR6EwrJh+4rWM9pfEkqM18gyh3EiMKPGKPprk2CPVHcEs68D9uYR3XHrX5A3tyjDKUX6cWlvMm3D/jcjJGUiWujW5MHmpYPhXKxAU005RVOOWxqA3OoOSvHRpqrdIj4gJ+vPecbcl+88PNOtVM1aa0w7iTmEuIyRfmLOw/iJsuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272295; c=relaxed/simple;
	bh=tWVtfM5He6UH5hgC+zdjN2Mw1nyRFJH2iOzNEBxcXTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F75GV9RChDI3yxJiKc/p3cC/k2KzZzduFh2ChlRAVmLfIPx0ZUPiRzc96FyeZcb437VlitZgo/ZXyZFoPQa6vs9+woogfWEGuDiJnDFPZ4copwKIb0zrMRhDUNWLXgW38j3XIniXYC09edohmCAIpxpC7/TClQcQMKg/77eQzVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn547S7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn547S7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA40FC4CEF7;
	Mon, 23 Mar 2026 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272295;
	bh=tWVtfM5He6UH5hgC+zdjN2Mw1nyRFJH2iOzNEBxcXTk=;
	h=Date:From:To:Cc:Subject:From;
	b=Zn547S7onihezgI1Hh5a2wgfHOvaWV2QzZEKAOF9lVCfCHYpzZSD3hGp0wh7EHp1d
	 j2VVMPVdklUHPDBk5XaycbC87cfcMcCux7z2vkat+Grm4fzRvBroq5VQFVoxbvbHwh
	 b2HI4W5FgJNgxfRy4vj1L97dmO4vb8i6OWuudyxLvnZxEY8DEd1pPs3d/+9pTBliyz
	 Oh4nM0aYpjyTI6xHI9gXavdh4DtZw1+GNXlgHk7kASj1rBfiT/whsdNifT33IHIYem
	 QSXOu0o0cELPATWAV24uDw3dYWjpsePutvFrUj3rndxJqOkKz1UL80Qn46Ws5X+SMW
	 441EMnV5e8RtQ==
Date: Mon, 23 Mar 2026 13:24:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the smack tree
Message-ID: <acE_JCjbGv9vBi0n@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QDBTT+Hg/vBJPxVz"
Content-Disposition: inline


--QDBTT+Hg/vBJPxVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  be3b23ba4a030 ("Smack: Fix error in capability bypass")

Fixes tag

  Fixes: 61df7b8282 ("lsm: fixup the inode xattr capability handling")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--QDBTT+Hg/vBJPxVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBPyMACgkQJNaLcl1U
h9CmQwf/Ty4kGpwHOvMcwavLE77ivjVvNFDTUR5cqErwn2I1WV+GdxOMsU4EEzu3
6i4OBGTRYNSvVzgjdBkcmLRJMsKh7+BKuGFN63+vhvVO+D3DA6S/XCzHdKT323Mg
ZU0AMgSM0927bh7uFywZkUzLyMgM+lKKafunKZ02bB1cmgJedPZdZbp4IXf4JppX
+9mUzmzoDlJm5XIEHYsCOGD72Ukd1BzWO0GFYnc3PYiC8oyd4GKur+v2MmIx0UhX
66QJv+K20aRwtO79FW/8iN8mJC8E7fp1/Yqtf/94c6EwwDnVxDliHHCiWIzY1s6z
0Gz+bOlZMncOux0bkTwAxajJQa9eSQ==
=MH9Y
-----END PGP SIGNATURE-----

--QDBTT+Hg/vBJPxVz--
