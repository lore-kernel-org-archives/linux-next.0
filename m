From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi/cpus4096 merge conflict
Date: Thu, 12 Jun 2008 13:50:32 +1000
Message-ID: <20080612135032.b5d0c684.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jun_2008_13_50_32_+1000_5MDyE15wVpdkYePy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54111 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750699AbYFLDul (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 23:50:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Mike Travis <travis@sgi.com>

--Signature=_Thu__12_Jun_2008_13_50_32_+1000_5MDyE15wVpdkYePy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a trivial conflict in
drivers/acpi/processor_throttling.c between commit
141ad0688adb53094d6f75b39b4b3b0625de0e07 ("acpi: use performance variant
for_each_cpu_mask_nr") from the cpus4096 tree and commit
08a4ab4a5fd58438840524ce22199c6bbd05816f ("ACPI: change processors from
array to per_cpu variable") from the acpi tree.

It is just a context conflict and I did the obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Jun_2008_13_50_32_+1000_5MDyE15wVpdkYePy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhQnQgACgkQTgG2atn1QN9Z8QCfSZ2vj2DkX5Xw5BbM86TJh6za
aUIAn3o1HKbLd/g/qh4rpviRUm2puQ6V
=+Iz5
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jun_2008_13_50_32_+1000_5MDyE15wVpdkYePy--
