Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442324;
	b=GvW1+/QQypFe6dgFwbxRw7eRr+MufVGNx5RdHHQRDyOQJWUtv0HN+AU3GqJwQjSP8IBi
	 mDDRBqbY7/8ZkJrEMqk/MYKYA/4VbnC+qVj3opX1UM/dmTJRJAL/TvKFz81E73jpavyU+
	 rXbMrKhAap65HHwwRxRi3KMwL6vjkuHTxzrlgfsTedMephLeqg38BDX/uO5xOlbiU+8VR
	 BQnyOWi9hG523spcCyYElfJ5ArUXHa+9JhxdcHmuV0RknIcVgmq7EUZ2MwojgvZRDg6g7
	 4Xm/HA60r5vJgbOQ5VHIIz30ftkK10+IKHtZGLw/Nr7mRlAGdqfMpvhU+yi82xsasFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442324;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=1HRUykJ9deJ7cCQZcuaGdcoUvYQmFF6MIPgqufqfb5c=;
	b=tEEdZFyfyPFQgBOxcwayFR9FCesCY507UBqK+BYUAtQWDaV4BxSk646pZYEX3Mc0dms/
	 +3BL74PrHPXga7ZicXKoNd9ONCSdon5xnkJSkAjiiWhU6rTMYY4NvQEuZtU0JrAebKahO
	 deFHd8jCQ6Ga4b/WFo4oZhrEnIuIfyrg09E0D7VtxWRwdtn7jHMiRA9k3ezYtgVle2WlN
	 8whsJElqz42XMPKtP1QQ42zzHp9vR2reOg+2Owvpa0MoApUUM1XjlgGhmATGdt2Cso5E/
	 j14bkHkJOc3S9Xqftvg/FKOV3LU8y87TjgcTk+jzJGjSRm7/XWJklc/POhbqD2Jy8WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naqULEgh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7705606A327;
	Mon, 23 Nov 2026 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naqULEgh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A7A1F000C6;
	Mon, 23 Nov 2026 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442323;
	bh=1HRUykJ9deJ7cCQZcuaGdcoUvYQmFF6MIPgqufqfb5c=;
	h=Date:From:To:Cc:Subject;
	b=naqULEgho0eK3x71f+ZuDMGc4x8sSVfr8Qy804e5hN0DdUT3yB6n3p842UwPfHw4g
	 v4avzszaghGSwbnjARpXJVRlPp3xoEFVaNoFpCWWjjUEBk1BwshtrAdf28AwKwUOyA
	 BRObtiKze0cFiY7xg+w7IOSfN3uSSZlXw/bnrSmQ7KhlBmqpVTDdhZFeHCkhN/e0Pe
	 BizuGf9lbpSfcJq7Q9Wv+tk1YC3r9zLOhpxkXcPctFnTj/WCe9gNd3C7GGZmSekKNm
	 F1dkXoU+xVrASvTnKxTn1rg4ppjOfPIfHnMRZRk4ff/sKQ4MErJKUb199vy0/vOQ9r
	 irbqBBdXqKvqw==
Date: Mon, 23 Nov 2026 13:58:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the workqueues tree
Message-ID: <awRGj-h1RXK-Dub1@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="dXraB5d3I2Tuenyb"
Content-Disposition: inline


--dXraB5d3I2Tuenyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  fd0e48ef59164 ("workqueue: Fix drain_workqueue() missing work items chained across pwqs")

is missing a Signed-off-by from its author

--dXraB5d3I2Tuenyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsERo8ACgkQJNaLcl1U
h9CHnAf/aiZKYgaoUQJ+GL5vNjD4xQkbfGtL5diNUKkURegfY3olBuy7p2Tq7oCX
STQa6Tg01Wmp+J7DjIV0eRUEc6F4WSDVtn9hxRalxHi9OTKVLHfuO8QzZ3TREyji
/ENiwb2xV+p0fEh3TamlM54QO2YfgaL8Lrqaycj5NcVfOSydomjUGCfNwNP0UFVm
uQZv0shVm3J39SL6rjjXVujqzYP0Xc4qQ0n4lWJ/v0UOTtEIHLsFBjyIOMHPNTB/
i3vXtWRtM8smhoc7i28sOuoSHkgxgeXNuEgdZKOSpguIkI6tlaCh/UF/15OHJcS7
gF3ysD4M9G0OC4e5SIUxRAZVITRniQ==
=u5M/
-----END PGP SIGNATURE-----

--dXraB5d3I2Tuenyb--
