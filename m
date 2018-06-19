From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next/master boot: 138 boots: 8 failed, 112 passed with 18
 offline (next-20180619)
Date: Tue, 19 Jun 2018 15:41:43 +0100
Message-ID: <20180619144143.GE11230@sirena.org.uk>
References: <5b290c6d.1c69fb81.fc936.98ee@mx.google.com>
 <20180619141324.GD11230@sirena.org.uk>
 <69c0adb9-b784-4f73-fcc9-ff1a01ce27c5@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9044878252603501939=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <69c0adb9-b784-4f73-fcc9-ff1a01ce27c5-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org


--===============9044878252603501939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 19, 2018 at 03:22:47PM +0100, Sudeep Holla wrote:

> Based on the logs from successful boots, I see it's CPUFreq that gets
> probed after fan53555-reg. I also see that it warns about unlisted OPPs
> in the successful boots. I guess, the undefined instruction could occur
> if there's issue with CPU DVFS(under voltage or frequency that's not
> supported). I don't have much knowledge on the platform, I am just
> guessing on the possible cause here.

Yeah, that was my guess - either an out of spec voltage/frequency was
selected or the regulator isn't able to keep up with the voltage
transition or a load spike and the power browns out.

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlspFicACgkQJNaLcl1U
h9AdfQf/dNfkB1N9RKEFrf1EqffikHJ3t+8tLpeLre+bm8w6Gjbz9ZKPOFTUYeZg
gPn6KiTRzswZj7sxNPPiul9iV5cFUCTGVR6zoyu6HrHeAm41AjAdbD5/r09xUIJ5
rGOT1q5OZAA6pTydz89eqpJMY1xpXBLCfPW9kuzBrm+xCxcKnIbOrzHn0FAPFXRd
ywzYdotGBzWHL24RJQ6Xv5M7PyiiERBvtNTxTX9ITdaPSoSNT9xXxrv8E18EBr5l
RprDYa9xOyaMelovEwCtWyPfKDKxtobAoo5yY7wBFP1SnZlL8U/iQ2+/fGMVXvjY
T6F2GKeNNAgaxMVTHhcwHU8xK4XeQA==
=uGA+
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--


--===============9044878252603501939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============9044878252603501939==--
