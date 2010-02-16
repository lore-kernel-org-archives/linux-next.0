From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge final merge
Date: Tue, 16 Feb 2010 18:36:50 +1100
Message-ID: <20100216183650.e82c0f8e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Feb_2010_18_36_50_+1100_ZAjB4NcvfYgGhZVX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39892 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754456Ab0BPHg4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Feb 2010 02:36:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>, David Miller <davem@davemloft.net>

--Signature=_Tue__16_Feb_2010_18_36_50_+1100_ZAjB4NcvfYgGhZVX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

After merging, today's linux-next build (sparc64 defconfig) failed like
this:

arch/sparc/kernel/pci.c: In function 'pci_cfg_fake_ranges':
arch/sparc/kernel/pci.c:404: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:419: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:450: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c: In function 'apb_fake_ranges':
arch/sparc/kernel/pci.c:473: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:481: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c: In function 'of_scan_pci_bridge':
arch/sparc/kernel/pci.c:539: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:558: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:571: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c: In function 'pci_scan_one_pbm':
arch/sparc/kernel/pci.c:693: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:694: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c: In function 'pcibios_fixup_bus':
arch/sparc/kernel/pci.c:710: error: 'struct pci_bus' has no member named 'r=
esource'
arch/sparc/kernel/pci.c:711: error: 'struct pci_bus' has no member named 'r=
esource'

Cause by commit 94a8887c501b22a2818ee58197864e9eab983510 ("PCI: replace
bus resource table with a list") from the pci tree.  I don't know why I
didn't notice this failure yesterday.

I have reverted that commit and the following 4 commits from the pci tree
for today:

6b673390ae99fbaeeafc40a6e42ba97e1beada0b "x86/PCI: use host bridge _CRS
	info by default on 2008 and newer machines"
6776104e550aa6600549e204865cb3d4ed29e04e "PCI: make disabled window
	printk style match the enabled ones"
a0266ed60a7ac8ce5c97d860cd927ba542325cb4 "PCI: break out
	primary/secondary/subordinate for readability"
0c2a8aaaba0d1a16a468cf48ba2fec6139d20a66 "PCI: reference bridge window
	resources explicitly"

Jesse, can you please remove these commits from the pci tree until the
above problem is fixed.

OK, I just checked the build results for last night
(http://kisskb.ellerman.id.au/kisskb/head/2579/) and there are quite a few
more (alpha, some arm, parisc and more ...) ... please fix them up as
well.  Try something like:

git grep -l -w resource $(git grep -l -w 'struct pci_bus')

for a starting list of files to check.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Feb_2010_18_36_50_+1100_ZAjB4NcvfYgGhZVX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkt6SxIACgkQjjKRsyhoI8zdQQCfdG8TN3ZeH522gQ7TGHInw2AA
/Z4An19BpJkrm1g7BtNgWQv/AwS9uxqa
=JyKn
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Feb_2010_18_36_50_+1100_ZAjB4NcvfYgGhZVX--
