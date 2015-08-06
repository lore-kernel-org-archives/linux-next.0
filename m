From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150806 build: 2 failures 52 warnings (next-20150806)
Date: Thu, 6 Aug 2015 18:19:58 +0100
Message-ID: <20150806171958.GZ20873@sirena.org.uk>
References: <E1ZNIul-0007IF-Ev@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7uy9XegIstZRHI/L"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59619 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755163AbbHFRUK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2015 13:20:10 -0400
Content-Disposition: inline
In-Reply-To: <E1ZNIul-0007IF-Ev@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, jilai wang <jilaiw@codeaurora.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org


--7uy9XegIstZRHI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2015 at 12:00:47PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ERROR: "qcom_scm_hdcp_req" [drivers/gpu/drm/msm/msm.ko] undefined!
> ERROR: "qcom_scm_hdcp_available" [drivers/gpu/drm/msm/msm.ko] undefined!

I'm not sure exactly where it crept in (I suspect it's an architecture
change) but I do note that there's no select for QCOM_SCM but it has no
config text.  The arch/arm code does select that symbol but only in SMP
cases.

--7uy9XegIstZRHI/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVw5c9AAoJECTWi3JdVIfQ5ZQIAISHeW4pjrhKRDADxW1Sao/W
U6THbktLDXu4P8+I8xXm1OqiT7OwdTGp/z+PngE5bKOqNu5I5gdfGc/N1ApX7eKx
9XS1XPw/MhdJ4VPdLWgW8R8vsAOxSfVZq0eJJTXb+eLNJtH/w/KokEd80GAg1dNG
RRKG4yBeBiNJezxPu3CbFpekK/lRqF+j9gPBscTNzoXx6P649KtRZJZfb87TXrEy
xklEhU4KjqqlAZNnCjxP0y/jjuJp+Et3kk54foX0vJvBpBUTFI3s/OwJ33OoTKue
Lg40Nzw5yYcLI8+iowFvpUGlZro0N2aKLzd1niiHfOMvkpQ9GJQzmHH79XW2vzE=
=Cj5k
-----END PGP SIGNATURE-----

--7uy9XegIstZRHI/L--
