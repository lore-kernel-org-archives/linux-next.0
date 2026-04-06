Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B02F28E3;
	Mon,  6 Apr 2026 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492930; cv=none; b=U442M/zVOtS8PM+S1rkQiSCNOvf31QFcwJLWz8vgDZfiIPqM+rJ6pwZRkrN/Adqd5LL1x0gGtgJYOmHWblnH1Zz9dLKN+fRzwM8DPrWoapdgA4/ycY1t6Q8yfSYRuCaNf94FStUmsa4DuCSGEsPB8aut9AXyTm1a0A/1VSlTSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492930; c=relaxed/simple;
	bh=ugWQaBlvTl2V5vUc52zZKDlcyUIKylJOWFHImVKQ42E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KH8HS8wywVLUH+z1a6REBHULCyKexajQudXCxRCUiswhO7pybbOUlWoj69mZR/305OKjBc/K9UqovzU0vxM4MZcacl2pFhOXVwWS0kDc1OyxIuL7gk2R8pf9sdmLt/PAOfZ7McoBaoSAOwopcLV6qLkTu5F7O61eCmkGmgoO83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We2bmYBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We2bmYBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254F4C4CEF7;
	Mon,  6 Apr 2026 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775492930;
	bh=ugWQaBlvTl2V5vUc52zZKDlcyUIKylJOWFHImVKQ42E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We2bmYBuCOh9kpNLabhg0ZURj9IBfVMWtNcTmTt90J7SrpxbmhZC7GnxK7iNF8n2M
	 GRoNOwfq8vVI0vm83SpQMg4Utng/SAKwMIIBN7PbpA3IV6oZlW2o3GcRZqEU9K6rfB
	 A2Tvnit193bREbJ8hE2SMc2RjLl4YuwCR2ogqLcgkBAZWlXWp9q2/ADCiY8h4fmaMJ
	 Nv+RjVHYwicRrQKQJMmHFeGFgJpIgBalD/JPLukmrP/VNwhhoXmQHG4WIJGfddJl/a
	 66QPA2bjX2tbTs2pyIXHWb/Z2mMrLqQ4h60HpQstSlG/6t4fokszQrz+9J8XzaN5DB
	 3VTx+nFUCwzpA==
Date: Mon, 6 Apr 2026 17:28:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <d6fd197f-cdab-4ded-87f2-754c501c2c02@sirena.org.uk>
References: <aarBm-e3NUl9XnY8@sirena.org.uk>
 <aee116cb-6335-47e0-8634-2ad208f4fcd5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5QyMY+FUbc0MRRK"
Content-Disposition: inline
In-Reply-To: <aee116cb-6335-47e0-8634-2ad208f4fcd5@sirena.org.uk>
X-Cookie: One FISHWICH coming up!!


--b5QyMY+FUbc0MRRK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:11:41PM +0100, Mark Brown wrote:
> On Fri, Mar 06, 2026 at 11:59:23AM +0000, Mark Brown wrote:
> > Commits
> >=20
> >   390045a24591a ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapa=
li CDSP")
> >   0af8802175d2d ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapa=
li ADSP")
> >=20
> > are missing a Signed-off-by from their committers

> This issue is still present today.

And today.

--b5QyMY+FUbc0MRRK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT3z0ACgkQJNaLcl1U
h9DMVgf6An5lQfzf/7riZccbAc1EmcIqMXZAj/htaCzDgPRMCjdIXdGwdUyvrvZD
TXMDwwExHNFzNgfFMcTvahO//iLg0poeYN7I2lVcpWgdiXtFgQaOjAJX2eZposG3
mevZj2aLgWpCThSRZi2RV8LzR0yN4RI+WW/G4cDo1p+pHlb2mEIcXPOeo4SWH5fE
EB2RWfWEGdG2aBzulwHexRQx7c1VSX7T6yWQ2DqiSnCGuxPFgPOWbQquEAxI8VGO
Q+xLo6x7vID5DVzDLlqIC3KTXHmn5tvNWBbJeuRJ1GeusnvmGk7oUzCBhjAujodh
Qbjgt+lbevDtVK6jhYMj3KBHOI/p5w==
=gpv3
-----END PGP SIGNATURE-----

--b5QyMY+FUbc0MRRK--
