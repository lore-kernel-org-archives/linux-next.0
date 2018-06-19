From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 138 boots: 8 failed, 112 passed with 18
 offline (next-20180619)
Date: Tue, 19 Jun 2018 15:13:24 +0100
Message-ID: <20180619141324.GD11230@sirena.org.uk>
References: <5b290c6d.1c69fb81.fc936.98ee@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9042178545070806570=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5b290c6d.1c69fb81.fc936.98ee@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============9042178545070806570==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 07:00:13AM -0700, kernelci.org bot wrote:

Today and yesterday's -next is failing to boot on rk3399-firefly in two
configs:

>     defconfig:
>         rk3399-firefly:
>             lab-baylibre-seattle: failing since 1 day (last pass: next-20=
180615 - first fail: next-20180618)

>     defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
>         rk3399-firefly:
>             lab-baylibre-seattle: failing since 1 day (last pass: next-20=
180615 - first fail: next-20180618)

The log ends with:

[    2.629278] SWITCH_REG2: supplied by vcc3v3_sys
[    2.633030] fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detecte=
d!
[    2.633723] fan53555-reg: supplied by vcc_sys
[    2.6353|] Internal error: undefined instruction: 0 [#1] PREEMPT SMP

which is rather entertaining.=20

The pending fixes -next branch is fine.  More diagnostics can be seen
at:

	https://kernelci.org/boot/id/5b28eadb59b514636d79a877/

(that's the defconfig.)  Other boards don't seem to be affected, there's
some other boards that are failing but don't seem to be related.

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlspD4QACgkQJNaLcl1U
h9Dg6Af9HgXyMmwb5r0r/TCB1SJySqeoi5/U264YijkxmUl4QHIUbA6WYVEDlJdn
9Nq0fWHbXaAtwvi+nQnYJQDH43igEq6W/hCfbsDCfkJSLkeEpI7vPBZgo1yavGza
WKrdb5eykUtCoRp0QnscEwW+RxRpOHOdaubrKFnTDb5bzgGTou5Qbu5f7VFIRiN3
9Oz2j0OnnKFGrs7TtupXmlMIMQ2TFCL43T0xIDDBgTtgw0X+ajyLcECV6IMYaoX0
Kn2KKc0EqmtzZrYPTjUEjEJCLencVko1sNmlN8qP0T5W1WZfhb5a2dvDhsBO7Det
fx3NhZGCKgWJ2Gc5yjs1uw2EEJm8eA==
=8foL
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--


--===============9042178545070806570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9042178545070806570==--
