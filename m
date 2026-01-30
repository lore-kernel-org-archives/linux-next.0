Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB488329371;
	Fri, 30 Jan 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788031; cv=none; b=PxJvxAX1uyXhvUbnexOmJsJtjPHXsjmkVRxA+54sRMk+GmVgNCZSIXVtwhYKHWDcv/HnnYo3ZyGNHUKRDf4LX4k/2PAXmNiLyXTo7WN/C8m9y9etWS1yGJrqBrH6+S4A0KH365nNhQq3nf4HTU5v4qHD3KHsRoB0OFz58M3okTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788031; c=relaxed/simple;
	bh=x4QH1+2gRPrsxh8lUu1LGgD3a8l4lYhWeTKVCJrCpQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9Q7h/SIJr8gqGxdzbsGTTDoUCLepqeQ/ucU+4Kl6xGliwqBo6eIaF01nFVsEXjC+oufqrl5t2jIK9Yg739r6kh1ci5tqtE2nRd70KAtgJO+xHGFCj6BgkxRmY/htgR/NMGQ6LgsDeMKdM0w/yWChVWulxwu9El+mOYG8Zqfw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmUD6aR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmUD6aR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3E0C4CEF7;
	Fri, 30 Jan 2026 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769788031;
	bh=x4QH1+2gRPrsxh8lUu1LGgD3a8l4lYhWeTKVCJrCpQQ=;
	h=Date:From:To:Cc:Subject:From;
	b=fmUD6aR1MOwtfUD6P2wjjLkpWEzQEuCY9YS/B9CXwiznVw6c5EStWZvH+bDgKp3Mt
	 6gXqEIPlpd52DgBSa7I/pU21wycG5nCFevDPBCjkvQ4nG1A6Ojz/6TFXnJUrwQXBUy
	 0eLgTeHaenz6IrLrDAzQda8jULy1p3xmfXzzoU3uJxCjyO0hzWxqGYCCN8wpNtJIAv
	 OilK8c9+jvLWC3AtngNiYiHyhs6cBObHuBHHGXQSyOSzb7LG9fH3PDwU7e4ae2Az2t
	 6bswTPTofRWw+z6EUAdC/PnyYlZTa0CUdevcEv8Q0VpnszMN7mE7fvpU76c4u7IeTO
	 gcR63um1XWVFg==
Date: Fri, 30 Jan 2026 15:47:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>,
	Bernhard Frauendienst <kernel@nospam.obeliks.de>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mtd tree
Message-ID: <aXzSe9_CZr7x8Qqg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0WzW3JgZwpxrx/A"
Content-Disposition: inline


--M0WzW3JgZwpxrx/A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mtd tree, today's linux-next build (arm64 defconfig)
failed like this:

ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: drivers/mtd/mtdcore.o: in function `cleanup_mtd':
/tmp/next/build/drivers/mtd/mtdcore.c:2641:(.exit.text+0x18): undefined reference to `mtd_virt_concat_destroy_joins'
ld: /tmp/next/build/drivers/mtd/mtdcore.c:2642:(.exit.text+0x1c): undefined reference to `mtd_virt_concat_destroy_items'

Caused by commit

  285871f1ff3c2 (mtd: Add driver for concatenating devices)

I have used the version from next-20260129 instead.

--M0WzW3JgZwpxrx/A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml80noACgkQJNaLcl1U
h9A4Cgf/RuRlg6Uw3sEXHZi7aOw03H3sjR3zQvBZmUq5E1v2+gMBjeuqeOSVYkDq
4yf/UewCoJfPNWNDOQNgJAc7z9C6OkCTOTunNpFLqO8yDH8ITJh9BEnaqiO8etgt
N0vxVjjtPNt7qJMKzlCfEy9D1Tk/mf61448Dh3rID8Hrr6qlJRcLxA17kAWGrOat
GefEpzW4Kn/A2O2K70ZyEYQhaXjiEq7d+D4YrK+RWyDlPh0ZeBbC+irxzClFcXFr
RzjS6xT3JzeUqGGPHOJ3qHCjXfpXYN6xqA2uFw3Vt2tW2A1nhQIZbWcTfOx1Dz8s
EIUUkbZlQwauiYcM/N2HFkO1K3AkBw==
=slpL
-----END PGP SIGNATURE-----

--M0WzW3JgZwpxrx/A--
