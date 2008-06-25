From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Wed, 25 Jun 2008 16:44:48 +1000
Message-ID: <20080625164448.fdb43e57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_16_44_48_+1000_DCgTBpji.9cvMnQ1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42669 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751085AbYFYGo7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 02:44:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Denys Vlasenko <vda.linux@googlemail.com>

--Signature=_Wed__25_Jun_2008_16_44_48_+1000_DCgTBpji.9cvMnQ1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig (CONFIG_UNUSED_SYMBOLS
is not set, but CONFIG_MODVERSIONS is set)) failed like this:

kernel/module.c: In function 'load_module':
kernel/module.c:2084: error: expected expression before ')' token

Caused by commit 29ec97e82935397e13e7e7f3db75111e9937931c
("module:shrink-struct-module") from the rr tree.

I applied the patch below which should be merged in with the above commit
if possible (or something like it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From b790b16878f90c9ee23f8569bf6246c0ec258562 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 25 Jun 2008 16:40:44 +1000
Subject: [PATCH] rr fix patch 1

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

---
 kernel/module.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index a4bdd77..ceae92b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2076,9 +2076,9 @@ static struct module *load_module(void __user *umod,
 #ifdef CONFIG_MODVERSIONS
 	if ((mod->num_syms && !crcindex) ||
 	    (mod->num_gpl_syms && !gplcrcindex) ||
-	    (mod->num_gpl_future_syms && !gplfuturecrcindex) ||
+	    (mod->num_gpl_future_syms && !gplfuturecrcindex)
 #ifdef CONFIG_UNUSED_SYMBOLS
-	    (mod->num_unused_syms && !unusedcrcindex) ||
+	    || (mod->num_unused_syms && !unusedcrcindex) ||
 	    (mod->num_unused_gpl_syms && !unusedgplcrcindex)
 #endif
 		) {
--=20
1.5.5.4


--Signature=_Wed__25_Jun_2008_16_44_48_+1000_DCgTBpji.9cvMnQ1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh6WAACgkQTgG2atn1QN/AbwCfbwYf6+MXvIfwDVMsaBiEIBHh
Z+4An1m2BEVPEpzBvajOYC2uVdBOosXz
=7bOW
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_16_44_48_+1000_DCgTBpji.9cvMnQ1--
