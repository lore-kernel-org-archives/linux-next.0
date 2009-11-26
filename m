From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree with the pci tree
Date: Thu, 26 Nov 2009 13:22:28 +1100
Message-ID: <20091126132228.85a63dee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_13_22_28_+1100_Cs5qTllUSoBF7ZAK"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754414AbZKZCWf@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lin Ming <ming.m.lin@intel.com>, Bob Moore <robert.moore@intel.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, Jesse Barnes <jbarnes@virtuousgeek.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__26_Nov_2009_13_22_28_+1100_Cs5qTllUSoBF7ZAK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
drivers/pci/hotplug/acpiphp_glue.c between commit
204d49a5613a06eb2fa5c3b842a29b1336cc7995 ("PCI hotplug: move IOAPIC
support from acpiphp to ioapic driver") from the pci tree and commit
2263576cfc6e8f6ab038126c3254404b9fcb1c33 ("ACPICA: Add post-order
callback to acpi_walk_namespace") from the acpi tree.

The former moved part of the code modified by the latter into another
file.  All the calls to acpi_walk_namespace() seem to have been removed
in this process.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_13_22_28_+1100_Cs5qTllUSoBF7ZAK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEARECAAYFAksN5mQACgkQjjKRsyhoI8xoggCeL/udiBiXy3SyGBowWqQ3IZbI
ijYAljn0WNVzNIAUmy2a0Y90xwvysu8=
=bjSp
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_13_22_28_+1100_Cs5qTllUSoBF7ZAK--
