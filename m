From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the stackprotector tree with the x86
 tree
Date: Tue, 17 Feb 2009 12:34:35 +1100
Message-ID: <20090217123435.8929e3dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Feb_2009_12_34_35_+1100_1/BTv/mDUmtc=mMl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56945 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750939AbZBQBep (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Feb 2009 20:34:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Feb_2009_12_34_35_+1100_1/BTv/mDUmtc=mMl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the stackprotector tree got a conflict in
arch/x86/kernel/setup_percpu.c between various commits from the x86 tree
and commit 18e7651254221ad0d3cf993cce742858c4521c55 ("manual merge of
stackprotector") from the stackprotector tree.

I just used the version of this file from tip/master.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Feb_2009_12_34_35_+1100_1/BTv/mDUmtc=mMl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmaFCsACgkQjjKRsyhoI8yPswCgu+Uj6PWFUTXhfXnTAQVCvFV3
DsMAnjPjn9Lrb9quUkucoVWQhQBEGqnS
=OrHI
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Feb_2009_12_34_35_+1100_1/BTv/mDUmtc=mMl--
