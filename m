From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 30 Jun 2008 15:59:12 +1000
Message-ID: <20080630155912.ef5a1204.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_15_59_12_+1000_U1d5Dy5/fxB6W5MR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43899 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752408AbYF3F7Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 01:59:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Zhao Yakui <yakui.zhao@intel.com>, Li Shaohua <shaohua.li@intel.com>

--Signature=_Mon__30_Jun_2008_15_59_12_+1000_U1d5Dy5/fxB6W5MR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len, Ingo,

Today's linux-next merge of the acpi tree got a conflict in
Documentation/kernel-parameters.txt between commits "ACPI : Create
"idle=3Dnomwait" bootparam" and "ACPI: Create "idle=3Dhalt" bootparam"
different version of which appear in the x86 and acpi trees ("ACPI :
Create "idle=3Dnomwait" bootparam" in the acpi tree is different from the
version that was in that tree on Friday (thus this conflict comes up
again)).

Please sort this out ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_Jun_2008_15_59_12_+1000_U1d5Dy5/fxB6W5MR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhodjAACgkQjjKRsyhoI8xHwgCcDBoRHPRLDdF4O2NQ18bt31JE
na0An2RNm+IQ+S7h9wAUMWyM23GXicvO
=KImC
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_15_59_12_+1000_U1d5Dy5/fxB6W5MR--
