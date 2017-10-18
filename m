From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Wed, 18 Oct 2017 15:42:35 +0100
Message-ID: <20171018144235.onumhg5fqmboodo6@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z7s4akybno6zsaap"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58472 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdJROmj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2017 10:42:39 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>, Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allen Pais <allen.lkml@gmail.com>
Cc: linux-usb@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--z7s4akybno6zsaap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/gadget/udc/snps_udc_core.c

between commit:

  29bce57723351f63d ("usb/gadget/snps_udc_core: Convert timers to use timer=
_setup()")

=66rom the usb tree and commit:

  46b614affda8667f9 ("usb: gadget: udc: snps_udc_core: use setup_timer() he=
lper.")

=66rom the usb-gadget tree.

I fixed it up by taking the USB version and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--z7s4akybno6zsaap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnaFoACgkQJNaLcl1U
h9CUZAf8C9Vdf3S8omMzATxcEhZB+9ikyYR4yA50840BNTsIwP/VP8HjxB8se6sg
7cbWg5Zdv485NdT8g5F0yIOTuZMft6Pi3dDyT1ij+oHxV/8uf0MqDIoTS2pXvmPD
3iCErOz7ojliNy+N4fwUHFMFU00lros3w/elNMCjLCmiuf6xDu/ByRIqudeFb0+7
rLv0KShykZay79yynOeOBo+MLAluoxh22yNIg3wKZ0L0hjnohMmTryMMZV6wY9ky
uuR9pplyKrtugTR6H44e/gFrsHN30yXgKqvfmrr0tJc718P5uUy9VuVESUN5BtxL
4h9KX5uXnKQTRsMc1j367yjQqNyVZg==
=qI9B
-----END PGP SIGNATURE-----

--z7s4akybno6zsaap--
