Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BEF44A41B;
	Fri,  7 Aug 2026 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117482; cv=none; b=bVq+fZBCAU3uRPPpckxEbPSSnJNU9ecZkj5QX9Dk4043U/5eZ4DfOfyaH1xsi+u7NUVTsbXlAshvP6Qi+NP39d33yxEC5ubCxytzQJYVt2p9PMvoEtXBEDKeKASsPUdbz+E8VPoeymsiVUG7TWInC60yrhYXKisDH7YnIAeJGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117482; c=relaxed/simple;
	bh=Cbb6/aRrUytBqNWL+Ejh8XPmcz5BXtNmptWzvgkcWrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YTz1G5LoR0GRgJB/9uqleyb/6NwUIl5z35Uzh543oh0aPRMAkCfujaPDfGjQ92trZocp/kETaCoQVTu8CxenJM71HJKZ2fHaMhnFyR1XLu7Z5wi0ypFCEbh8Ckp5Ogq2bJs7NRvnNQyXHhvn0LjhBHqMI4YOccTe+iuhri58dBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlT/GpmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlT/GpmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CAA1F00A3A;
	Fri,  7 Aug 2026 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117481;
	bh=t/puPAHa3kU8JVox1ahYJAO1h4+piCIwj+aDZnntzlo=;
	h=Date:From:To:Cc:Subject;
	b=HlT/GpmOxUcDO/e4soccVCdtmgqBj14XAy+FG2F4owd3QlKaVW+XMjKxZmmirsxre
	 Dl/zg+cLGUwPjBXYn6bBheAcXR3AW24wd2YDp4y4zf6YFEFXWfWpNDQmMEJWwuKS8F
	 MlVZ8KOi51QrfcI0WhWyeTjJWt455VawrVFq/7GXQ5du+3gQ4ot9ve9lu/fkSRrw70
	 qgqLWsueDZNfEliI76I5Tr0Iop6a9kxsh0awSc2Aiqf7tg/FDolv9LxnSyFmwL9qWI
	 w+VpGeBXS5v6XtFgGi9hI3YZ2zYXeQNGL8iW9BSDZcgBoASVxB06r+nKErAdAjgcUt
	 llVoVhMi8H6hw==
Date: Fri, 7 Aug 2026 16:44:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Roman Li <Roman.Li@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <anX9ZElBEqtJ6py-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMDQ88ps1nQCZA30"
Content-Disposition: inline


--qMDQ88ps1nQCZA30
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:11:13: error: stack frame size (2400) exceeds limit (2048) in 'dcn5_mode_programming' [-Werror,-Wframe-larger-than]
   11 | static bool dcn5_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
      |             ^
1 error generated.

Probably caused by commit

   992694ad28584 (drm/amd/display: Enable DCN6 sources compilation)

though I didn't specifically check.  I have used the tree from
next-20260806 instead.

--qMDQ88ps1nQCZA30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp1/WMACgkQJNaLcl1U
h9DR8wgAgdU1dW3v5WSQ3oOCFciAP4KH9N5A7NKl7zDZAXUOCxsJ2+k5LBpi4Q0Y
3A2hMx12MocTM36+0K/eBreVOZWDGCFF719tPNrRmYs0gCxYrWFVtCUvDTJTOv/R
ngcP+Mcg7Hhs4PXNU6+llmv7G1ga5M0mzQXXUmF15Ksn6fvVYLnxN5wSDQJ1enr5
rCxn1r/q9UXlOxjvV2ppQ/Fnxx0C18JoPsWpD1C/L+oNLm+7xPjlzUrfOeSO6IZp
uzBgOe2pvHe3C0SA93WMGaZ1pG+0At7Jg7GBX1H2p/9wsWPM2Avjn3ceRg50nQw2
21O3e7OXemvz3Uo+e5YNeVcofUtWLA==
=G7kB
-----END PGP SIGNATURE-----

--qMDQ88ps1nQCZA30--
