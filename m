From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for Mar 12
Date: Thu, 12 Mar 2015 10:36:40 +0000
Message-ID: <20150312103640.GL28806@sirena.org.uk>
References: <20150312165357.3ee9b796@canb.auug.org.au>
 <20150312095811.GK28806@sirena.org.uk>
 <20150312212631.1df37d57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CinbraM2ncepWOqm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150312212631.1df37d57@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--CinbraM2ncepWOqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2015 at 09:26:31PM +1100, Stephen Rothwell wrote:

> This is the error I have been getting for the past couple of days:

> sound/soc/codecs/rt5670.c: In function 'is_sys_clk_from_pll':
> sound/soc/codecs/rt5670.c:702:38: error: 'struct snd_soc_dapm_widget' has no member named 'codec'
>   struct snd_soc_codec *codec = source->codec;
>                                       ^

> The line number has changed (from 519 to 702) but the function name and
> text is the same.

> There was another error (the bad merge resolution) that is gone today.

OK, I'd only see the bad merge resolution.

> Bard Liao pointed at this patch today:
> http://mailman.alsa-project.org/pipermail/alsa-devel/2015-January/086618.html
> which is not in the sound-asoc tree I fetched today (top commit
> ddb1fb8f0089).  I just did another fetch and it didn't change.

It's there now.

--CinbraM2ncepWOqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVAWw4AAoJECTWi3JdVIfQgu0H/R2pOCPEgEQq5G2c6QPdyp7G
0PtrSkmlhK16mBVhKrkWN+TrIBw+Wzv1PGZM5cmEjFnT7BDhidCMHpjr+VOEmqmz
T0PqWdTtcHZunm/u1aseoHdV+jS1ChAaZbbRigciKSH12ElxNtREYeSgPrsOgV9C
ejCeNqH/0qQP5ncneBA/P9eWf/YSa7uivXyWAxc17l7jD+2sU9sSfDnheULJRjL5
rtbdhw5Jpjkn+BHfYaktaPCbeOqO5zVipn6vxPJ4Ne8C/dx/lldkWUFU5X5RX/hy
Sc+v3L44JTfALsyAPZ7aFzbqDDpYHp6mW546CBqZ7TwCKSXaX94UjvanTYm19N0=
=Opo2
-----END PGP SIGNATURE-----

--CinbraM2ncepWOqm--
