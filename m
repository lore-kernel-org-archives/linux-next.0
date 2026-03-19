Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E238F95E;
	Thu, 19 Mar 2026 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921998; cv=none; b=A9+h4tuvu/qGiMRKSJrfMuWCVYYVwR0AJXBv7j28FUsQkbRwXrU1pggrLlaRZbATF4eknxjPuW3kYSsIdkWuL1rbCPbXI/D4UhThAnmYCuTN/MVomIeyRcFIi/gfZsvqJMkwW/vV5zNh2P7xXHPrSYNt2W3CWHTbC5MowigDJmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921998; c=relaxed/simple;
	bh=g7TNEV7C3IBBx+Rv9cWZDpxp8BXVB3K3e2tDDW4g7mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQyICY29v/zTW/i86FWyh1pdKUMUHPCf08oNLc/71dpTDc4fxamI08436SsiauIG4qTBeataW51/fs63VYKF01jD08Vqy5Sj2dcwJ1LGEYxgTUYMDwQUutUfuB5Uk5Eysz8KN+L4/ppG3pwHzGDNtZXksFCKJ+90K7KGXDL+sJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkEA8sa3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkEA8sa3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C387AC19424;
	Thu, 19 Mar 2026 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773921997;
	bh=g7TNEV7C3IBBx+Rv9cWZDpxp8BXVB3K3e2tDDW4g7mU=;
	h=Date:From:To:Cc:Subject:From;
	b=KkEA8sa3Pq4RYSREwACmFar04CikoFFTiWqOwNUYWRPzr3t4pkFMC3exekc2dSE5k
	 lRDU7YGGH6V7fvIxQiTbn3J5ThNS/KKX1JUCmdJMGYKV6ri6VIKSvfKFPM5BLVPLwn
	 e6l5/+lvtaUhKr5AfAXkjmsJ5K8h6sttJxma1xTjvEguG3aaQRf/Zc7+n91dN6VApN
	 NbnstJrXnIPP2f6Ya/jQafohf7QZ20Ymy1xah4cP14csPCwdrBkdZfjreA/mZJ8e6C
	 S5m31DqApRCQH4voFrkCIyh2QALpCQ/COgLdG7VrMt5r5dCCgwQ8uDs0y6Diuq0LMs
	 tPxKAQvVAg1Dw==
Date: Thu, 19 Mar 2026 12:06:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the qcom tree
Message-ID: <abvmyS5UnMSk_yny@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUOec7R+VrGLN1lF"
Content-Disposition: inline


--aUOec7R+VrGLN1lF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  a210cb039b41a ("arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support")

is missing a Signed-off-by from its author

--aUOec7R+VrGLN1lF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm75skACgkQJNaLcl1U
h9BQhQf/RD2PZPI8VoRqji6rWLnNZr8q0Z92DIoD3fQVqcapJk4x5vYroqZc/Nnc
yHmftgW4lAZqhD5Xs91asB8bEc7BeVYaAHSo6DzcBVJ+18Cb+qrjlUu0UZ06KYlS
D4nLXpNMckPIe1JFIie193wG19GJMVkAX/22wN+F2fL7TjGVDsm/kCyHndXnH4fw
iFCppM386+0aq60UU9mdVBKfJR1C09GIUSgLhAAbK4nZm4TB93pg7RxgpyESdOoP
mY8zV8Gg/mj/1mbNF4ft6iZrwDDuWcSdGqW33W2MrOyz12EIf+OABviHPkkAJcLE
8eTDgGZbjzD1jvk6i5ahwSBTYaBUtQ==
=109c
-----END PGP SIGNATURE-----

--aUOec7R+VrGLN1lF--
