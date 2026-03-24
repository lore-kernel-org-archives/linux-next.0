Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D03FA5E7;
	Tue, 24 Mar 2026 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358914; cv=none; b=NAo7uUeD2pL4Nus10oOPJGSobpfXHIz/GbLXXoEPxWZwA3LI2WS2WgcBC0rSo9QvJC420Y2u8Zm+AJ5lRBjq4OHvSNuAnJPKIFVosFFLcStaXEWy+FzGIyyihU1jhNN7UXAWT9O65QtYqR6EqP2LvzjwpBLGKMQHqXP3f8k/4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358914; c=relaxed/simple;
	bh=BzaD9G2vP+SwBRA0D64ob44lkRJhqzTci65PfyAOD9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NG9dRo3DMbe+4kRwTlUvCTmGEgb74GcVpAnl3+yH/sorVRmIDvzhL94oNoSxKggy75MFxuKTaF15P8VoCurPJxl8TaX2m9wSGkf9Y6fToWtL97WghdmaDj9656ZhGaJQc1Cxukks9gwcHW6Tz53ik1OzIPsd6Ljox3dfIm3Cnx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+44wwN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+44wwN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48707C19424;
	Tue, 24 Mar 2026 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358914;
	bh=BzaD9G2vP+SwBRA0D64ob44lkRJhqzTci65PfyAOD9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+44wwN8itPmHeUxVrsD7U2lZ8lu8t5WvsW7ZZ0kIhr0WmF9OFKqqJ+u3aLllXB3Q
	 cjicalgLd39fneB96UHRqItiJm/xlWJ7YlrImkivZH0rAbuD8Gm2vXHXHW4kRnACbc
	 3hwS7JqOrB8yZT0nUYi3fTtxup7RlDdyxwyE1mrIg+uOXMpHv0w1GzRvCuVazZGesI
	 Nx84JJH3jEAXX/mN0+q2aycP/UloTiLBQml9iwXcuNPBNYC+HIg/E9yNiQ51uLiZNG
	 m4yqC0SQToPbVQWPfFHPIW0RrzxKDz4+2K533srGPcgVMm9fU1STum2MHX8HIYZIjs
	 uHnYqMW34mCXQ==
Date: Tue, 24 Mar 2026 13:28:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <a9f82835-9caa-4ea1-b676-04bcb1a06a93@sirena.org.uk>
References: <abQKe58fc13oRFfB@sirena.org.uk>
 <0eb49c98-13cd-4ad9-87f3-7c7b0ace242c@sirena.org.uk>
 <20260323-empfunden-innovation-6caf40d8e6e5@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Un4gglqiyAzzkSEB"
Content-Disposition: inline
In-Reply-To: <20260323-empfunden-innovation-6caf40d8e6e5@brauner>
X-Cookie: Forest fires cause Smokey Bears.


--Un4gglqiyAzzkSEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 04:37:25PM +0100, Christian Brauner wrote:
> On Mon, Mar 23, 2026 at 01:56:59PM +0000, Mark Brown wrote:

> > This issue is still present in today's -next, the version of the
> > vfs-brauner tree being merged is currently that from next-20260312.

> Sorry about this. Fixed now by appended patch.

> Remove the local static wait_for_pid() definition from
> statmount_test_ns.c as it conflicts with the extern declaration in
> utils.h. The identical function is already provided by utils.c.

Thanks, that looks like it should do it - I didn't see an update to the
tree today though, did you forget to push or something?

--Un4gglqiyAzzkSEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCkX0ACgkQJNaLcl1U
h9BdUgf+Pe/SzHCp/MQq25GLL9Lki1ZgGGPySleY9PG7ibdSbPeBX2XVrSOMBVWg
z+S8Ydt5Hm/IEm7mLsNxMSM5OR7vtsytNOm4qbhipjDH53/C0kr5zTmmR+A1puXV
FfhA9AkT03gKY7QeQRP4PglrXaYurKOm6/R+w6qe8NDLQ/hT8msmDX+yLaBmb7bo
kzYc36YbjYHcLQZF/RPT/FBEYI4lFDVkyZMfm3zBXlNeLzvRSWZEsQD22Kb/X45n
NZqI7tw1a0qIcoh6sjOA+oHuFXTZ/X32bJmiQ8z7gVikN04MGnjOrGliRPA3KPBX
rY+EPNPfPB3uLQ+FqQiNAUFx3bGbuw==
=vhRq
-----END PGP SIGNATURE-----

--Un4gglqiyAzzkSEB--
