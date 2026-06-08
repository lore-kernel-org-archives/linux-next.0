Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782FE2E62D9;
	Mon,  8 Jun 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916388; cv=none; b=PaicGUDTLGX5RW/euq+CFubbadUFIkZZPFaoKbM/6JFkhXmCe5odHltg5julxixwH87izavDfwufnCiNvf2wFcrKdHlx/3uf6VoLnvEQCLrxRfhgIKVDBr21uaIgRM9hI0KpD/8uXu9ynePZR8/l0Y+TlG7pW4phg5Un5+iVXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916388; c=relaxed/simple;
	bh=7H+xCogJku7hAqa9+AIOY4H6kNgukDn0g5US1sPhXZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4f072fbe9SWebURQWNK1fp1LS/137fJySuIozAK/Xpfh99xlVKi//edv5Mgmr1CTz925zOH6CCdNg1eHOi8w4VBWN9VfdZaQeMTenR8jfTVeWOBgCGBkY28LKuCqx1J+m8kH/HrH5sfG/gXL9WczyDtcu36EVuj9JZW1vv79XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnGwVxzi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnGwVxzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635ED1F00893;
	Mon,  8 Jun 2026 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916387;
	bh=lQBLUSs2p8IK/NzwytmosMWQmoJGCDRoVEgFgDRr2p4=;
	h=Date:From:To:Cc:Subject;
	b=bnGwVxziAXIPVun/6kaGDIMqAurZFe73dyQODZaMpBPybIq/Weqek14EdR+qhVX0E
	 9zDexpHsGYaTBPNV1bfLTX1sZuCfN8NFpFtlQLpV9MJU7Si5VaMSFjqQqFQclOKyRz
	 pArNUjKSIZiHVJhmdFRNTBg8OxFyyvA5Teit1nrJ9FsAjDGIrbLJErli90d+bu/3sa
	 C2mmojtDybuQVgNvPi7ED+3UofijXY9kReE+rzMjLEwOD1tIVe3mkt5+4e7aq1VCFu
	 5lCBNk1mgVmJ8KxFdglBvbOtqRRo5ZaeErwqDeHyv4N0i3ndWlPMnufTrRSE2ohFE7
	 jBOafAYM90geA==
Date: Mon, 8 Jun 2026 11:59:43 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vhost tree
Message-ID: <aiagn0gsbuzzoKKI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TpNrY57/4IXRItCh"
Content-Disposition: inline


--TpNrY57/4IXRItCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  78c3caca23c35 ("tools/virtio: check mmap return value in vringh_test")

Fixes tag

  Fixes: 1515c5ce26ae("tools/virtio: add vring_test.")

has these problem(s):

  - missing space between the SHA1 and the subject

--TpNrY57/4IXRItCh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomoJ8ACgkQJNaLcl1U
h9AdAgf/X7lodJkNRNVJRkZUvUfoPwz8KKEQx02Ckw05KIuw8tI13mH6Ij4dma7T
7wOYvBidCxRfgDuHXXV86slaZWSe7VAdDt1KA/lyBtqkYbJSWw8UsMjn3Mvxudrt
32wEizCpZx9xAiXxs4qN3rpS5WEY/dK688rs1u6wpp2RvL+Uc7hmlsty+ZI+8AoO
2YiyX+4QE8PAYqrDtLJLLZs9UQQOH6MXFB04u2Kh2/V1R4TeL4Bzb7GYJwyh0ute
a2sy63XShNPGWejb7yo7a1j8hDtk7wktt7r6cxlvRN1tWTxTpskOYCexFIYZTkM7
vFjn51Erydow/1rnxgldMcoqioyZYw==
=A72c
-----END PGP SIGNATURE-----

--TpNrY57/4IXRItCh--
