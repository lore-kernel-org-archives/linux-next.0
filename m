Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A9F27E04C;
	Mon,  9 Mar 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056771; cv=none; b=Bd0uoNqhm3ivd6+Pb1M0HbNysbjJunjMlN9IhmVNNol+4n5xI5HJE3VF7qm0xlHreO56FDyWW6S8JcrlgGlTw8XtlThdg6P0Sbln33/exWMH8/pwkPK12KSeOF8ztJL3u1xZJqZ4/flmdQeHsinlwV6SWAe5uv72F+snNpMPr6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056771; c=relaxed/simple;
	bh=k6AbgNuOtQPC7mfAFPRxmdmhHWkwIHMGnTEAriwUtZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6L2aEk04BdykompX1d/3tF6dgZ4OCmZFw1FUzRChKSn458YjhKoamcHsKhsRhpHxH0knGoha4dw3HEB5ZPsBNJiHn0TlB2wVJgEr7chteWx31wJXgg654TCZ03AjUNNU1Hwe5clDbi7biaUzOBtyjCsGb1hQdRorGhmzL0YzPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKLt+Uwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKLt+Uwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0E9C4CEF7;
	Mon,  9 Mar 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773056771;
	bh=k6AbgNuOtQPC7mfAFPRxmdmhHWkwIHMGnTEAriwUtZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKLt+Uwr9twXXqfUKEFcqv8qTjJ3mQK0PtPtq1z8fGGXGDZLwkrK6o0kMXz8P3mXO
	 forcemTeF9egZj2+QrK/Nx7UrQg/JbUzF9Ss1hyxjfNWTwNBnbSNHGllZtiyfuie0Y
	 eVgrt3MfYDWDhfJHb7jtTh8q85+O63JDSrBRS7JJmt7Ko+E4o1QbSak/NKW403LD0t
	 tyt9oVig524Rbk5ZIgpK9cFMc7A9JMhLnZhBOIDNlVY50aFxHZw08mj1SLCWzWUxUZ
	 5nfjl9dJf3rIfWEe9noC1LZVmyiUJY+IywVkkgIJS8CuQrW3cf4+mliJqkLD//gDm7
	 SB1jRfbqj3+aA==
Date: Mon, 9 Mar 2026 11:46:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <f41b2391-d202-4d2b-96d0-4f9040003a35@sirena.org.uk>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
 <20260309114020.GU12611@unreal>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mj0xTKKf/EOWkOhI"
Content-Disposition: inline
In-Reply-To: <20260309114020.GU12611@unreal>
X-Cookie: I don't understand you anymore.


--Mj0xTKKf/EOWkOhI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 01:40:20PM +0200, Leon Romanovsky wrote:
> On Mon, Mar 09, 2026 at 11:10:34AM +0000, Mark Brown wrote:

> >   eb15cffa15201 ("RDMA/bnxt_re: Support application specific CQs")

> =E2=9E=9C  kernel git:(wip/leon-for-next) git show eb15cffa15201
> commit eb15cffa15201bd53d1ac296645aa2bc5f726841 (rdma/for-next, rdma/HEAD)
> Author: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
> Date:   Mon Mar 2 16:30:36 2026 +0530

but also, more relevantly:

  Commit:     Leon Romanovsky <leon@kernel.org>
  CommitDate: Sun Mar 8 06:20:25 2026 -0400

>     RDMA/bnxt_re: Support application specific CQs
>=20
> <...>
>=20
>     Link: https://patch.msgid.link/r/20260302110036.36387-7-sriharsha.bas=
avapatna@broadcom.com
>     Signed-off-by: Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.=
com>
>     Reviewed-by: Selvin Xavier <selvin.xavier@broadcom.com>
>     Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

> <...>

> > are missing a Signed-off-by from their committers

> Signed-off-by exists.

No, I see signoffs from Sriharsha and Jason but not you and it's you who
actually did the commit (see above, git show --pretty=3Dfuller).  Did you
by any chance rebase a branch where you'd pulled something from Jason
(or which Jason had pushed to)?

--Mj0xTKKf/EOWkOhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmusv4ACgkQJNaLcl1U
h9A4Wgf7B0jF4ry/EZQyZIyuLBvORWh+eyX413eSlbz7YWhpaDk1PwIACGYyWVGm
nwxgHgxZCUS1pLCJeEXrKnFVvGmn8JlmW1lHCLmx99wOhkSj7rKGa3V3RlBSNYvn
GjwD1RDGIVI4IFQXZLanRFFueSRISsBHPvQglb3GGbhPI30Bts964mRIaUCMeKCt
ZV5Vfc4t+C8JBP+1bl43+l9yKCVdccjjRwKRtge1m6sqCBNFc7o6ZiQ70VTQrcME
cnvUpTgvMUfXIDrT1iume9hnC4yX6ihvywt111bUrIAbqGmNo8YXvOvvR9WsWJJ8
hInYGaxHTGwew3EKBkhlryxRjAQd3g==
=LOr0
-----END PGP SIGNATURE-----

--Mj0xTKKf/EOWkOhI--
