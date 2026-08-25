Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28781396D25;
	Tue, 25 Aug 2026 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660056; cv=none; b=PXF5r2DG7ka4b+FBtl6nMhHcM4MTZffH1lFMh5z0K4ljicWrTGvWwg1ccmr794Jx5AgBJKJ56g+hoeGM71ONrw49exo1kAqirbeYiCf7WYVThoHXJuTRvTA+Vh8zJwuTJ0SLS4aC20AJwfF56ZxbSYZsFnFO+1H50BbICWEh5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660056; c=relaxed/simple;
	bh=ntV0FeDQEDJMGVZ1MVTPb1keJ6hRz1fJxX69JrpXVZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oQZLAQ5M0+2P/vBrPej19h4B04Y+1zg8Nc5DvqTwBgsHocwkh6T2+p6jchGXAAyHu7B5CUtwkpi6k9Fvobfo5q8dcDY9rwrmWONjQTqHsVxJzo4zhxdHgZPXn9x+Cm/gjkEhJ0pCt5miLssh17zaFYHOG/G3rr7/g0DgA4sNm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFDm/Y7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFDm/Y7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B831F000E9;
	Tue, 25 Aug 2026 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787660047;
	bh=L64oFtf5UBBzW58LUUh1p4B56O7jN7+gNmuCMW5uQww=;
	h=Date:From:To:Cc:Subject;
	b=gFDm/Y7ioJD6gLM+8U0wxK+cyCTRxKk/yhAWePePtrlmeZyL+vD9lfvzdxqkJbdTz
	 EEgAQZBjHWDRWUohMTcAqrlCgwbDjZ1B0kxi9uSECzzUJ94ENlRPza1BQMcCy5ZNgs
	 j+qDHPuoUr7AsOz5oozfqpZCS3qx0y3Vxj6eRBiDrCbMzLYKRRi8bz9k+OURTFUBqY
	 I1c5USgxohagjSgJztU1YhUCINJYPz9Wl2BTdVteaZIxwHu1TshsKpFTBSKmpxufxR
	 OluugPVRRl1lCQY71tpVqhmyDv3rvloeEeUgcwLNtl8oHPmU+lcQlo9pwdkGXQ8GUr
	 BCGvmsrnBeu8g==
Date: Tue, 25 Aug 2026 13:14:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-current tree
Message-ID: <ao2HDGjk3grFh7w9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xRUqYyEUiy/y46OY"
Content-Disposition: inline


--xRUqYyEUiy/y46OY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-current tree, today's linux-next build
(arm64 defconfig) failed like this:

ERROR: modpost: sound/core/snd-rawmidi.ko: local symbol 'snd_rawmidi_kernel=
_release' was exported=20

Caused by commit

   ab21bde6b13cd (ALSA: rawmidi: Another workaround for false-positive mute=
x lockdep warning)

I have used the tree from next-20260824 instead.

--xRUqYyEUiy/y46OY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNhwsACgkQJNaLcl1U
h9CV8Af8DzR+VENKpdrfLllqB9+3fiorv6w3Ph+yxQx/zr2pgw9VemFxmMF91dDM
lheNHIh9XjefWcinpVn0UFWMpvTzUtcyZnukf/QWqobnaluEXEvH1aUdQODRwF24
MoJZDSs5G+Sqy09UfVQve9RS++IVBxVDN9NkYMCA5LfYy5dbUN+wMKtc2ycDMW4D
DlU7RiAclvw0t2qESqOqvk6q2hIwy0iEC/izYgu+yqgUg1OLEdHyIXa9qcp7sS5D
PS1bcnQJRKhTIMleygIXJKhGV1SALGpmSidV/YmkmwVno4LoLCh/B6fwE9/pFg5Y
xx8dRVYibYA5pc9Uo3shA6zTeWZlbg==
=k3mQ
-----END PGP SIGNATURE-----

--xRUqYyEUiy/y46OY--
