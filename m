From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the v4l-dvb tree
Date: Mon, 7 Dec 2009 15:33:36 +1100
Message-ID: <20091207153336.58c56059.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Dec_2009_15_33_36_+1100_n.BnQSF=42zzSLSC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38882 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934475AbZLGEdf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2009 23:33:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Andy Walls <awalls@radix.net>, Mauro Carvalho Chehab <mchehab@redhat.com>

--Signature=_Mon__7_Dec_2009_15_33_36_+1100_n.BnQSF=42zzSLSC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/media/video/cx18/cx18-mailbox.h between commit
368cb90a38d346d76cd32d882fbc620fc01e4102 ("V4L/DVB (13429): cx18: Add
Memory Descriptor List (MDL) layer to buffer handling") from the v4l-dvb
tree and commit 6070d81eb5f2d4943223c96e7609a53cdc984364 ("tree-wide: fix
misspelling of "definition" in comments") from the trivial tree.

I fixed it up (see below) and can carry the fix as necessary.  It is very
trivial, though. :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/media/video/cx18/cx18-mailbox.h
index 5ea0735,522ad53..0000000
--- a/drivers/media/video/cx18/cx18-mailbox.h
+++ b/drivers/media/video/cx18/cx18-mailbox.h
@@@ -39,9 -39,9 +39,9 @@@
  struct cx18;
 =20
  /*
 - * This structure is used by CPU to provide completed buffers information
 - * Its structure is dictrated by the layout of the SCB, required by the
 + * This structure is used by CPU to provide completed MDL & buffers infor=
mation.
 + * Its structure is dictated by the layout of the SCB, required by the
-  * firmware, but its defintion needs to be here, instead of in cx18-scb.h,
+  * firmware, but its definition needs to be here, instead of in cx18-scb.=
h,
   * for mailbox work order scheduling
   */
  struct cx18_mdl_ack {

--Signature=_Mon__7_Dec_2009_15_33_36_+1100_n.BnQSF=42zzSLSC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkschaAACgkQjjKRsyhoI8yw3gCggCKiZ7n/9T9D6GxInX6WRnGI
3a4AoMC4moPGVWjgS2y0lKyAkLVKe/mH
=MP2+
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Dec_2009_15_33_36_+1100_n.BnQSF=42zzSLSC--
