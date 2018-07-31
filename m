From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 171 boots: 6 failed, 162 passed with 3 offline
 (next-20180724)
Date: Tue, 31 Jul 2018 16:52:46 +0100
Message-ID: <20180731155246.GG5719@sirena.org.uk>
References: <5b5757ee.1c69fb81.411a5.52e2@mx.google.com>
 <20180725161151.GA340@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5662155437933321067=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180725161151.GA340@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Kevin Hilman <khilman@kernel.org>, clabbe@baylibre.com
Cc: linux-next@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============5662155437933321067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eMnpOGXCMazMAbfp"
Content-Disposition: inline


--eMnpOGXCMazMAbfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2018 at 05:11:51PM +0100, Mark Brown wrote:
> On Tue, Jul 24, 2018 at 09:46:38AM -0700, kernelci.org bot wrote:

> For a little while now the RPi B has been failing to boot using the
> bcm2835 defconfig in -next:

=2E..

> It's working fine on arm64, whatever's going on appears to be specific
> to this config (it's not getting booted with any other 32 bit configs).
> Full info and boot logs for one of the boards here:

>    https://kernelci.org/boot/id/5b58416759b514139596baae/

> it looks like it hangs somewhere shortly after or during initializing
> MMC so never makes it to the console, the tail of the failing logs looks
> like:

This went away for a day or two but it looks like it's back again I'm
afraid:

    https://kernelci.org/boot/id/5b604cd259b514364696baaa/

>=20
> | 09:18:36.332120  [    1.459801] mmc1: queuing unknown CIS tuple 0x80 (7=
 bytes)
> | 09:18:36.345711  [    1.467585] mmcblk0: mmc0:59b4 USD   7.51 GiB=20
> | 09:18:36.346169  [    1.474834]  mmcblk0: p1
> | 09:18:36.410184  [    1.539600] random: fast init done
> | 09:18:36.458065  [    1.578056] mmc1: new high speed SDIO card at addre=
ss 0001
> | 09:20:39.745370  ShellCommand command timed out.: Sending # in case of =
corruption. Connection timeout 00:04:10, retry in 00:02:05
> | 09:20:39.846848  #
>=20
> but like I say the same -next boots with arm64 defconfig.



--eMnpOGXCMazMAbfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltghc0ACgkQJNaLcl1U
h9Dtpwf+OnULeuBK0SX1ohFRq5v9m/4CAHhofBsTWxDoT3wrtgQJzaSifzd5CqkM
nLM2s1h7Rdhmp4dRgvnU9X1bJAem1gWUk8/pbbpwg+QmXi19p94xii/Ye9E+c1p3
P8CGk864rZuMn82ticA5mMq4XMlCVlttHed0koiSW2yXkh3R/xB2FP52CGR1RKtx
H1ixlvR3EIFAdl3iA5YhztqfxHp1+FfhvYs/HEMvvozP/C/PRVuz2EHwx/nnrvg5
CJM4zO/w+kFNpZZbWK7oUMZJ+erp/LQrY987mr4Xi/8SHywzJ3D9+bf/pwEgUXVG
c7mA3trhhRUJQEtiPIsbzy6jr+83tw==
=ycKm
-----END PGP SIGNATURE-----

--eMnpOGXCMazMAbfp--


--===============5662155437933321067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5662155437933321067==--
