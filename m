Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4E34EF06;
	Fri,  6 Mar 2026 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798359; cv=none; b=EgRSKzlENLqLMfONwB1R/WsmSHWl5h5e/lZxeJpdsqkcNcMcrq5C/S5JANQoj3WsodtyqsZwu9uG+jsG/CTRUExnB8xlrpGqDQ+sN/JEB9V6Hr8cFZ+gI8V15JEMQ3slzwiW5N5LV5V6eBLiz4wK6tpCm2jAhEdXxwmcwLjRjXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798359; c=relaxed/simple;
	bh=X/cpIns/GfpHfVklg+/PGKnMIYuENkp1MaTsE1863Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlDsED9BFgS7mHPWo4TcbZj88NafchdsXwEDkJ/4UF3zFDI+KdEa6g8GU9OseFMKv1cNimnhmJ3z1sWOyFto1nKDmPguHV/yFcHrnruAnY+MJTHL22meaDYeWBt2dtokmfcaYMqb96iQmC51siV+e5w/q20PqViUUvkryRbyd4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDNdca8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDNdca8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DB2C2BC86;
	Fri,  6 Mar 2026 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798358;
	bh=X/cpIns/GfpHfVklg+/PGKnMIYuENkp1MaTsE1863Jc=;
	h=Date:From:To:Cc:Subject:From;
	b=nDNdca8j5J+FNnWqNUuv3I8IDfrH9QqtdVmIcmA+Qf+AD3xBR7BV2mblMRIqYtDu/
	 PDs+KI26fIzs2bTbsTOeBXbo+JF163Jy7cWTrdifIv1e2niXbh22vgpaUBxdfEs/yD
	 eFqTSHBY4oKgaFmlPkfTBEso2OB80wcr7AR9fxymg1iCcidaUYGeegV/Tjp87BiuKE
	 rOluNcchLmjo3FXbatKx+Kgaw3SAq/mkV6IqpMZPyrORjLyYSl5nHfbSNDPSltY3Zf
	 kbRrAvUxSUaQcxe1wTp8SM2b+5dt6+jgeTxzhjyCllQgSRGxu7mH62IV9/wf1Ymwn+
	 NmxPIG+iYjV2A==
Date: Fri, 6 Mar 2026 11:59:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the rpmsg tree
Message-ID: <aarBknf1hjoOFP3l@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ryotMDYDtS/5qAk5"
Content-Disposition: inline


--ryotMDYDtS/5qAk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  35c3f72a2d55d ("remoteproc: mediatek: Unprepare SCP clock during system suspend")

Fixes tag

  Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--ryotMDYDtS/5qAk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwZIACgkQJNaLcl1U
h9DtJwf/XHZKopSazreUBB7OcUnnOyn4EWHT3C+EjBsfqSqGikcw13CjZYlJHikj
aYtUMCCUcoHQa8t3kVjr9jdyAs3UyRq8awapheWGeH09dYnmR0veRDXvgdXKTWH9
AUdJxu01xPgiN4ToZ6pWA7dEnhbX+mesPX920TPCr/ruCuv6UZGKwTiDixStHWD2
NbRfWfreN5oFSYwVhKuymY3Z4XNvls32sw6WE7NoHQgtEhipjjlKRQAMKq+8Insm
Gg+EcCXUyhyOZFdRlC2Jm1Sj3Am2bWJoKuRF2+ckNDfagzR2sHIJdCp+Y+ascUEj
hTrHbI9IOdVMfIcElB1AOHR8xq/tVQ==
=Gxfm
-----END PGP SIGNATURE-----

--ryotMDYDtS/5qAk5--
