Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A303A1E9E;
	Mon, 30 Mar 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858287; cv=none; b=swVcubA6p/93yELrnqPxlC2w1jobjitvDM2FmJU1c5BCURLEidzIAMae4r6Kr/2jsz5cEjwkmTqjfounGuWTWyJRa9BfOvennrSXQHmnkKPXexxYj2SDO3NHFJEWH2/gRfSGrWiV1MzTw/EcbSM3ggdnwnlu3io1Qw3OjH86KtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858287; c=relaxed/simple;
	bh=FxU3BzdU1Yd+vw5pB6zrVobeJeXNX9eeDPDfmbR5WZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkAtSt35rJFIhxB/qLmo4lSirSaKwhXBACi4riqoRm3ZEikoQk0CZPSVkI3OTqeEn+yWKwz5VqgPLXbccNeF20lKQ7OHNJN5xpzg8fK1fI1R09vDXgXtaRcUTK4kfC0cM3FEulhndforaw/ZknSdZcSD9QTaW76VuhblP60LE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaI1ENst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaI1ENst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D34C4CEF7;
	Mon, 30 Mar 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774858286;
	bh=FxU3BzdU1Yd+vw5pB6zrVobeJeXNX9eeDPDfmbR5WZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gaI1ENstfyuSXngRaENSpeK4Bo5czHOCIGnNdx5l+2C2rG3nJNvOyHX+5xC6pMoeK
	 L8ZvYEjPQ/d6m5/aZex6UpzSsdlXgwAoLljLYHP0Wjm1WVGkIQ7BixGnt9AxO5sytE
	 kBsmLipUaM6tn7U52oSEigaaqTMybUyhZdIX+Ml6hPV7vznPPCL1O3opJ6ANtjak3i
	 A8Ryx+zqWJuuecuXBzhpq+MnNIaS+x4HXz1G5EPRyY95pxHuiWgb2HofO+08dyXWZM
	 YtuXbB1nnwTcCf/gGaD/Pn3Ce3o3xA8nnc5jWPw7TL89xf753ay/NHEEKqsv6n4rdm
	 OV1d9Y067b2Dw==
Date: Mon, 30 Mar 2026 10:11:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Albert Esteve <aesteve@redhat.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20260330-petite-gifted-wildebeest-ff150a@houat>
References: <CGME20260327200715eucas1p1953ce4c0b4d4e0cd95844f0acdb7ac3a@eucas1p1.samsung.com>
 <acbjaDJ1a-YQC64d@sirena.co.uk>
 <9f63a789-79b6-46fe-8177-b08e1ec120f9@samsung.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mdnd254ui5mvsqd2"
Content-Disposition: inline
In-Reply-To: <9f63a789-79b6-46fe-8177-b08e1ec120f9@samsung.com>


--mdnd254ui5mvsqd2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
MIME-Version: 1.0

Hi Mark, Marek,

On Mon, Mar 30, 2026 at 09:56:30AM +0200, Marek Szyprowski wrote:
> On 27.03.2026 21:07, Mark Brown wrote:
> > After merging the dma-mapping tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > x86_64-linux-gnu-ld: vmlinux.o: in function `dma_contiguous_reserve':
> > (.init.text+0xbf3bb): undefined reference to `dma_heap_cma_register_hea=
p'
> >
> > Caused by commit
> >
> >   3a236f6a5cf2da (dma: contiguous: Turn heap registration logic around)
> >
> > I have used the version from next-20260326 instead.
>=20
> Thanks for the information. I've dropped that commit from dma-mapping-for=
-next.

I'm not sure how it ended up that way, but I have a fix queued up. It
should just remove a bunch of loose ends that were left with the
original patch.

I'm waiting for allmodconfig to finish and I'll send it.

Sorry,
Maxime

--mdnd254ui5mvsqd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacowKwAKCRAnX84Zoj2+
dofsAX0Xr3OoVOePrt9b+2B+ZRuI4gMCn+XAxW067yhaEZvvcajXRZv7/adq1Akz
U3hHxNABf2YNlDVBcK+bqKUa1FHuvOAlD6ofx0TWxNd+/hHGGfVU310F95+Db3Rn
LnJZYcJ0lA==
=Wekb
-----END PGP SIGNATURE-----

--mdnd254ui5mvsqd2--
