From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 12 Sep 2008 09:37:51 +1000
Message-ID: <20080912093751.f4a4314e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Sep_2008_09_37_51_+1000_aRVFvPbH6BCkmXkK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52697 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754950AbYIKXiI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 19:38:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Fri__12_Sep_2008_09_37_51_+1000_aRVFvPbH6BCkmXkK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
drivers/pci/intel-iommu.c between commit
cbda1ba898647aeb4ee770b803c922f595e97731 ("PCI/iommu: blacklist DMAR on
Intel G31/G33 chipsets") from the pci-current tree and commit
2ae21010694e56461a63bfc80e960090ce0a5ed9 ("x64, x2apic/intr-remap:
Interrupt remapping infrastructure") from the x86 tree.

It was a bit difficult to see how to easily fix this up, so I have
effectively reverted the pci-current commit for now (by using the x86
version of the file) but, I assume, that commit will end up in Linus'
tree soon so that the x86 guys can fix the conflict in their tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Sep_2008_09_37_51_+1000_aRVFvPbH6BCkmXkK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjJq88ACgkQjjKRsyhoI8xMUACfbNqC184swMTVRuL+VjJAcoHk
S50AnRR6dzIVrMWGpyaXIiNweaYqQ10N
=RRoS
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Sep_2008_09_37_51_+1000_aRVFvPbH6BCkmXkK--
