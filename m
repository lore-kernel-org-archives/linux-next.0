Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFE36F8F0;
	Mon, 10 Aug 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364491; cv=none; b=HOJAuExFg1/XLBRsWbWs4LlzSzlHlwCMgsP5pN0b66N+aud0SpjAu144QyPzmJnIRxbT9r8QQP+Ylzf+Igf4ZXQtVJIgRl9kyGSaHXy4TDVaf02lGDr9g1va4OtF697j/F7wDck1qFtH/QyxYholB8JIM0YmMx0fSqlPZ+fx5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364491; c=relaxed/simple;
	bh=19lf6DVo/kvoeFawmG+xkKE4srrrLrB7XA4sXzLiibE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OdOEUPrSgie+sHOdgoFSJueH2ceZ6UUd1pKBaOL/LAwx7ypuRWIeCMAnyFhF2kyH1XvbYyuiQnB+8N9D0oAk/y2oHEG6QjYQyGoUxGN3rrkYO4g1N3iVy3EhA6IE0NSee4mEcHm4blzjTj5Uz/eLfto40WV3ijFfvXB8GSAbch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfz33SqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfz33SqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF7C1F000E9;
	Mon, 10 Aug 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786364490;
	bh=IxI/vt2/f/d3YphvP4EGKxd1bbv8IgLn9lJqpFOfxpo=;
	h=Date:From:To:Cc:Subject;
	b=kfz33SqOrd14HbpuO32yTGa573tadl4oKRqbcQ+Xdgh24RAZOnVFeZ4Oc/G01YGUb
	 c9a9lD1Qj/dmbYn2Y/eSNjFNQK2l964KG75ssYqbAeiin1k5Zpn0EviQW+SCxQG0yH
	 icxNG9XZK9r4zGLX80JKbnVzIWDqxXxU/8lyawYJ3A5Y0u1GTdurvtR9ojPIeBk3OV
	 eSvSf/r0PV6H+uxHBJfzL+6FiSGG7So+iMSVUVRJK+4x9/KioD7F48d0l0rlQc81iO
	 3nR39eE+rqOBSaS7Md4M4f6K4OguC4DuhUAg5V7ZRP8U8CX/LPkbly/j8F6UOU3ozv
	 lyEItUvEJLLoA==
Date: Mon, 10 Aug 2026 13:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm-xe tree
Message-ID: <annCRqegoQ9PBClJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lU089JkQTfLxtWQT"
Content-Disposition: inline


--lU089JkQTfLxtWQT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--lU089JkQTfLxtWQT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp5wkUACgkQJNaLcl1U
h9C2MQf/eVfCccz2uaGeuQ4KeJkF2L2CP7dkkd8xKWF0oLevELx0TCWmdd0CZJwa
pEDZXLi614ubFk0L6KJshfJXqYPBLpSBNgAiHntjiCsaF8T8f6j2PNo4Pa5DabRy
JeHQtusr/3SkruAFYKaDeCw5wJzc6erXnLDPE42hOoURCWRW/JEi6qWvThV2LVaJ
pY/bOBzdub/de/hxL29X3HsJ4vrEkWYGiJL9ZojzlVLKZgWYMc4q0z9CmZ7DKtmB
MPcNVHSEH1RGhJdNjRUIKcCf0qP+LXSdQ/Ga43l+uzEYmnKsOMMBuluWnXCESUkN
CtqUb04Jbnm+aMnIeGCH6adeBSr8ZQ==
=qa5E
-----END PGP SIGNATURE-----

--lU089JkQTfLxtWQT--
