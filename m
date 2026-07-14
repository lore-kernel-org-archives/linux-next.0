Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129B3A7F75;
	Tue, 14 Jul 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029634; cv=none; b=f00GLc17H/19iiiPiLy+pwLuoTAiJDewThzNwdA/byFclJmXf/yxlpI6P2cs2kQIzuLwFLsQO1WLfxL8Qaxb8yEi3hwQkHT7eMBLn7OuhZEDWeBSrTjnPL+3IfpTjIctfXsLVJ0joqrXkiQPkuVuT+eG+XZsNJnEixcAtYtCYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029634; c=relaxed/simple;
	bh=4FT1KZdG9+8vQdwZzBBlR+UDAbcQpDfbkN+jHl1FLNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E08Wi1GJUtt5GFz+En6YsBUMpQetYB8BUmnE0jzE3xe5O9j1v34yIRPffEdV/oqvN6uidKvA6ViFs/HIWL+Cj2RLLSdXD+HMvqyrOS6qtfgMSu3ik4erFYKDi7RCVqqoBoHaRDkIBew8+9sRCsor06Lxvl/a+Xfbay/d6y1mDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6EYWe5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6EYWe5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FAA1F00A3F;
	Tue, 14 Jul 2026 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784029633;
	bh=ByEV+HIxTEtSqq52HAcTq1JU/EJC2+REptmFl6VOKbU=;
	h=Date:From:To:Cc:Subject;
	b=M6EYWe5ySbRMAVurYw7UsndsVxY4TP+fuxTFQMUUSPsS7RzTijCCzfXY7Ri3Nt7JC
	 SXx9Cam2/8dtk5T34OOMAUNBYjso8fMR+9YZ08w5CgbV0GkB8XK23QFNuAkSFL48+S
	 /lNtiGZ20H77s6BLzIFtzqh4JyScjHmn0wiFIcoidZxrudInBCtcyFGakyllGMAGVx
	 1TSEvTKvZ+PJh/AIdovCfJRBcW1JUPZDQEJFNWy3FXn0eKLVMuQ0hdxLgUmnjurAvq
	 oh/yWNpsfgVsacZ3bcEGkoSNJrQHK4Flr95SPLZy1uU2sQEFclpaXeGj7TPcJVo0Jc
	 SctgObvgvDmoQ==
Date: Tue, 14 Jul 2026 12:47:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the powerpc-fixes tree
Message-ID: <alYhvRRKogDZck-B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FWaWqzd1XdKSlclC"
Content-Disposition: inline


--FWaWqzd1XdKSlclC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  1034785975914 ("powerpc/85xx: Add fsl,ifc to common device ids")

Fixes tag

  Fixes: 0bf51cc9e9e5 ("powerpc: dts: mpc85xx: remove simple-bus compatible from ifc node")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--FWaWqzd1XdKSlclC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWIbwACgkQJNaLcl1U
h9Bhbgf/ZiWdWeHMXR9cCy08E0L+AwUXSUWRZWMHCmKTkZGto7JS61ffW6mDLdBx
F0S82nbcL/qPoKTakzDeu+OM1Hz7V31Jd4FcTt2QJqOWMh8mHElRvCY7Z7+I04XG
VgJFfnUocDrbi0XGnJ8OILbzKG0DmwgNMrXMpeV2H/LZGO9a7ABQJm7NcbcFcauE
ArWNBium0Ccy4gJPfjjn2ax9cU3SoRRDkhs39g624xIa6KuL2LST5RCNttdnurVO
P2rUSV98u27WvoHQ7D7kE5v9s09EPOi6yq4HXZkyS/NpTqU0A/IpeDkPsNHWZ7Ir
9F4nijDE1EqlvzvQGlF+DUlnzfrb9g==
=aQUO
-----END PGP SIGNATURE-----

--FWaWqzd1XdKSlclC--
