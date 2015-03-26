From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc-mpe tree
Date: Thu, 26 Mar 2015 13:29:48 +1100
Message-ID: <20150326132948.3feecd0c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DbJCKynVm6I/4kI1UEH+Ub2"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35226 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750819AbbCZC3y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2015 22:29:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neelesh Gupta <neelegup@linux.vnet.ibm.com>

--Sig_/DbJCKynVm6I/4kI1UEH+Ub2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc-mpe tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


In file included from arch/powerpc/platforms/powernv/setup.c:36:0:
arch/powerpc/include/asm/opal.h:214:17: error: 'enum OpalMessageType' decla=
red inside parameter list [-Werror]
          struct notifier_block *nb);
                 ^

Caused by commit d7cf83fcaf1b ("powerpc/powernv: Move opal-api.h closer
to the Skiboot version") interacting with commit b921e90260ce
("powerpc/powernv: Add OPAL message notifier unregister function") from
the powerpc tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Mar 2015 13:25:58 +1100
Subject: [PATCH] powerpc/powernv: fix for OpalMessageType name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/opal.h       | 2 +-
 arch/powerpc/platforms/powernv/opal.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opa=
l.h
index d430ec7e60c6..c08de77f398a 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -210,7 +210,7 @@ extern int opal_notifier_unregister(struct notifier_blo=
ck *nb);
=20
 extern int opal_message_notifier_register(enum opal_msg_type msg_type,
 						struct notifier_block *nb);
-extern int opal_message_notifier_unregister(enum OpalMessageType msg_type,
+extern int opal_message_notifier_unregister(enum opal_msg_type msg_type,
 					    struct notifier_block *nb);
 extern void opal_notifier_enable(void);
 extern void opal_notifier_disable(void);
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms=
/powernv/opal.c
index 2c590e69a928..d403b2b08626 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -318,7 +318,7 @@ int opal_message_notifier_register(enum opal_msg_type m=
sg_type,
 				&opal_msg_notifier_head[msg_type], nb);
 }
=20
-int opal_message_notifier_unregister(enum OpalMessageType msg_type,
+int opal_message_notifier_unregister(enum opal_msg_type msg_type,
 				     struct notifier_block *nb)
 {
 	return atomic_notifier_chain_unregister(
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/DbJCKynVm6I/4kI1UEH+Ub2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE28gAAoJEMDTa8Ir7ZwVZX8P/0RAwKl56rI8bQ5xZ1GwBIon
9cTebSNCgLSpWNT1KUemArW53oHKpwHcda5vdy1zF4R44PBjOwF/P46jmM8DlvSH
V9mE+uiGhipj3CXCWgNLNjJIbOcnhp3AlipMwTpc2xNNUQqWQ7EfdpLEDNtwDnC9
JmhKATQGwtDbZY/lpt6tetYuuouVpYTo8kqJ9ye2ZizC3YKRJWxfZaz7tyjXmwqa
Y2n9dRQzlgy+IjepvZanQBJjxNbYwiwHxtvn0hODk+c9BaLqOVTv5xTexNqcHugF
w+185JGeD4Lf01MwJB6JZcBdyZN0hBawUbJJ6cOsjTn9cQY5G6Dm5HK1J/LPkxnc
knAF3EWQf1K+durncJy4H7LZN92sH8X0knAGSZmDci3iwV3EPEozGUFPHKPf6tT9
vTXRkfl4gt2ASAGPCiiTWHEBv9RROMiKhSj28KYEtL6tr8g7Ypip2WeRN6WAjmoV
9+3WJEKDmCjNBSbLJhtxTZGT15aLRoFPOShmPey4Cyyxh2wMkvL7pYceVatiKq+C
vbNg6UzQAbVWqmtkXY/Cyz3DC5i7VacoAxd0RSg3eNmPG0FTdibciGdoICr9iqd8
tKlRuKWnO7SMi27PHUu0syaM+bVHpvbPWn7SKBZvr6QlJ2nyPDpUz7VHiqKSV0Ur
l2G8/QofRweN1zZIUJAk
=TEqV
-----END PGP SIGNATURE-----

--Sig_/DbJCKynVm6I/4kI1UEH+Ub2--
