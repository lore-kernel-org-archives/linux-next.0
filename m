Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8E2472A5;
	Tue, 20 Jan 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919461; cv=none; b=EUEwmARdSVipo1Wcethio8fI+OKGIzZOsn6cFSycm3MOSdW3G9WA37MIQiEOht3LjAenaYs0fgX7Nd0cBoZi2coQgyTuTSVGYdSDpi2AjCpHf21XxrYCNW11LrRIAJPgrHlTXFPxaubcpvh+jPbM865zjJKG7vn0r+KDbjFVesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919461; c=relaxed/simple;
	bh=8kwLq8A6UNQfbJ+AhubQeU6mlyEurtih7K4BeillPc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJDSHquj4ftytuw4FkfCFWa3K7Rk2OK90w7O5E4JewANaoo7inQakn4ko5OWVyPMw1k6kziQMFcnpX3VDsABOEJkKp5canQ0qpd+byiEAsz/Zk3D6zLzZSL8XjzoTLjjLu/XCM7SyIrgruie6idfQaFynZzU8Q5znmFcgDvTYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5RlXDPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5RlXDPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC073C16AAE;
	Tue, 20 Jan 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768919460;
	bh=8kwLq8A6UNQfbJ+AhubQeU6mlyEurtih7K4BeillPc0=;
	h=Date:From:To:Cc:Subject:From;
	b=o5RlXDPcG7+agj1oKLLXB4r4z0IS6zStphWgikSpLRsOdLFUPmO2DhAgPxnNDhZxi
	 fVuBEmEWl8hefSIUh+Qiy/YcL4HQBHZPH6EOYdw+CTuijAfFuMx9sRXaL0lYFYwFYc
	 Sh9iEUKm+p+GF4nWJZ5C8D/7o6heRknlshA99T6ywup5cq+geUFuZ5ai6wu7bLIkmJ
	 4epHVR7HmiQADLgeJB+otCLoTzYUnx6bJ05RJD2KIUh7sLw7BZgBkopiP6++TdLuwL
	 mprQskmuda8dn3ubEr+UPln+Xi5fzqLtMNicXJGzmnQF+nKBMt1AWZi7R6JIgDl4ju
	 c2X25+fh/ABbA==
Date: Tue, 20 Jan 2026 14:30:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Chen Ni <nichen@iscas.ac.cn>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-next tree
Message-ID: <aW-Rn_qcNP2CgOm2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jgTUlvssYY4I/1+"
Content-Disposition: inline


--9jgTUlvssYY4I/1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

between commit:

  f9c68b1c5be43 ("drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon")

=66rom the drm-next tree and commit:

  b626b1a1c9cca ("drm/bridge: refactor HDMI InfoFrame callbacks")

=66rom the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index d510ca8cfc4a5,d0e4440b74911..0000000000000
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

--9jgTUlvssYY4I/1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvkZ8ACgkQJNaLcl1U
h9BcWgf/f1PZ+vimrziCa4UmeSm0BThty9/eQhnU7AQaPN6eBJK3xnkjPEVElaKK
vZmUvvBazSxIRd2Y2rUPBnG754LXtzBYWrg3KQraJZj91seqKmi6XN+aFpeKQJha
g9sCisXi5XIsxF2IFS1zYVU6P0P9J8oOnQ3ilNCwMbVMb/iYeuZN3IuW+Fe/zemz
ZGdK5spoTMmpqsP07IBdgQ6B1eaZ84SShGxILaOsS3eYFdu0jEJTm/Tdb3UOkVzr
5mWgGaE4tLPAPTJVvX3vmKXqzaH2egTPRUxIXORcI8x0KnY3eZARSWMTd0DuZbuy
Kd76V0digS1dvkh2+r3HAbzq1vxzUg==
=6n4G
-----END PGP SIGNATURE-----

--9jgTUlvssYY4I/1+--
