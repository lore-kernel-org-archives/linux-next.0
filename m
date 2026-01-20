Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E2423A97;
	Tue, 20 Jan 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912339; cv=none; b=MQK3xqLdozksycDMhxvyb8dqb/SOkFVaqRQjLWyLG9mr96odAPfmOz9S5+1hJDjg+tCncXmldQpAEffU5ECyPEt/fvYAWupkxnv8IWGlCoZVc5y3jPEI3C6mlym0cE2lwf2j66+J4ecgmsMfPCFF74NV168388/KVVrflnDGAkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912339; c=relaxed/simple;
	bh=epkOERHzlgC8BLR+eFm3ljRU4tpyH6Pa2TXh1yLD/v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mx1v6hpefXwC2LrEI07oYxtc3v+7dxbRQLw0swTYn6yVDQa6GRDEBmrlE4fsbwpJJig8lS7rpooXfMTzBvYbvO4aLxoGBrOrS2I6Ot1mmFc+oor5hmPNpbEWaSQYQ63uLa7j46u+s1iFAyusvPKt7HLlZPa5VPShXqqOv79Ve4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTtSyx5S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTtSyx5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DC2C16AAE;
	Tue, 20 Jan 2026 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912339;
	bh=epkOERHzlgC8BLR+eFm3ljRU4tpyH6Pa2TXh1yLD/v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTtSyx5ST9WEKFWwlN1oTGDtGm+QjQpxOnJdwRfb7UR3aBee3WjHTZ9GWJ9Gy3x6g
	 P9jhxbXEGl+rJmxabR4ejRo8syhMp9Bds9jEzBFjYZOt1SYM0gMoOmj9CVYtpnsIXT
	 r+kCNGNEOC2tIwd7u3bhLqJndZHTXzsSSHf1SHxyzFOLZYSzluHpZ6Zkv0ziu2Y8LM
	 tghKFljVu5mHwltcCjOxodwrJUuOMw3IhOZy9H+eTktGAtCX7pO+u+FABTbkfoxacw
	 QFx3uY74gQhqelYxhLq+7qssV5WGeOcdf+KlzQVhsCW3IuhGOaBeQtKeuwtqPgy+8u
	 fT/i3zaahUyWA==
Date: Tue, 20 Jan 2026 12:32:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: David Sterba <dsterba@suse.cz>, Boris Burkov <boris@bur.io>,
	WenRuo Qu <wqu@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <07476afd-45b0-4b08-a6db-e5c72f128594@sirena.org.uk>
References: <aW9wHq0fs8KpLCyj@sirena.org.uk>
 <3a4b638a-f527-4d02-87ec-054ecb84ea0f@wdc.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A4GotBm/TMjE/fse"
Content-Disposition: inline
In-Reply-To: <3a4b638a-f527-4d02-87ec-054ecb84ea0f@wdc.com>
X-Cookie: Slippery when wet.


--A4GotBm/TMjE/fse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 12:22:37PM +0000, Johannes Thumshirn wrote:
> On 1/20/26 1:08 PM, Mark Brown wrote:

> > /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: error: 'path' undeclared (first use in this function)
> >   1765 |         BTRFS_PATH_AUTO_RELEASE(path);
> >        |                                 ^~~~

> This got introduced by

> a08c5941d3ae ("btrfs: add mount time auto fix for orphan fst entries")

> and 'BTRFS_PATH_AUTO_RELEASE()' got introduced by:

> 675af3c0fbd8 ("btrfs: introduce BTRFS_PATH_AUTO_RELEASE() helper")

> which might be missing in for-next or btrfs-fixes?

It's in for-next but not in btrfs-fixes.

--A4GotBm/TMjE/fse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvdc4ACgkQJNaLcl1U
h9DChQf/ca7OAbbcCvwxFgOne5ge3VJTczdqCU16sbhtyKHwpucRqyhuWcJYzCvC
ECvtqQnOtekKt40Hzr1vZMEOOvTbAqnBbjBkliIVRNdp5rdy+x9K72lRKCy3p6QV
OAu/hsY5J25Du4rkQ0ne+tmQzdUbRpRZrXtB4pPDlPxnW2SdTZdShCmaf1WNllCB
0kVkd7q5bvw/Saica3dIk9St7hPm4F5I5VZ7Wkhaotr5q9wgXb/qR23c1z6r9TPd
QSZWxnszIdNFjivWTsoqdTq6s/qUkfxZxfe6Ql36ERjXXwTqwQ0pSFJR42HHDO8j
QSx/OsYFfWiJNrC40vuIXektQjh5rQ==
=Qng5
-----END PGP SIGNATURE-----

--A4GotBm/TMjE/fse--
