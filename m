Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335BA37472B;
	Mon,  2 Feb 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044249; cv=none; b=fFFiYk2UiMHy3ha45qizrMOEUNxWcokEq7mBkOcyT6GXkBUeBIGUqjaCLjSRfYXY0BTk7/sBbzjlTJjXR3goW9Q6bBL7Y1gJk8/55YEK9fEPgZZldj194mFKbvENZFXzQGMNM4f69GXdFJfhX/+YBPJl5A071nNy4xSCwXZqJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044249; c=relaxed/simple;
	bh=IucgTfEMtvDR762VyZjNuzv//w8VQYM387Z30zTAVhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUKOM/hdnOe0SvtXj0n7glc/1yoNPmlGtkSeMxVtmUTWGLxiJUDPJCLleo6ZM5oL87QJ77CAlUTpR5aiShZnAn26eOLriYXt/Z6LqflF5WXYx9qDYroMflcwJnU/kfODlYiNibUPjOApSci4ExmkehtMYodElE3k/o+1s6vc8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kunk+NbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kunk+NbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F275AC116C6;
	Mon,  2 Feb 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044248;
	bh=IucgTfEMtvDR762VyZjNuzv//w8VQYM387Z30zTAVhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kunk+NbCyvt6tJy/dAPoPkgHTwjlbauRF7jfuFyKhgOO2d4ff009eNY4G3HMT4d5v
	 7ivgJsFyQ36xPUpc/rbzjYqvkn6Jd7oMV6qLm5ig9q8PZVFur5rg7F1Gy3lQ/+xeRp
	 hL17sc6zzFoR4/sHkHB7ty+9GKDdpkGWH7UnrARBsEgvH9K+fXXsZ7uRLij7zFRHTI
	 CV4WVgnnIFjwwUJnNVPWZsU7xsVuThIbO1lEQf9ZFzJgI/uFy2SY1OKr5tsaD8C4cw
	 Fc6NxyBCDq1ZyrwaLykMQJ1b8Ul/+LV7bkzB0GltVKDpYWIIJGGXgEwrcC5rycKQNA
	 kJiE+geHO8RTw==
Date: Mon, 2 Feb 2026 14:57:25 +0000
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <541681ab-07f7-49ce-bb74-c3e52b71b659@sirena.org.uk>
References: <aXtXw3_wMDnrrOxW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJpP6pEc9ZjplqTf"
Content-Disposition: inline
In-Reply-To: <aXtXw3_wMDnrrOxW@sirena.org.uk>
X-Cookie: Bedfellows make strange politicians.


--rJpP6pEc9ZjplqTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 12:51:15PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the btrfs-fixes tree, today's linux-next build
> (arm64 defconfig) failed like this:

This issue is still present in today's -next.

--rJpP6pEc9ZjplqTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAu1QACgkQJNaLcl1U
h9CR/gf/ah3XzxJcX6UuUjYwU8nEZVLubLp+XXLVibb3xyTybYqmHZL7vQeuJel6
naIt8Sa9FRKig8E7wX/pXGCllXcITxWCHI3hw7YeRLvjID1aPrLZYQKe/FFlTkxi
C1FrR31kK8QkEFzTlYqjrXddOJvsA7XVsoAQj6DQR3oQFQ/SJU++uumVymFktfXO
hnsVtMMZaNAgqVEiRqHlILri0lXMD+fEk411lSC0qbKhZMDrsE1ZCi4EZE/Gedeo
JP9d8Bx1MJaM/XUrcSfRArsl2BQiFx+PZ/xXbEXg04KRn4hyJatlgsAdQStZfGMY
1h2sphN0xOpFYBGspaduB5T5Qy9E9g==
=0VYs
-----END PGP SIGNATURE-----

--rJpP6pEc9ZjplqTf--
