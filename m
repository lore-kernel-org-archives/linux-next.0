From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build warning
Date: Thu, 8 Oct 2009 15:27:25 +1100
Message-ID: <20091008152725.1351485a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Oct_2009_15_27_25_+1100_+Pmt_soVCwyp6Dyq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34563 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751040AbZJHE2K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Oct 2009 00:28:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

--Signature=_Thu__8_Oct_2009_15_27_25_+1100_+Pmt_soVCwyp6Dyq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next build (powerpc allnoconfig) produced this warning:

WARNING: drivers/pci/built-in.o(.devinit.text+0x86a): Section mismatch in r=
eference from the function pci_init() to the variable .init.data:pci_dfl_ca=
che_line_size
The function __devinit pci_init() references
a variable __initdata pci_dfl_cache_line_size.
If pci_dfl_cache_line_size is only used by pci_init then
annotate pci_dfl_cache_line_size with a matching annotation.

Introduced by commit b20dd110d21aac94b3f4063cffbcf9718656ce51 ("PCI:
determine CLS more intelligently").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Oct_2009_15_27_25_+1100_+Pmt_soVCwyp6Dyq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrNai0ACgkQjjKRsyhoI8xg0ACfTLrfHSh3czsu9ZE4v8f+Dmzd
MfQAnjmbn7NM4muoIA/J318T74lW8Oa8
=mTe2
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Oct_2009_15_27_25_+1100_+Pmt_soVCwyp6Dyq--
