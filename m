From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
Date: Mon, 23 May 2011 14:56:46 +1000
Message-ID: <20110523145646.62152db5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_May_2011_14_56_46_+1000_KYNl6v5yCwUy06W6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55929 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750755Ab1EWE4t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2011 00:56:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__23_May_2011_14_56_46_+1000_KYNl6v5yCwUy06W6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

fs/ubifs/super.c: In function 'mount_ubifs':
fs/ubifs/super.c:1432: error: implicit declaration of function 'dbg_msg'
fs/ubifs/replay.c: In function 'set_bud_lprops':
fs/ubifs/replay.c:144: error: implicit declaration of function 'dbg_msg'
fs/ubifs/commit.c: In function 'ubifs_bg_thread':
fs/ubifs/commit.c:296: error: implicit declaration of function 'dbg_msg'

Caused by commit 327fdae87979 ("UBIFS: switch to dynamic printks").  This
build does not have CONFIG_UBIFS_FS_DEBUG set.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_May_2011_14_56_46_+1000_KYNl6v5yCwUy06W6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN2ekOAAoJEDMEi1NhKgbs4V0H/Rb+ZD/B55P/XLNg7JGonlKV
ZgNs2IXbY6+u38lQS0xLg57s3twPOKBE9NfbuPZS2FbsnpvmM9vulvzVNIHvJcc9
8/2WLGziMKPLNPt7PeERtADUTPSxLTlrJxVPGvEne9PaetrvOnuT0rCBrw8G/DWW
8WbjbnHrWbs5nbPUEniWHSKJp8ssuHXyyF4ddiXaEFeTqBVHU9ZMQi165RsY4EDc
+Y3ybE86Anuac7eB+eUGz1iMYZ0d2AoT9XMp2XnccAaD2quay9rtvzwMbMLTPOG3
hyCszZURoA6n1Zk2Cr8x57DrhKeXjnabBGaEG9j2d+WzsRroOLw6iQSjd85jcXM=
=TNQE
-----END PGP SIGNATURE-----

--Signature=_Mon__23_May_2011_14_56_46_+1000_KYNl6v5yCwUy06W6--
