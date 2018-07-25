From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 171 boots: 6 failed, 162 passed with 3 offline
 (next-20180724)
Date: Wed, 25 Jul 2018 17:11:51 +0100
Message-ID: <20180725161151.GA340@sirena.org.uk>
References: <5b5757ee.1c69fb81.411a5.52e2@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4007293995346018456=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5b5757ee.1c69fb81.411a5.52e2@mx.google.com>
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


--===============4007293995346018456==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 09:46:38AM -0700, kernelci.org bot wrote:

For a little while now the RPi B has been failing to boot using the
bcm2835 defconfig in -next:

>     bcm2835_defconfig:
>         bcm2835-rpi-b:
>             lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0180718 - first fail: next-20180719)
>         bcm2837-rpi-3-b:
>             lab-baylibre: failing since 5 days (last pass: next-20180718 =
- first fail: next-20180719)

It's working fine on arm64, whatever's going on appears to be specific
to this config (it's not getting booted with any other 32 bit configs).
Full info and boot logs for one of the boards here:

   https://kernelci.org/boot/id/5b58416759b514139596baae/

it looks like it hangs somewhere shortly after or during initializing
MMC so never makes it to the console, the tail of the failing logs looks
like:

| 09:18:36.332120  [    1.459801] mmc1: queuing unknown CIS tuple 0x80 (7 b=
ytes)
| 09:18:36.345711  [    1.467585] mmcblk0: mmc0:59b4 USD   7.51 GiB=20
| 09:18:36.346169  [    1.474834]  mmcblk0: p1
| 09:18:36.410184  [    1.539600] random: fast init done
| 09:18:36.458065  [    1.578056] mmc1: new high speed SDIO card at address=
 0001
| 09:20:39.745370  ShellCommand command timed out.: Sending # in case of co=
rruption. Connection timeout 00:04:10, retry in 00:02:05
| 09:20:39.846848  #

but like I say the same -next boots with arm64 defconfig.

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltYoUcACgkQJNaLcl1U
h9A6tQf9HNOeWw5nmGwVbSuSkKw56/NthR5z+bKWWuInZExIjqAIYrWqCI9MHRj5
iY22wmzNRbMSkwY5PE2ECNQRg3/uHSkfBEXkbEgaWzIXzXKtwYldE/NfGmM6XeKl
HQzN+0TaSFUcviYk9uvdGqYliciZWmB/luedzOAqX+Y7TCJIG4NDE0Wcg43UAa7I
StTMWhDcxD+WWXUsbllMC5zHZMxfUOpKIGEBmoFLgUORV/DqNGHVdiP1Ysow5+rw
zPKx0gJ9wuEd2dziihUGHqFxOomdoEuMRPlh7p5kr2kyz3K0bHRYySLA/i/tpyXR
3J+ma4l9aK+BhCi5M296v5NI00/yGw==
=sGZx
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--


--===============4007293995346018456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4007293995346018456==--
