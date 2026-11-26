Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701252;
	b=oPMzZlt5qaPirCWMBgdAkQmWRaZVeVHEKpEft4sG4YBU5PmDRRUDgA+vRg0Sv+VTY1Vw
	 L7mf6r6UhRswJzTGwjeuIllLqG6o7SCp37+R+Td3vmVqM3fTLPV7Cwv5KqcapRT2zbqjA
	 g4N/GtnTWUUY6miE7oKLp3E/X/oFRN6fAfpS60NhKTgolPvCz4wmP4b5m7GfcKYpwbokd
	 K6GAv/cGKUd58wuxdb3m2+xJH14Xf1KVB3i5Zfgek92TbHnrfAf7ktctytUs3yX/oU92f
	 mRqlAcrk4AZF2sktxmqKWEBFzFQcvknFHtAGBaBceUl+1ZM8Xa55aLcjpisLHl1K25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701252;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=qgYJiIdDdSgUuReq86Nem6ilJtDayZQ7KWv72cLahxI=;
	b=fyazr/3ffwd7ruI9OHTonAoeJGRdcC8XHyfqOR2dyKdBMq2Nce56eKN4TLI6dA8BCEt5
	 ICfo6sPnbH0av2FcPjvBOmhMR18bm6LEgxdFk6FpqNfhv/ZChqLmkIqRixubY3QBIc2+6
	 DMyhrYITBIOvlazB7kFkQo/1CrKRELjxK6nxw3fBYsrVkj1bJgBtBZxF4B9jKyUVfmGmB
	 wMBLEDisHsMoY1I9+w6GfCwzwVNRdni+aJz9Nhw912xNOWvYS3uTx+Evc2phO37Xy1pW0
	 BThp7ElI5NRQqiqivwQRLsreQ2v5mG0CscP34EmWxvM3T8gOKPSouv1kuIAuk7CtoiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CwcJ463C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EED606A31C;
	Thu, 26 Nov 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CwcJ463C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0C1F000C4;
	Thu, 26 Nov 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701251;
	bh=qgYJiIdDdSgUuReq86Nem6ilJtDayZQ7KWv72cLahxI=;
	h=Date:From:To:Cc:Subject;
	b=CwcJ463C9pqYuZAKuEfb/MVa5AC0GifUdvs5hItfFy1NyHRIqtkczsi8Q1yV6Lu2E
	 9V+NpYnmw7EFqpDMZ5lSIiRFr/RmPHz60gIk9cBvFPc/Cs8gKSCabkbGJTcwa7KpO4
	 qhwXmnV6/ZpS9Nmcwnek/ClsX8eCPicocoRZGp7hmQqy7lao3rSChItfxALb+qVUsx
	 LF3g1nV/mTCNRp3DmgTM2PpMzKdFk0WmNKVw/w4M5/Bvw7Rfwz/alFfPiYnHrhnkMA
	 Tc4w0cBV7nz23obPQmzVbT9+RgO6P5Xqaxc77DUpd+Tq78MP7KwyYJtX25zvpNpDV1
	 VIgoOdyb5mPOg==
Date: Thu, 26 Nov 2026 13:54:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the pmdomain tree
Message-ID: <awg6ABOt_8dO_WHU@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="weOsESrbZ5s1xMg+"
Content-Disposition: inline


--weOsESrbZ5s1xMg+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  070c5d79917e5 ("pmdomain: core: Remove unused generic_pm_domain_data.data")
  050f9c1b2717f ("pmdomain: ti: omap_prm: Remove dummy generic_pm_domain_data handling")
  38bf1aeea3bbb ("pmdomain: ti: omap_prm: Use pm_clk_no_clocks()")

are missing a Signed-off-by from their committers

--weOsESrbZ5s1xMg+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIOf8ACgkQJNaLcl1U
h9DHPgf/eZBLSeDf1F8xKnJEHAuRziInpTincwk+2qiJjc0OkHTaUpNuw+vfmLBm
NUXWRmKbSH7DKyuiCV4YRw8Vj/+ki6HHsPoikcFw1t3Vmb1P5MCwGlkRyX7WkSRx
f5LxdPxCYh0Xj+9t6pU4ycFh9kuCNRrq47Kwbva3t7AraaJe+VXVeJhg6dhbnE7P
XfCMulXXElnNU+W34PBvR0a0JIDT8/MksMXR7hEu93uj8+MPY7dlJeb0kgHMhnRN
+69qTCZpAz26HnX76bcF0kfJ5X8bsUa98Vsleul/OKM3lSdSWnmGFnH1ETJFIw34
gBgUxQXiXtJOSMHoAVxd6DrZO7bJSg==
=qHhn
-----END PGP SIGNATURE-----

--weOsESrbZ5s1xMg+--
