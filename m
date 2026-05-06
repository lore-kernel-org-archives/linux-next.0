Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05635C190;
	Wed,  6 May 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062863; cv=none; b=iVqOCA3IIHTck8ZGwMHKxpjmYMUU4GJ6D1mSS+k3Gp4wPsqMiUhN0ctiXL0n9iWR15sI1jttZjcTTSarteAONLXUOhKxdV7ZNiUK9I77Iiins+gyFwVaaGNnNj+dths9yke80XEiBwz3FuCkjcScah+zyFrcimhJ0bLrw7uoYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062863; c=relaxed/simple;
	bh=szIDYl4YMrMkVQH7M+qw2XA/7pZzhI4gxs1VPVTCWp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4ICtU+32xvqeX42MTWSHMwOXlDlFknovR4xy0fLJg2PMwiX4qoNSOu9U9xEcMqHw3ZezyCfI0JYRxvmP7N1Vb9uGtxsAslrW3uY+whgXmg+SagNeRopjhK4hIxfzGw7aU2AHTtEaDPS3ledEkuW5Fsy0+qzCTDismIJL0APfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DO1IG3mJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DO1IG3mJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145DCC2BCB8;
	Wed,  6 May 2026 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778062863;
	bh=szIDYl4YMrMkVQH7M+qw2XA/7pZzhI4gxs1VPVTCWp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DO1IG3mJMsD6ygKDeJPTFgM4/USdlBncDfZHf9v86wI2u06ZlJdxtCHUqDOzw4kff
	 9uFu4pP7GpMbuVVwTBAOiRjMK+qGZ2Kta9IkMt/EDoAUyhoYK8ha/cTW/5R5ekkZD2
	 WYYd3MDuZr0tSsbLco3i7QZmk7Ve3/6TELLRXXOp6vb1ND7xP+Ohmu+2zs7tRgQ61O
	 s17tPn71JoEG/PQlzinjycacN0J2GGuLpqUgji4c7sIcabTeW0KJwq9shOLT4h/BFl
	 2fQFkUWFVezo0leFoZSXc+rU2fb/YKLbTlQLCRuPcdmJJX1ChNPM0ThhV0lb704RmM
	 ka5Tkxk/yv/6A==
Date: Wed, 6 May 2026 12:20:59 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	Chenyu Chen <chen-yu.chen@amd.com>, Dave Airlie <airlied@redhat.com>, Leo Li <sunpeng.li@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Ray Wu <ray.wu@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-next
 tree
Message-ID: <afsVtJvNqkCaGyov@orome>
References: <f8ede562c8335f22073b4cc5535001d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzii5tzomh7zsty3"
Content-Disposition: inline
In-Reply-To: <f8ede562c8335f22073b4cc5535001d4@kernel.org>


--jzii5tzomh7zsty3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-next
 tree
MIME-Version: 1.0

On Wed, May 06, 2026 at 11:55:55AM +0200, Thierry Reding wrote:
> Hi all,
>=20
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>=20
> between commit:
>=20
>   5164f7e7ff8e ("drm: Rename struct drm_atomic_state to drm_atomic_commit=
")
>=20
> from the drm-next tree and commit:
>=20
>   3c108046e1d6 ("drm/amd/display: Add power module on Linux")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. It looks
> like this is pretty much what's in the amdgpu tree, modulo some
> whitespace changes. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Looks like I forgot to adjust the new functions for the renaming change
of drm_atomic_commit, so I've added a merge fix for this today.

Thierry

--jzii5tzomh7zsty3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn7FgcACgkQ3SOs138+
s6En2RAAowkufmYuy+CE9sbC40DhEiBCLnl84s89faPJ4AFzX0NStRTvwzMh/wC2
5xerC53Iu2qnYq4B61EU16AA8k+L5G1DD4wkhxletvdCRuQRtf3HRFol/Px2/bGG
WPM4coPAGGaVULEor7BJ7wFPT3dlbhqBU1dLijptaP596eb6lAhc3xaVjG8Ahpiu
i2gvxBaznvh1g5IQ7woDsvA6hp17ssylP9tKQ2NyWCau01tn7+VSzAfoBukLJdsC
+tMBxXNmAD57b05lAi/nIyk+76yZExIshXLT1PRTF5F3Ig7/P+54n4A7VLl2AqSw
vQTPqai9Pr4Lip5BDCMqx8vjbHjvehF1hktHB+JFGKxgIw9tVsm5LqKttKZ/ttsg
23h+Tyg0Vsisz2gaW4+UW6nj1CkafWRLo3bGjNw9PSTTZVZv9V6RGilUF/qc1ojq
aGz6hPe82mwbYSrxGSPJvqMNQTE/aUzchN2zP28CXi3ps8EM4tQ+Ib3IfFRjoaXd
uFzeJ6Syjj1qANyTFuTqg4sZlykcsi9zBkWg8HGrPKsgqkf9OIJlPZQ/Xc0QleIk
9asDMnX4yDJ5MP/1d8jGN2ya2Z2gdzWz7AEeSOLl2zIu+DMz+jfvHu34iPJ6KmV+
8BkC+jJny/ku5TSOoalnG3TIILSF3AogdCn/rnDNhErckr9SIRs=
=o90Q
-----END PGP SIGNATURE-----

--jzii5tzomh7zsty3--
