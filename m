From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Date: Wed, 1 Aug 2018 10:42:27 +1000
Message-ID: <20180801104227.7e52b06d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/29FLhPHXSNImZfmVC35++5m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hari Vyas <hari.vyas@broadcom.com>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/29FLhPHXSNImZfmVC35++5m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pci.h

between commit:

  44bda4b7d26e ("PCI: Fix is_added/is_busmaster race condition")

from the pci-current tree and commit:

  1e4511604dfa ("PCI/AER: Expose internal API for obtaining AER information=
")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/pci.h
index 08817253c8a2,ba078145bfaa..000000000000
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@@ -301,16 -306,34 +307,44 @@@ static inline bool pci_dev_is_disconnec
  	return test_bit(PCI_DEV_DISCONNECTED, &dev->priv_flags);
  }
 =20
 +static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
 +{
 +	assign_bit(PCI_DEV_ADDED, &dev->priv_flags, added);
 +}
 +
 +static inline bool pci_dev_is_added(const struct pci_dev *dev)
 +{
 +	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
 +}
 +
+ #ifdef CONFIG_PCIEAER
+ #include <linux/aer.h>
+=20
+ #define AER_MAX_MULTI_ERR_DEVICES	5	/* Not likely to have more */
+=20
+ struct aer_err_info {
+ 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
+ 	int error_dev_num;
+=20
+ 	unsigned int id:16;
+=20
+ 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
+ 	unsigned int __pad1:5;
+ 	unsigned int multi_error_valid:1;
+=20
+ 	unsigned int first_error:5;
+ 	unsigned int __pad2:2;
+ 	unsigned int tlp_header_valid:1;
+=20
+ 	unsigned int status;		/* COR/UNCOR Error Status */
+ 	unsigned int mask;		/* COR/UNCOR Error Mask */
+ 	struct aer_header_log_regs tlp;	/* TLP Header */
+ };
+=20
+ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *i=
nfo);
+ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
+ #endif	/* CONFIG_PCIEAER */
+=20
  #ifdef CONFIG_PCI_ATS
  void pci_restore_ats_state(struct pci_dev *dev);
  #else

--Sig_/29FLhPHXSNImZfmVC35++5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlthAfMACgkQAVBC80lX
0GxaAwf40DMgIHhrN88na26PGrtfmuK6MUDvUNx50N/GLFGDnyN+4IcF5cn9uKpA
K1xWUGQLM5xR9aHeeQJEwJgE8UhzSDOpGYPJOJPkeiLCN40ieuPIX4dMFmPwwf1d
bhQMg01065InQexBrvLNUlGG7Fijvwwv5o4mHH5OMpzSY0t7oWz3K3/BxTesNpmJ
K+SKJEmAerbd8jkFKesU7OD8fQKrUsWrF9Ti3wrKxinWYMD0D3/NWssYTrYcNyCI
s4fB85+0xlll0s0ZtJwFPVd0YHhGl+2IpeCoZ8VpIbDJFhOO70PxgFw5Y+pp5Rmh
scnQz8hiJlzTEhb+QMmscJPu3SqC
=KNlr
-----END PGP SIGNATURE-----

--Sig_/29FLhPHXSNImZfmVC35++5m--
