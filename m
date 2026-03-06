Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07EE367F25;
	Fri,  6 Mar 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798258; cv=none; b=QSZhuh4Xhq+Lz3T9Wd1Qt1qa4/ucJj3JmW215oqBPiXhXAyudkKssy84h4AsTlVugSJjLr0HdO1fFMDZfRkJ3hUfYBhFsRAjxs/VR8XILsUHQHu3099b7T9gKqrojvGVyUDTtNS74x8wWYdRaIhcoiBh58kUGFoenUbDG5Yuc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798258; c=relaxed/simple;
	bh=H5aZ8j1jxTNhfjAV1HtWAv4r+6pr2v5zDHDu4iBrH4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgWsBJBaNw/JbDB4M1jHKU9hHGHoFaewOS+SlvpHQMPVQfDrkCbNZs2p74zindHPRyGl1Mj+Lj2g61ywKXdHh0QtHk5+61Ept1Mfz8qORNSdTSXHXmyY55/Pg0pLehlbNVpgRtB2QK2a1reS9HZ2Wv5NR3KvywEUlbmnKkevi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf/9so7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf/9so7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0F7C4CEF7;
	Fri,  6 Mar 2026 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798258;
	bh=H5aZ8j1jxTNhfjAV1HtWAv4r+6pr2v5zDHDu4iBrH4E=;
	h=Date:From:To:Cc:Subject:From;
	b=uf/9so7zXxJ2BUppG+u3nqTnRpNvfC+5Vmsn1fi4UVUSBwcpcuDejYu3qKNLH6mO1
	 H3XFjmLN/+pMyM/u80X/kANF7nXyTnddCND8ztXda+1VeeL8G+Hfqlzy7hEjYgn2aW
	 8HLC+ezwz20ezvFBzM2xUlLx4d29cj5E2UvSHIKLOuASd67w7EEvlBkZNKghKa+iCY
	 LzsbvjHRwwoanx5na4dEi/OA87yIx1rI9H3+NTTKWkDiX0YmClxPuoCKad+nu07WZV
	 9XZ8YW5a7GZSWt6rZcjRQMeyK5xd0uHbizDobxn7QSzD7eQpXuEsOpLAhJxCtbkgaT
	 ztqJMn7yg+mdw==
Date: Fri, 6 Mar 2026 11:57:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the block tree
Message-ID: <aarBLtrZxtWizE_f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnyG3vtQ5j61W3tt"
Content-Disposition: inline


--bnyG3vtQ5j61W3tt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  4f2ea80dc6c44 ("fixup! treewide: fix remaining read/write iterator conversion issues")

is missing a Signed-off-by from its committer

--bnyG3vtQ5j61W3tt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwS4ACgkQJNaLcl1U
h9AWQgf/fec6e+2CQLpRBX/NLMF02W3ZlNeyXFPeWDxjbJS+LK+n2SDoS0fVCB0b
aa8KnXcjyDYvgAxP+/CVKew8UqpJng54H1XT7H8NdyL9h5n+qbIn9vIjX9CKGlFb
2q5AB06o36mAcEQsEFjJl3GfYP6Q2VnCYJGAkwYzFK11W0KKze/RtA6jRU/NGb08
MFCDUtaspkI0rbUEf3eb1M5WRW7AMDbiVFW47PS1K5DCzGB9DqSUKrMCw0jTeqIU
HKoX7a0wQHMnvpWy5cva3cxxam7hYx+jY/cCpeJftuLR1KQXLSDt0/IQWv0qwv6V
SnQu5jtAxzZ7JVQReD9T6S8CdNZgvw==
=XoM3
-----END PGP SIGNATURE-----

--bnyG3vtQ5j61W3tt--
