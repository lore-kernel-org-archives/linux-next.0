From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20190129 build: 2 failures 14 warnings (next-20190129)
Date: Tue, 29 Jan 2019 19:27:28 +0000
Message-ID: <20190129192728.GL10524@sirena.org.uk>
References: <E1goXtl-0000g3-1h@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7900468397243466736=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1goXtl-0000g3-1h@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============7900468397243466736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline


--2feizKym29CxAecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 29, 2019 at 06:14:13PM +0000, Build bot for Mark Brown wrote:

-next has been failing to build allmodconfig for a few days on arm and
arm64

> Failed defconfigs:
> 	arm64-allmodconfig
> 	arm-allmodconfig

due to:

drivers/usb/phy/phy-fsl-usb.o: In function `fsl_otg_ioctl':
phy-fsl-usb.c:(.text+0x5e4): undefined reference to `otg_statemachine'
drivers/usb/phy/phy-fsl-usb.o: In function `fsl_otg_start_srp':
phy-fsl-usb.c:(.text+0x680): undefined reference to `otg_statemachine'
drivers/usb/phy/phy-fsl-usb.o: In function `fsl_otg_set_host':
phy-fsl-usb.c:(.text+0x800): undefined reference to `otg_statemachine'
drivers/usb/phy/phy-fsl-usb.o: In function `fsl_otg_start_hnp':
phy-fsl-usb.c:(.text+0x88c): undefined reference to `otg_statemachine'
drivers/usb/phy/phy-fsl-usb.o: In function `show_fsl_usb2_otg_state':
phy-fsl-usb.c:(.text+0xa44): undefined reference to `usb_otg_state_string'
drivers/usb/phy/phy-fsl-usb.o: In function `a_wait_enum':
phy-fsl-usb.c:(.text+0x1718): undefined reference to `otg_statemachine'
drivers/usb/phy/phy-fsl-usb.o: In function `fsl_otg_set_peripheral':
phy-fsl-usb.c:(.text+0x1f20): undefined reference to `usb_gadget_vbus_disconnect'
phy-fsl-usb.c:(.text+0x1f40): undefined reference to `otg_statemachine'

The issue is that USB_OTG_FSM is tristate but FSL_USB2_OTG is a bool so
we end up with a built in driver depending on a module.  Unfortunately I
can't see why this triggered now.  Neither file nor their Kconfig has
changed for quite some time so I guess we lost some other config that
was forcing USB_OTG_FSM to be built in.

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxQqR8ACgkQJNaLcl1U
h9B2gAf/aF5XluCGY6x5ZE0x2s6s5ekDl8lGXbuHJ//7q9Nu0Asb6R04QZMsiZ0E
pKxuaqa3TIqslr3k9cnNAR0SkHAn1k5YYg3KsE/pNScO0CAP7h2zT11vpip83mps
uZDNRtmz6tJc5pqT39lrqxHDao+JezhyuPxwzTRd/XxeUtcUlZ4++UG69dIiRTq2
KLbUoek4hSvcaJ3EiDhNPVjddW56zfcTbrJoZn2Upfpi5OO70gIGjCnmiwHTB3RW
Sc5OELD2nP3ll8R+BaF+BKbV5h5vV5b3kv2Ebz4W4Hk3r7QKSa3KmbUkx35QeGVe
H2ZMQRNwt3qf9hHTHzKMuYxUhQhB/w==
=V/4V
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--


--===============7900468397243466736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7900468397243466736==--
