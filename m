Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792241;
	b=EAXpMtfXvBg40lpDtNnpxTpGaGTM9CisS+3oYdkVKDmoJK6mQectK8Vk6s/7ycqhrDpi
	 YYp6psjqxVGuW/lvTBXNlvp+hkVqRYs0tUE5/6kYrLHxmTUxwjr5ZfTCe0bZWQLzkNP16
	 nq1YDuyQRNFX21nBJlbED8HTHvuF8GqX98HkRRMhfP3/HrqYEmCYkxZvyOtRw9Cq1rrYs
	 OkN2F2xBfeOgQ8MlBu4+5HxiVIC3U+rAFLaEK0Q4ylRaT71F+OXafHcRMwqknx/n6GH9b
	 QdrHxjUrfvwvQYw/4PJtQAymgwLEqKdJTtPqy2bOcljvPL98UOnNf+ldWMkMLAbWPuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792241;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=2opRClWIpnaCnIbsDa2oUR72bk4FL14QgBJPVF4gaGU=;
	b=kOk1oLbdaFUkZsPJgYTVd725hwhYHsMRcuBC2zpsabyAd50TfECPMBYnNGNe0s2qGy/D
	 2i/tSb8WzWpixQreMbmDuptWeA+7aKtSKdqyYuNM0taxlv/ynW9CmtmWIIDFlemMcPN9t
	 fjY0MUSHlKu0D97EG40mozTuRYteAEcxbZUAPfiQXybeXpx3DM6+wkLDlf7FpexO+DIRo
	 yIwmRMSrSyfjhNdnv8iaFWYSez+m0XY59Dg3kvD8s/rlfCtCfDVr77QrJBaL21RJH0I7X
	 gBPhLIl92T+8VDiOPUFCZqfX1zGc1qsQ6MQGH5MXz5Pd2ALB4LtfCYSnqyq/3/s6ong==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgNDK+Ib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11311606A31E;
	Fri, 27 Nov 2026 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgNDK+Ib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241CD1F008A0;
	Fri, 27 Nov 2026 15:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792240;
	bh=2opRClWIpnaCnIbsDa2oUR72bk4FL14QgBJPVF4gaGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fgNDK+IblV5PtRJTf+ADCZOsoCvkcH6e5y3sZVYhLKFbVMNvBBSag9EIFx/g7h0GR
	 H52uegR3VcIeHuEKfvTCDE4hTXox2ABCBWqlbj85DCIBsL0awyKiEeJCTY7LNpfZCV
	 rbp86+CvzW0jF0JxSfmDmL5wQPmsVqnCL28tFQmpgYXNc1CbCGirUAQYnjj3WaSRoM
	 PEDx1krHKElq4CwR9d4gnRvb6rN0PpJM71FP3w+1ib/zCmAwkwLa6sZLPWMJe4PCZv
	 Z8moDSv0V0GJ+grqMYH4e78Vp2dBYuX0AaQFA2HhhaBz410U7H6cfG/3G7SDXxheIS
	 0tYK6mw8dAMNQ==
Date: Fri, 27 Nov 2026 15:10:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: linux-next: manual merge of the leds-lj tree with the origin tree
Message-ID: <c05653b5-c8bd-46ca-aaf5-281e8d74f1e6@sirena.org.uk>
References: <awBqIVPvQaRJN-bU@sirena.org.uk>
 <20261127132946.GT38590@joneslee-macbookpro.roam.internal>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JnnO/Klbq6BKFJDY"
Content-Disposition: inline
In-Reply-To: <20261127132946.GT38590@joneslee-macbookpro.roam.internal>
X-Cookie: Sank heaven for leetle curls.


--JnnO/Klbq6BKFJDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2026 at 01:29:46PM +0000, Lee Jones wrote:
> On Fri, 20 Nov 2026, Mark Brown wrote:

> >  +	leds = devm_kzalloc_objs(dev, *leds, num_leds);
> > - 	if (!leds) {
> > - 		ret = -ENOMEM;
> > - 		goto put_device;
> > - 	}
> > + 	leds = devm_kcalloc(dev, num_leds, sizeof(*leds), GFP_KERNEL);

> Doesn't this now reallocate leds?

Looks like it.  It'll go away if you merge up Linus' tree and stop
getting these noisy commits, or if you send me a patch I can apply it as
a fixup.

--JnnO/Klbq6BKFJDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJnWsACgkQJNaLcl1U
h9Br1gf+J6HyoMjYTgXOXJzESahjjuFE2SQi5QoNWNSoN4AD0cCiXcSHQ2CQi7hR
8otD2BRrJ4yVkCfovXcV3LNUqvX+wRHVSKRnP3+OZqISYg29cwsnqkYg2a3x5vLG
oY8JLfU32QEbrV6mRIondoPTDRVibbWwub2zRPH0HS20HaAPnXKCJFF2z7cdsLH2
8HL8AHc4afTv9ktsd9hO0AmHfN5PzfSQ9cps6gRJbXLvSc0jOfim8NzLWqJdktr4
IzZR2btJhNDITm7SYrt7Su05p6ayKtmRRssswRCT7dLNdqcQZSrcMvA98III7EqF
imAj+hmaETKPPjFHhixtkjIl0WJGBg==
=vPxB
-----END PGP SIGNATURE-----

--JnnO/Klbq6BKFJDY--
