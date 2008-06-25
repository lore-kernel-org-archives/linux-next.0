From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 14:20:34 +1000
Message-ID: <20080625142034.59b343c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_14_20_34_+1000_gchESuH.=Hv/lQrg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44072 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751590AbYFYEUs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 00:20:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_14_20_34_+1000_gchESuH.=Hv/lQrg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/srat_32.c between commit
9920a004626a2dc2980693d634e4000f086cb283 ("x86: use acpi_numa_init to
parse on 32-bit numa") from the  tree and commit
a27557c76c6e092ec886f0e3e443f3190f0b0fcc ("ACPICA: Eliminate
acpi_native_uint type") from the acpi tree.

The code modified by the latter was removed by the former.  So I used the
former.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_14_20_34_+1000_gchESuH.=Hv/lQrg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhx5IACgkQTgG2atn1QN9z/QCdGrC73H4g6nihT1PyT0c+b3Mf
f6MAn12DZV4F/DQMRkekGR9tzyuuZHW0
=dw/P
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_14_20_34_+1000_gchESuH.=Hv/lQrg--
