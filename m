From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Thu, 9 Apr 2015 10:35:56 +0100
Message-ID: <20150409093556.GP6023@sirena.org.uk>
References: <20150409143309.3a1fac67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PJ8DlcwO9+aeSqwG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150409143309.3a1fac67@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-next.vger.kernel.org


--PJ8DlcwO9+aeSqwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2015 at 02:33:09PM +1000, Stephen Rothwell wrote:

> After merging the regulator tree, today's linux-next build (arm multi_v7_defconfig)
> failed like this:

> drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_regulator_disable':
> drivers/gpu/drm/msm/dsi/dsi_host.c:330:4: error: implicit declaration of function 'regulator_set_optimum_mode' [-Werror=implicit-function-declaration]
>     regulator_set_optimum_mode(s[i].consumer,
>     ^

> Caused by commit a689554ba6ed ("drm/msm: Initial add DSI connector
> support") from the drm tree interacting with commit ae6e808f1574
> ("regulator: Drop temporary regulator_set_optimum_mode wrapper") from
> the regulator tree.

> This happens every time someone renames/changes an API :-(

It's *really* questionable if anyone should be using that API in the
first place, one of the reasons it's being removed is that it's really
unclear that anything would be able to successfully use it as-is.  The
easist thing might be to drop the new usage for the time being.

--PJ8DlcwO9+aeSqwG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVJkf8AAoJECTWi3JdVIfQ+2EH/iRSq2bqm52kSURY7TP+X93q
n38q1bvtdNMXSzKfEmyUZ9PuUEnWvRwBkJ3f/ZjgfegBTnlMz0ZYF00mVuuu2ddw
tiRytvVtsfdTbCFL7qWsjWHWD8k4UOP5PGXpjA29Af6E8dkmkMSqqmHTddxCdA/B
VQng9LskN/ZFio94iqik9eKnLalPoBDywmW1xW8NjWaom812yXpzDdudODqftSxV
AEqvnjRy8cWjHuK3S/akwmdTZ66fmWTMI9P3PsSbxhUPGq/dCdzo/7nWcoh20IO5
3YyzBHaJdiHZa2t7a5Rbb8lDxG35OGPIGNs+2BQIdibsLa34w0QcamuKEpQty/M=
=hkDV
-----END PGP SIGNATURE-----

--PJ8DlcwO9+aeSqwG--
