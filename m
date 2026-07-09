Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847811BBBFC;
	Thu,  9 Jul 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606870; cv=none; b=DRlhjx0GShIKwSn+ZoFtzouKIV2h2ba7EZgA1MFNaQpEE3b0appIp+DxxAbGyT2RGkFrd/7sP4pjhIFQvHgB68vcdC7aaJeyy/Xyu/8lv5Z7J0IfwlvvP5Mp6JCuWsJnZcagfe/PrIZTpfCE24VJ3qM5RbEDFaFiNQvJCXYpnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606870; c=relaxed/simple;
	bh=maBpEX7dS8A1KwIm7N50lfYDOSTQ0iDGp2BmwKtZpH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfpMaaAmjQrrknxO3s9wDzsDT95HM04juMmOfBx5M66iD7Q5tdaP8W3yLkU60EMNk56wyAtRjvBvMTweQefrIlQuoEhTVvWfqF7BP4unBhhaZToC0X1McbrXAoC/oGMKuVU8X284HgzGOZvpCYPxZLV9f9Tx1kwt+dt6sfEydMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb04UVlf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb04UVlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F421F00A3A;
	Thu,  9 Jul 2026 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606869;
	bh=a4uw/oPQVjYW4hT48dT95iyUf/kiOSVu4A7dwiQO81I=;
	h=Date:From:To:Cc:Subject;
	b=Bb04UVlfkD4wAIclCBE5mRzSytJda3GAEEbXLw50KDSJZv+tlWsMCTANdssKbvjOl
	 Gw9IqyTjWP9NT6MSIW6rXXLX3XVvY8Pw0NZCcTm9I4+/R0We99dXsBJ462tawvPAi2
	 ocv3SWJY0mbKlNlpI1d91EvIx5tYQWoc7gUXMgzHz51AI1fT6anOb+0CMzUT5zFjgF
	 jp28MnPwwDDOBkttIMIFQCE/4rvwy86uGYPractOYh/fOG3HSA8290oOQVVgeOo/yu
	 uAjZk2HNMWgvo3CiuOl2ulFVs6g/srlG5oExIDWqhFhbV+rKVA7pkD6uOMmbY7mj0c
	 uKj34putVG9XQ==
Date: Thu, 9 Jul 2026 15:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <ak-uUU4g795lDXuP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kTm7eJgG0/13GEff"
Content-Disposition: inline


--kTm7eJgG0/13GEff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

  603b91aeb20a2 (Bluetooth: btintel_pcie: Refactor FLR to use device_reprobe())

--kTm7eJgG0/13GEff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPrlAACgkQJNaLcl1U
h9CiUgf5ASKWgd/+P574QMW1Dm/oz9IsmfgwRAqktYLs4i1SsyDSeZLLZ4C1OESC
w7phJULKF5JYLwKinB3haQPkkcXgdnj9oVb8SKOvR8DRf8ebcYSE60OKSNPTYutM
qno6XXQKpTul/5IJ02+nPbqdZbRzc9sZ0skmnGAZdysOBgwpi6uR4GVgpGdjVSyD
38kzJyNasvo49scz4o7+5sBLi7Frrql3g7WkZPPFK8HzHg2u6ITCK7nzuE0DZN+Z
eMBx5MUHbIkVueMRok+VpKHEVr2M+xJKS9JZUdgyB6aAttEvJHg766QsUwKeYwhb
Bl+pNnyg6mkBHus576hCN/QlEmVkHQ==
=DyzL
-----END PGP SIGNATURE-----

--kTm7eJgG0/13GEff--
