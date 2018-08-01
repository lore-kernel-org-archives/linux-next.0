From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 179 boots: 11 failed, 167 passed with 1
 offline (next-20180731)
Date: Wed, 1 Aug 2018 10:31:02 +0100
Message-ID: <20180801093102.GB5509@sirena.org.uk>
References: <5b607cc4.1c69fb81.6c1d6.6534@mx.google.com>
 <20180731161114.GI5719@sirena.org.uk>
 <20180731195037.GA6737@centauri.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5445021089124919195=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180731195037.GA6737@centauri.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linux-arm-msm@vger.kernel.org, David Brown <david.brown@linaro.org>, linux-next@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============5445021089124919195==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 31, 2018 at 09:50:37PM +0200, Niklas Cassel wrote:

> I guess it could be a bug that does not trigger on every boot,
> or it could be a problem in the kernelci infrastructure.

Infrastructure bugs *tend* to manifest differently to this FWIW, though
it can never be excluded.

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlthfdUACgkQJNaLcl1U
h9AnYQgAhGKxeexWBE+yqBUWnCqrVsLVYqZEQIce0Rwt4hpJdm/HAedNdJP2G/qM
kFf457xXaRqa7+Ub+fPo98hZtFeODGbg/iKa2987nja7GDNrvHob2OClrrBAvYB4
jNgb7i14fXhll3YlPIKGEYy2aCVzGZlw6kTnaLdHAu4+tAx6Qboe/a0BTkUusksv
rNKR0Eh5qtDA2ob0KCMh8nMFJgXwCEBZhHJaoRj5XzlbprACVDjwtSE3zEYsdD7q
p+CPqdtT5sQeffHolXFKQH1/rdAG5UOhg+0c2MjIDA2pP4t/bVWFl91cbdYNyyO6
HJ5REgVbylEM2Id+regTXyPRt2M7Mw==
=xxhS
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--


--===============5445021089124919195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5445021089124919195==--
