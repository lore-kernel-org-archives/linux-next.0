Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230830FC1F
	for <linux-next@vger.kernel.org>; Fri, 17 Apr 2026 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776424795; cv=none; b=gF3d4s688OflZAgnaFavOlHCP7PQ/wdMNS7h8V2kjE7wAo+aLduJPvqIb5IOIGMvAbP2ZOedQ8TCXC32grE34oI67dixxKVicKULnMaQ1KH/Mrt7nQu9YMmO2flyXBAfpzTrdPovL9HEh/U/lz7Y4AqxBZ4jUbY4Nb59Gh0savQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776424795; c=relaxed/simple;
	bh=8yg97ndsfTjcKRi0VXU/DVki/iULSyHOfii7SMdhVNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGnbtS1ufRFkKjYhsT2LGIeOSPQ3OLb6g8naaKx0iFtNagDpOVBMqAAPn2VXDQm52bCvb4xmbfRTH9opDfLIJTQpkHcjbefc0aQ0MQHbqNPCUUsdDtzA8LZReB91f7u002aYRWhx9eHzg4Cg+V5zDFhEgK0J8Whkg48Bco0quhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIVa8iFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIVa8iFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04488C19425;
	Fri, 17 Apr 2026 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776424794;
	bh=8yg97ndsfTjcKRi0VXU/DVki/iULSyHOfii7SMdhVNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIVa8iFSsRWYF+5k9SwfXvzWkBj0NKOuFcf+vH6VKe8qL4WGkXOUSJ2o7/pB628dt
	 4qP/Orc2XZgTEI4uKLLi2Hiscac8GxpHhv1T9gJeSIeyuEHqnyWQZiUVcz1/Q+olLG
	 DKsbqWDQ+m7NpMlrxAGfhPvY4ROT1Jb3j4//mT6KkGKu5NEizKn85bKsMZ71FQLYHR
	 /0DT3mkUQ0pje/HR53VElG1wMbjaXeyPb8Yvyqh5ZxCEzhwzndllR9SxgCDlWCDnPk
	 40N2TZqUUDMobxydxib/x1zCIBKhkzsd5tr5iOnXUga1hoxQbJdzXLq2wur6WXVr1Y
	 M/3ZpbsDqT6uA==
Date: Fri, 17 Apr 2026 12:19:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Adding clang-fixes tree to -next
Message-ID: <e243a21a-8507-4bb5-b236-e2dd326672b4@sirena.org.uk>
References: <20260416232211.GA97229@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p+zekC2zYvbFlVxj"
Content-Disposition: inline
In-Reply-To: <20260416232211.GA97229@ax162>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--p+zekC2zYvbFlVxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 04:22:11PM -0700, Nathan Chancellor wrote:

> Could you please add

>   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git clang-fixes-for-next

> to -next? It will typically include build fixes for clang targeting the
> current development cycle but may occasionally include things for the
> next merge window, depending on size and timing.

> If there are any issues or questions, please let me know.

I've added this from today.  Given pending-fixes it might make sense to
have two branches, one for the current merge window and one for the next
merge window.  An additional branch costs basically nothing if it's
empty.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--p+zekC2zYvbFlVxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniF1YACgkQJNaLcl1U
h9AV0Af9HqmP5IVY90I1VnlBEcKP+uvSib4Rnthyg/oUIEbuilqBg8NhLLIgEAy0
NzUAVec1p++3A3ilVL43cSOxsIxnLFWnNK3Qb9H5zDlaS8bIf9s6rrREI/Y1CMSW
eGSdUvcvHIbx1clryk4J9Mcs1d1g75NyjkDdMrgJctkmsBCxWNLiaktbLaRpttfG
zwxiLNMtdMBAzNTvkwFLWF5wo+qwZUeTcA1SKSrcInSADXxS1NtRO+hIP32ROi0t
7wq5YADLPMxin/IJjMgva1av8Tvp96xe+HWvoCZv5L7CMSohLeTv723Zl21M3T+j
MclljRr3po6Q+kZxEwcYk6b+sufpEQ==
=jlKm
-----END PGP SIGNATURE-----

--p+zekC2zYvbFlVxj--
