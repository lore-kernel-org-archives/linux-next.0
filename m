From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Tue, 14 Oct 2008 14:59:17 +1100
Message-ID: <20081014145917.708bace4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_59_17_+1100_fD0m.Bgs.7cVMVOX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59336 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756893AbYJNEmJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:42:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Tue__14_Oct_2008_14_59_17_+1100_fD0m.Bgs.7cVMVOX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/usb/Kconfig:63:error: found recursive dependency: USB -> USB_OHCI_H=
CD -> I2C -> MCU_MPC8349EMITX -> ARCH_REQUIRE_GPIOLIB -> GPIOLIB -> MFD_TC6=
393XB -> USB_ARCH_HAS_OHCI -> USB_ARCH_HAS_HCD -> MOUSE_APPLETOUCH -> USB
make[2]: *** [ppc64_defconfig] Error 1
make[1]: *** [ppc64_defconfig] Error 2
make: *** [sub-make] Error 2

Direct cause is commit 51f54ddba226b3b33f55d1be058e809fcfdc30c4 ("USB:
ohci: add support for tmio-ohci cell") which I have reverted.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_14_59_17_+1100_fD0m.Bgs.7cVMVOX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0GRUACgkQjjKRsyhoI8zOEACfQxnhEuSiKz0rEBHdglT92jOn
6KIAniVqPvjW1SGyYV3bd+SAJRlgDNNy
=XYHf
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_59_17_+1100_fD0m.Bgs.7cVMVOX--
