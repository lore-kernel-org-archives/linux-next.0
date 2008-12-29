From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 30 Dec 2008 01:10:55 +1100
Message-ID: <20081230011055.d2f6ced2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Dec_2008_01_10_55_+1100_3gD+6bOuF3x/kllY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48656 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753692AbYL2OLA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 09:11:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Tue__30_Dec_2008_01_10_55_+1100_3gD+6bOuF3x/kllY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
drivers/usb/core/usb.c between commit
6e7b5429a08fe4f71c336710bd45acdce6cd3df7 ("USB: don't use
__module_param_call") from the usb tree and commit
9634765245cd7aba71328c71813ca882d008632d ("USB: Don't use
__module_param_call; use core_param") from the boot-params tree.

Two different versions of the same change?  I fixed it up (used the
boot-params tree version) and can carry the fix as necessary.  It sounds
like Greg should drop the patch from the usb tree (or pick up the version
from the boot-params tree).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Dec_2008_01_10_55_+1100_3gD+6bOuF3x/kllY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklY2m8ACgkQjjKRsyhoI8zwSgCfZCB+jgWCFCnifd57Y2z3g+bW
ceUAoKoJ0BnFl8RA+UFva6B65XrEvte0
=6PRl
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Dec_2008_01_10_55_+1100_3gD+6bOuF3x/kllY--
