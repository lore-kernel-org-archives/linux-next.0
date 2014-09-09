From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 9 Sep 2014 23:39:52 +0100
Message-ID: <20140909223952.GL2601@sirena.org.uk>
References: <20140908183350.5a4e357c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GcxvFOCtgbxoSrcp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59886 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbaIIWk2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Sep 2014 18:40:28 -0400
Content-Disposition: inline
In-Reply-To: <20140908183350.5a4e357c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>


--GcxvFOCtgbxoSrcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 08, 2014 at 06:33:50PM +1000, Stephen Rothwell wrote:

> drivers/regulator/rk808-regulator.c:312:18: warning: 'struct rk808_board' declared inside parameter list
>            struct rk808_board *pdata)

Chris, as previously requested please send me any changes needed to
update for the changes in the MFD driver.

--GcxvFOCtgbxoSrcp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUD4G0AAoJECTWi3JdVIfQ1H4H/R6HNDQ19wS2b0Zi4ZxFlCpf
Bdyo8/by1EZUW+0jq6y2XLHHxQ/BPd/tXK/9QmMbmmUD/zCS/S3mNwkBmbYrxKXb
t6m8Iy/vwnpfZZOMo9NwnbiwlUmSIWuyGXoNDKk5ACu+8xpu0zWuOFH6P5ERtIJx
ciAVZKmBrN127U90ZhP78jhpd3iL/5Rc7aWgixlsb51PwSb8EYOHCuamuHFLN93j
+TvvrFNPYS5e6y1bkqgTRWzoGg90+e3iNN0/cl+7lbvu+C0XxdsfjEh7qIKqeF1q
q1vpCtJ/KIX0L4LP1uepyvFA5xFGpxYwOYyAqMVzCHH79ZF0xfZlzc4HfPsXwaQ=
=Ya+u
-----END PGP SIGNATURE-----

--GcxvFOCtgbxoSrcp--
