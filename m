Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849C3FBEBB;
	Mon, 15 Jun 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534598; cv=none; b=BTbD7gObzhmXi4fz3t2KeZIW6joCMiwF2Udrae+R4Pca1IPEoRpTtvIbBS0XNSfj3VlWmcjLYUDnJ3qMj011Mgc9FUBA3KH8e2b5kUAwmECfVnViyE+j9bMfLZphusmirA/birAbGdY/krAUZA259xUcKt83Eptgm0Efsq2e20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534598; c=relaxed/simple;
	bh=900WrbYwCE/7fKmxewKMZfJZvhA9Tgev7/Vek+kmVFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fP/YQ+AXtG83aCjLSgxB8vL1SDxszWZcydpfBhxsWrMHDfK7xD4+yiZDr1jHABzDpIPCy1d7TxGRcy5/2LeEQXElNE4nG2wTsYGJIxJtdmfuov+Qrl1mPqQji4wy4+ly7Jdh84ORlfwyN9OjHjN0eSXxmk9bWombw7udUEdbU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmQ9Jdrz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmQ9Jdrz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3086A1F000E9;
	Mon, 15 Jun 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534597;
	bh=WclIJvh9iTirHZ8t23WM5Nv6hBwBi0dnPBTiiUu1pLQ=;
	h=Date:From:To:Cc:Subject;
	b=fmQ9JdrzubBNb9QJtRCFIgG9ZNcaL73CwNBp328V8A/0WtAb1eI1vX1t33DC6QktV
	 FzNPFXxdjJws4zAHWILVSNLJIGVTRXP6szc9cR2mZe+nYQZV3ti+yxfHwbaBN6qyXx
	 NTB3Lxbp2Jkb3R3cR+6Hvwd9O9u3qNvE0ConDzgBBMkR8e9Kc3NCFeqIArqwOqps5K
	 AespnTGZP4LsDY98dQE9cOTsHyulC7V9BJJepwtKckV1OOe57eteJPxTYG4qBvpxVX
	 fzR4bkXEeFa3RXhfg4l5RhC3D0geoqs6OyY+0vuzVwp9P0e+uRf1sCmAlOxNmj6uzM
	 9JL7xQYfFR6vQ==
Date: Mon, 15 Jun 2026 15:43:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm-xe tree
Message-ID: <ajAPgZMuxirYEfVk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QYMHYfZ3srgNDvBG"
Content-Disposition: inline


--QYMHYfZ3srgNDvBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b1107d085e7e8 (drm/xe: fix job timeout recovery for unstarted jobs and kernel queues)

--QYMHYfZ3srgNDvBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowD4EACgkQJNaLcl1U
h9BhTgf/ZslQC4JQ7eFwGIpOOMvdnPk5iYbCaM9QiVfKIR3vA2JtLw2JgVU3/0d6
IkqJzs1O9talU4THPaMQcDHZ94BhaIqDsIbQyfkQxxXqBWOiyC7RB2kjJ3zdzb5a
0YXHVTxx7GFk4z/I8C/CNHpb+2j0HA7irfHbHC+bDoTawg6jMo2Z3umPSK5BRSKr
5UGM+vOHA6oaNvXVQ5DDWLbGuf4nBVKpAabsCgZLMx+FgpJNLwzF++oPntjk4bV6
ApVga8SEVlZVzXZGfJgqlybLKusIhF8DmASyTS6e6cB1PwEgbJH1uti/9dBr/07B
wJu3t9n0giw7at1J2Z/3cRwpQPjo0w==
=/T4V
-----END PGP SIGNATURE-----

--QYMHYfZ3srgNDvBG--
