From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Wed, 23 Jul 2008 12:51:53 +1000
Message-ID: <20080723125153.aab7ac10.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_12_51_53_+1000_Mx8mXCA3saJLh8II"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58296 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752108AbYGWCwE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 22:52:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Yong Wang <yong.y.wang@linux.intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Wed__23_Jul_2008_12_51_53_+1000_Mx8mXCA3saJLh8II
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
drivers/pci/dmar.c between commit
f42e86d95fa53d3a62b2795515da18b4f41b0480 ("PCI/DMAR: don't assume
presence of RMRRs") from the pcu-current tree (the qeuivalent of which is
in the x86 tree) and commit aaa9d1dd63bf89b62f4ea9f46de376ab1a3fbc6c
("x64, x2apic/intr-remap: use CONFIG_DMAR for DMA-remapping specific
code") from the x86 tree.

I did the obvious fixup (which is to take the x86 tree version).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_12_51_53_+1000_Mx8mXCA3saJLh8II
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGnMkACgkQjjKRsyhoI8zXkQCfQG0KXMv1F6KIJwmEF0vWfVO9
YAoAn34mNKKI12eFJUOu7/Rf8UWHlpyX
=cdFt
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_12_51_53_+1000_Mx8mXCA3saJLh8II--
