From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Fri, 27 Mar 2015 18:48:35 +1100
Message-ID: <20150327184835.6b214809@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zdyPsVxp5bBiygYetjnfoUI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54452 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752407AbbC0Hsm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Mar 2015 03:48:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabian Frederick <fabf@skynet.be>

--Sig_/zdyPsVxp5bBiygYetjnfoUI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

In file included from include/linux/module.h:17:0,
                 from drivers/uio/uio_pdrv_genirq.c:21:
include/linux/moduleparam.h:326:22: warning: initialization discards 'const=
' qualifier from pointer target type
  static const struct kparam_string __param_string_##name  \
                      ^
drivers/uio/uio_pdrv_genirq.c:260:1: note: in expansion of macro 'module_pa=
ram_string'
 module_param_string(of_id, uio_of_genirq_match[0].compatible, 128, 0);
 ^

Introduced by commit 4d8beff2ae07 ("uio: constify of_device_id array").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/zdyPsVxp5bBiygYetjnfoUI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVFQtYAAoJEMDTa8Ir7ZwVVi8P/ihOIS4Xxl/PQdKqBi7rH76B
iVZm/4evl07WB0UBh4ScDuqXFCYXaozQkeh2BjRaPhyK9JNlHNctIT8IZM9Vgi+e
Y+tSXRFSOADT8vpUwsnGUd2m3Iioh0Cgk+53GqDnR6O01bLtv1+NDUMOhmhr1k9e
JfweIE+jypwsra3LLeRinbwi8cQ4or5+NF6JcAIXu6gZnD8CJ8aj7vgHxMFiX1X+
pEmecuMQmBWx5o7bJ+JxQBbwYVxgWa15o/VF1P9v2esbeLqwGNBD3mkjfYgVgjUG
UEbrtze4+q9fn40HzytOLgfKz7eoaaDX6siYfGqZBzyn8tmB2RFdPce+0bSe/2R/
tLXj0RL8ECrwrZb08LVVvYIC7aJ7HsDWl4oMENRLeMmu/2Ofunr3eUaDL9LEaJAT
7PBpSZm0suJtphNqYhHIIvcawqvfPidLKjEUZob5YkBdFR35E0khj5cyxetkdMsg
+q1cwj7gq2n+Zo+zxuESHHtgaqRlyHIHWVaC2rH4jAh3FFmt/dMiOi/gdqCmqtQC
oiD+6ABPAHFe3gqyDisf8VBLxIqMGAZ2k5zIFvLPb95XbBMpFJ41mj7pxBfDjPtE
5Mtk5Xox3n05lxcNdVF2F+E/DlNRK/gaIRiHBqPLjN63sSiVg+2ifVDCLVFyzw9G
hpmO0k1fUIXGdTnFa0S6
=/FHm
-----END PGP SIGNATURE-----

--Sig_/zdyPsVxp5bBiygYetjnfoUI--
