From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the pci tree
Date: Tue, 2 Oct 2018 10:26:02 +1000
Message-ID: <20181002102602.53320db6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XU1FcePTKC6WYDDLfFv5kRM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oza Pawandeep <poza@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/XU1FcePTKC6WYDDLfFv5kRM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

After merging the pci tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warning:

drivers/net/ethernet/intel/ixgbe/ixgbe_main.c: In function 'ixgbe_io_slot_r=
eset':
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:11102:6: warning: unused vari=
able 'err' [-Wunused-variable]
  int err;
      ^~~
drivers/net/ethernet/intel/i40e/i40e_main.c: In function 'i40e_pci_error_sl=
ot_reset':
drivers/net/ethernet/intel/i40e/i40e_main.c:14230:6: warning: unused variab=
le 'err' [-Wunused-variable]
  int err;
      ^~~

also from the x86_64 allmodconfig build:

drivers/dma/ioat/init.c: In function 'ioat_pcie_error_slot_reset':
drivers/dma/ioat/init.c:1255:6: warning: unused variable 'err' [-Wunused-va=
riable]
  int err;
      ^~~
drivers/net/ethernet/sfc/efx.c: In function 'efx_io_slot_reset':
drivers/net/ethernet/sfc/efx.c:3824:6: warning: unused variable 'rc' [-Wunu=
sed-variable]
  int rc;
      ^~
drivers/net/ethernet/sfc/falcon/efx.c: In function 'ef4_io_slot_reset':
drivers/net/ethernet/sfc/falcon/efx.c:3163:6: warning: unused variable 'rc'=
 [-Wunused-variable]
  int rc;
      ^~

Introduced by commit

  6dcde3e574b2 ("XXX PCI/AER: Remove pci_cleanup_aer_uncorrect_error_status=
() calls")
(good subject prefix there :-))


--=20
Cheers,
Stephen Rothwell

--Sig_/XU1FcePTKC6WYDDLfFv5kRM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluyuxoACgkQAVBC80lX
0GxBSwf+PSzcm/mq0Rgw6V4T0EYlBpzthldt/7pgK9W/0OOS31U+Kg92MGE/h3UN
i1EqTfTpn4QruIdjcYrbljHTnsODIFq3OvVasSOhuw5JPF1e5Ct/644ZmsYcWmKk
QxxHtYmLvYhuwumIr01m2EEhoawF+3gNZ8RvxiU/n7EDMW0OZeHrAICr9S1yzehf
0TmnNSTI1MKpMbRiTamF0EUmqAVQc+xiOkGy7EuTiGHsVLuK+kv4Dif5yPK+lIVq
3EkPJo1QdEstuEpED4XX5tkHLdeX3POeh2SqcRiZgOeMG5FvE92gG0uGhvCga8t2
hHAr6A8AZjw4S7nr4FIP+p9K8H6gVg==
=rsZz
-----END PGP SIGNATURE-----

--Sig_/XU1FcePTKC6WYDDLfFv5kRM--
