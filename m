Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4B24C06A;
	Tue,  5 May 2026 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989452; cv=none; b=nlWioCYiMyQze/nLrlbL6PxoUHYUYo1eJGKZ7Mvcw66Vstsy/8JgC4QWjLsEFpa4fIDrJpA+/yEK51DT6x5yVx1rtOaF3YRhQQ56c1HZe5QkDt0Q3h5r7Zf40orFX6ssNi6jq+lmq2Pbxbse7Zccr6ub+B3L/mA0U8wXYS2MigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989452; c=relaxed/simple;
	bh=8dywiaSKmoezUvoX5saN4XMix7oUF8wWRzfdNwWsav0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJLLVkS724EgP5Kzzylu+7GU9XETbUEUqOVgMIRjAuEZuNba+4yZa1aoZKcHyRq+uzCz15SKZUUe0Tr2PhZ7MG9fFxXDDZ+1ux3A1kDd+8npQAIu1Dg6PByySSgsJZcZtJosCoz/sA6MvEA1aDZkto63eLvga1l2V3/BLcI35yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3q27XzX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3q27XzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40674C2BCB4;
	Tue,  5 May 2026 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989451;
	bh=8dywiaSKmoezUvoX5saN4XMix7oUF8wWRzfdNwWsav0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3q27XzXN09F/lpGJYGUXqNzHgCwvt6bvRaReW/o9+kaILL1XHAaULYRxT9UaIooM
	 g9fTcz7rYELYZiQPBDVxOfLv9TxNbRvSnkg4fP7fMo0j3/fr6lSIlgkIOb7B3PJxXh
	 S68+VP1KgmCVxOJ1V0C5DFBQyu42QMIfPP6ADDJiAGkMtCvHR8dqXKpM9PE5oiSLh2
	 wSgGVAZGbQmtpwi4tRIa2KcQS+bP90jxmC3yP/W6pRBRfC8G4r+5Xtf8Owkh1TbC+2
	 JumS6jMPA7oST5INBdg5JSnJvDqdYe2OR1S66jweoARBzFUx01mU3+NMFBFgJIq3EL
	 WThDdoMYumtUw==
Date: Tue, 5 May 2026 15:57:29 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: omission of the nfc tree
Message-ID: <afnugiRnPPMCIxO6@arch.a226c7d-lcedt>
References: <e06a424df9659ec00dc929be6f50ac51@kernel.org>
 <6d26fbb6-3885-47b5-bfba-6c84bcc42f89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncmniyjvbnmgdidi"
Content-Disposition: inline
In-Reply-To: <6d26fbb6-3885-47b5-bfba-6c84bcc42f89@ixit.cz>


--ncmniyjvbnmgdidi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: omission of the nfc tree
MIME-Version: 1.0

On Tue, May 05, 2026 at 11:47:10AM +0200, David Heidelberg wrote:
> Hello Thierry,
>=20
> sorry about that, should be fixed (rebased against -rc2 now).
>=20
> Is there strong insensitive to use -rc1? In case it causing additional wo=
rk,
> I can stick with rc1.

-rc2 is fine, too. Anything from Linus' tree should be fine, really,
since Linus' tree is the base for linux-next.

The idea is that you should pull in only as much as necessary to reduce
dependencies and complexity. If you need to pull in some other tree (to
satisfy a dependency, for example, always make sure to work with the
corresponding maintainer to ensure they keep the branch that you pull in
stable (i.e. don't rebase it), otherwise things will get ugly and we
start pulling multiple versions of the same commits, etc.

Thierry

--ncmniyjvbnmgdidi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn590UACgkQ3SOs138+
s6Fh7Q/+ItePsp50jDWMcAR9DSAUFtzsIB9t3nGWf/KQ/fxjmMXF0+iLRGGWDpcP
IjXpgdB1R3Wb0lKZXu4Z0fCg/i9UK1og+cskh6bNGdoMmR2iJwa2W8LzG9oKiiTG
ZEiqme86LQuwq/+89jZsQ8oXjjs/IPls3AOGv3LKZnhp6q/c5nqRQfb8HAyd4QwP
UeL/9VC5yLRYMnwdY6cUJ+ey7uEWl3s56fOmlHJU3S0uQBwpsHCfiEMvl+4sz0Lo
EFrpZ+Pi/hcU6p/A24i0uSR6srLrYmANNyJUFFJBqx1mqJxwziC5gTJ5nzc2E4n3
fsRDE59Z9ZIe9YJUFsl9robO6T74S859tOJW/iC7+/AnJ69oq+PXs3+u/8SVcaaY
Lvzcl1MbueQgvpU+QmWVyo2Vr5NTd+4NxYOtmUoMbbYsUhwjGSN4fUEYloZDG7TF
QGdJADbiDXnfnu0X5aNXpbKLmqX9G7MrgddtacD7i0WvyEICib/3ysMRga+F6yka
c76Iewge38yieWIFdpuWG71dn4WcuQqKXPcUUnsGLwEiEJhCcKoFtboLVfuUDoRD
VNGEcNewf2VsRl8iB4bKKOXnxbEG/g8fEzTUYgYbZii3PfiOPSLNynnoFNjMnP4W
01p7npSC3Ys5FC53w3X4sedVVKoGxYG9bdjboQX9FxTj/Ts6pzI=
=zGP/
-----END PGP SIGNATURE-----

--ncmniyjvbnmgdidi--
