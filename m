From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input tree
Date: Thu, 19 Aug 2010 11:35:45 +1000
Message-ID: <20100819113545.ee9d52ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Aug_2010_11_35_45_+1000_HRAkn.R+dF_M97nU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59535 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751262Ab0HSBfz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Aug 2010 21:35:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Pemberton <wfp5p@virginia.edu>

--Signature=_Thu__19_Aug_2010_11_35_45_+1000_HRAkn.R+dF_M97nU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

After merging the input tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/usb/serial/ssu100.c:599: warning: passing argument 1 of 'usb_serial=
_handle_sysrq_char' from incompatible pointer type
include/linux/usb/serial.h:345: note: expected 'struct usb_serial_port *' b=
ut argument is of type 'struct tty_struct *'
drivers/usb/serial/ssu100.c:599: warning: passing argument 2 of 'usb_serial=
_handle_sysrq_char' makes integer from pointer without a cast
include/linux/usb/serial.h:345: note: expected 'unsigned int' but argument =
is of type 'struct usb_serial_port *'
drivers/usb/serial/ssu100.c:599: error: too many arguments to function 'usb=
_serial_handle_sysrq_char'

Caused by commit 0c870dc9828fee03abd60b441f9025a1b4e3d3e6 ("USB: drop tty
argument from usb_serial_handle_sysrq_char()") interacting with
52af954599396e5945a895035525c703f2761b20 ("USB: add USB serial ssu100
driver") from Linus' tree.

I have used the input tree from next-20100818 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_Aug_2010_11_35_45_+1000_HRAkn.R+dF_M97nU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMbIpxAAoJEDMEi1NhKgbsh5UIAJILfJD/xhyvbJpsHnhKVufw
NeYkckx3+GW51kvgYRiWCdKzAd3fIxyrxNbhzw5BDY5j9dv1NFQHYkXBHkKdwnqM
i4qMv7JIHwnRFSpUpxiZ9jwhoYMG0n9pajD/MqA3+nd445PbqRB68rJfpFgldmn9
ParaE2Ygqr3YMDkZaZessjAIeLsNZaERiS5zejdLd49mGE7R9qy9XQvla9oTx5jK
15wi8+gUD8+iffZqt6nUpoMIFb6T+9qxetOmvtuLBayhbGR2A/1z5Goe8adRRer6
qWyN6cfC3LLdn2u8r9B0nUrGTYKkgl5ruQLJcnH8Bpv0Em9iQB0hbu06dUlQvxQ=
=MM70
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Aug_2010_11_35_45_+1000_HRAkn.R+dF_M97nU--
