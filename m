Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185543;
	b=e+isB0XDRzacFBBK3uexI+IKhCP0RJuF5BqsUmxLda8EvzBgipSA3ZULbUHquFVLplUu
	 4IdbRaH8IhuV4tGLcZFzd0o4nMH01wJYp37jpH5sdMmoH/cK8W3xlhU6cHcjvdNRBz0F7
	 qI2dqphymZ/Ntc37Lk6o85zo2W5OfOlN7XPx1XvHVYk23WREKk9aNDwp/PmyUA11hmDZM
	 i25pLUPi/n73d+ZSD0KF6KgD1bmIaz9ipEuTrn41AGgz6hM4tCoBbyed9grEjniSa5ESW
	 be7GTjZLfuhEAnthd1zUlF8qXikKGytNAH3l2++l78ABMzl6AHHKZE0daBUL4zbIcjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185543;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=DeomjNBBab8TQimQ9FD08gcii17BGvVDnAwaUlP5DW4=;
	b=q1ThWo1nCH6AFxNpDztywkdFvAWRD69v4Hf+fKIvWanSEwaHYA0oJv44L+YRRr4pAFK+
	 orlZ38eZt/XoygMzRk1M9rTPCqQUFBEZpFmDBYObQOAV6MJgjbd/ETtWau3TJPQqhHkG4
	 z4hgUiXLUKocJtrlCvyvdSkR6Y5vnUlltPrHUEn1dKNosFY7NT7dx2D6aFWZl3dZCjsMM
	 ScUHoBzE0/l+hvKAI/+Flv3/FtZ2d3v303cQcd0Vl4IYJKHQEvzXkB4u88n9aa3lvTnUh
	 C/tmkg+NI0nhUGQlOSm4tf8N69g5nDM1gxjtRa0Y5kqeSmi9nLlASu36mJSobGnZm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awB7pon3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFD606A326;
	Fri, 20 Nov 2026 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awB7pon3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927911F000D4;
	Fri, 20 Nov 2026 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185543;
	bh=DeomjNBBab8TQimQ9FD08gcii17BGvVDnAwaUlP5DW4=;
	h=Date:From:To:Cc:Subject;
	b=awB7pon3BpKl8ErmTbZ8oaZ5g53MqNx+QRqsre577m96XgxD2RfJw5GjiEceX5vCt
	 vyZXSrAMewJqJL9B2TgBzHud2a7pZTFpuUmKgG0Xbzjcpi/Gv3RTa28sJbNFOldaXp
	 ozt5iLvyIDmeNu0cergSUCYzuuXj0PnODEXwExOdW6kXyLgyUscSi+509ZrGrBwArh
	 bQ60ruMjuxp879pmk4jrz9WWuu7+0BgUA4QiPjht0mhI0gztxymrJmC3H4WGgmuuq+
	 pAKosRof2Bul/uSF+pNqsPE5+af84kv8P+hVHBeW4PWguxygch2pxCUfOhg9OjFrsy
	 DmdEyx7HOj4qg==
Date: Fri, 20 Nov 2026 14:39:00 +0000
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vhost tree
Message-ID: <awBbhBu6rFxvnz_d@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="+BJd9ZAyRwZeoBz8"
Content-Disposition: inline


--+BJd9ZAyRwZeoBz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ad74886a8429a ("virtio_net: mask callbacks before handing off NAPI ownership")

is missing a Signed-off-by from its committer

--+BJd9ZAyRwZeoBz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAW4MACgkQJNaLcl1U
h9DpGgf/WqVLAEUTfaS+MPG6iywKJZHEyX449HqFv95Jhct/LoWQlvPf4yP2xuI/
vEolVAdXHbg6lNSJdjQFpUVJXgnFrKCEaT6k6fjrd+NFoNEWlc1bdJQSxqVH8VrC
+Sse5W50Pu6RcXIQH1EjpbSOcZahNocMTexN7GGE/86mFGW+LcBBWaOlx8fGNLpF
TBuTYro/A4o7Y6FhvD0udClfzmnG7cbi5acFeRvw9ph698Ax5TZVYEYw0pJj1Zsu
USeK/HD8pQm5OaAWbEx8+f2C4gIycos/ZOAT8/mhj7aIE7L0WgyQcQp1o29Q2BxI
DOSrLX1tjYO92y8hWGP46f8IJD0TyA==
=sWfT
-----END PGP SIGNATURE-----

--+BJd9ZAyRwZeoBz8--
