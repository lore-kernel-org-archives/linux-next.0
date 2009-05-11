From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dwmw2-iommu tree with the x86 tree
Date: Mon, 11 May 2009 14:46:08 +1000
Message-ID: <20090511144608.f6ed71d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__11_May_2009_14_46_08_+1000_EH.KFojKq_OL01YT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52904 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750841AbZEKEqQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2009 00:46:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Weidong Han <weidong.han@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Mon__11_May_2009_14_46_08_+1000_EH.KFojKq_OL01YT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the dwmw2-iommu tree got a conflict in
drivers/pci/intr_remapping.c between commit
937582382c71b75b29fbb92615629494e1a05ac0 ("x86, intr-remap: enable
interrupt remapping early") from the x86 tree and commit
c416daa98a584596df21ee2c26fac6579ee58f57 ("intel-iommu: Tidy up
iommu->gcmd handling") from the dwmw2-iommu tree.

The former removes the code that the latter is modifying, so I just
removed the code ("if (mode =3D=3D 0) { ... }" in iommu_set_intr_remapping).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__11_May_2009_14_46_08_+1000_EH.KFojKq_OL01YT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoHrZAACgkQjjKRsyhoI8xs6ACfesa8VnQ4AYD2ehAMX5vlFocL
HEgAoJK+xgDMKSlaZ21/av0LFB9+9Znt
=Lr+C
-----END PGP SIGNATURE-----

--Signature=_Mon__11_May_2009_14_46_08_+1000_EH.KFojKq_OL01YT--
