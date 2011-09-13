From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the openrisc tree with Linus' tree
Date: Tue, 13 Sep 2011 12:11:25 +1000
Message-ID: <20110913121125.57aff757d1cfe59a117ee3f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Sep_2011_12_11_25_+1000_WG8ZaGTbomJriE8h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:48453 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693Ab1IMCLe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Sep 2011 22:11:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonas Bonn <jonas@southpole.se>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__13_Sep_2011_12_11_25_+1000_WG8ZaGTbomJriE8h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

Today's linux-next merge of the openrisc tree got a conflict in
arch/openrisc/kernel/signal.c between commit d7cb66670905 ("openrisc:
don't use pt_regs in struct sigcontext") from Linus' tree and commit
ddf54eaa745b ("openrisc: don't use pt_regs in struct sigcontext") from
the openrisc tree.

Two slightly differentl versions of the same change.  I used the version
in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Sep_2011_12_11_25_+1000_WG8ZaGTbomJriE8h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJObrvNAAoJEDMEi1NhKgbsMRUH/jnbn5LjN69b1q14w5KSzDU7
vkAuAJ0QvU76bXUTT9hHouQlSvxk0slcmNBh/2O7uBG0JweaIkfpkPufgWRM8M5p
GWHtUo1wTrv18B44p1NNnLf/kMsP7uc/UURCfYgqS0hiXL303NU5zRNRAT7jOyuE
mUSZpcN9Cd21NhYKywfj7jsYyfexA/O4ZY29QOL8F2I2BmujEblbe2khvYfLp4+9
euFcc73ggLAS9T1Q0WEGxw+u5cnKFwFhZvcYB00HCVBhdXoB2XRMTrsBq6hyZWaE
Xsawk982aSBNJx2zkEk/xfO+CWb1KpSdsdWm6qI2iYxQkNwnGzN6JQEv4grBRjs=
=bW/r
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Sep_2011_12_11_25_+1000_WG8ZaGTbomJriE8h--
