Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7C3546C2
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015894; cv=none; b=bID6We88zvT1CU0jFCFXKYOBmwMxC+RLIGQGBPirt9C6i4ud3DyuhJZ3CGpAjzibUdRLB4ZQZewdqGq5hO/lNNfr4FJ8LG+LQNi1c22Hm2eYHBLFL2HAzIzo+YSb4EAGADfOzN4chU2mwP+WBJkej/ilqm9oVS47HViqwFrGHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015894; c=relaxed/simple;
	bh=AFQLFJn1e2NqQwmFiv2Cmh9x3gVKhEtm9mkje4P57OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNG9BZsdKGzU7GJ248i8mY7POdSrWt5zcdAMg/c9w9RXNuUtB8hkQYZQ9mI9wlL/iIqyGzzssBKIf7DWutWq+FISzE6j8v4WaLctw45qAeO2GlDml+Ya4yqfslQbkkwWnUvdkHq3+CsCjPihUP33wPSMPGX8p7F79/gTviMAYT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwRfP/Ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwRfP/Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5751F000E9;
	Thu,  2 Jul 2026 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015893;
	bh=lSfdqHAuDNr7cwVHn+Aaj9NeK/zJMgmpqShENtiI7cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mwRfP/Ci2Um82mXSO4gBO/5imkcLvSgmDyLcN3v0NAUBzmhkOYX7sPMce+/RJBUfX
	 RjsZCfNeaI3O/27YQMa2NmW3Axn6gRfgDTPTtLu7JWQ2vALqqlxC/0GUp9IRm5of3C
	 UHe4iCH2sLpv3uUrJuGOuKM9jrrEw+Vi1LckCUkENAqBvQPEFVZe1+yj2263ySGNeO
	 bYajxSr4bYbvsMqXOJK2et41NjYYIaPEl89FASNtB2TEXd2JoyKlxwi/R4zxb8cHCO
	 68mLfplhlIAjaYPbDnIwbBE5tYCOx+91nRjzdfOy96DiHyrd1LVxg+/0xVxkZNNkh1
	 JFugdz07YP6bw==
Date: Thu, 2 Jul 2026 19:11:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Re: Update i2c branches
Message-ID: <f18391a8-dd61-4e3a-85f7-14b3ca2b399c@sirena.org.uk>
References: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
 <117e594d-28b0-4bac-b245-66cf2ac6c0f7@sirena.org.uk>
 <akaWcTjDlww10fsR@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SxyzogDLq5r8TfT3"
Content-Disposition: inline
In-Reply-To: <akaWcTjDlww10fsR@zenone.zhora.eu>
X-Cookie: Reactor error - core dumped!


--SxyzogDLq5r8TfT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 06:50:42PM +0200, Andi Shyti wrote:

> > I'm not sure it is sensible for me to merge all three, if I pull both
> > i2c and i2c-next then I'll end up having to redo all the conflict
> > resolutions you've done in i2c-next.  Potentially I'll get conflicts due
> > to doing something slightly differently, or the additional stuff in
> > i2c-next only overlapping with conflict resolutions.  If i2c-next
> > contains i2c it seems more sensible to get i2c via that instead and
> > avoid the hassle?

> OK, sure, you can also only include i2c-next.

Great, I've updated to replace i2c-host with your i2c-next branch instead.

--SxyzogDLq5r8TfT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGqdEACgkQJNaLcl1U
h9BOjgf/a65pBZKME5u8ySYH36EY9sP+WpvV4E78mobKcICMPd8ELauOBa81VTgi
EN67LAw0h/1tqfoRNTjfWcPTBnA/xdhKvmUcNa3nG877aQ9uRdKxZ2/4Y/R1rbe3
8LADnz+Tzb/tcFAtVLUgFTDojtuhBYbm/wbip+KFQAzrnBAmcg0iPmIlz+/Lfv8l
MCXMmMd5zq85GZsddiLWBtEFfYWj67ybVQ3EOB9wMlf3vmHmtdt9NLAdVITBSRYL
UBhjsgOcGQ73WKDamzC2wnIkGh3NV/Ce9DQ627NAJ2Yj4BTwdzEvn/2rlR2uOAo9
r22LnHatOmNw+mtMD2JlacRFPzqGjA==
=pv6p
-----END PGP SIGNATURE-----

--SxyzogDLq5r8TfT3--
