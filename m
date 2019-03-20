From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Wed, 20 Mar 2019 11:48:51 +1100
Message-ID: <20190320114851.2b677117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N5SU8aPv._dTQOE9WqmASGV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Smart <jsmart2021@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Dick Kennedy <dick.kennedy@broadcom.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N5SU8aPv._dTQOE9WqmASGV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/scsi/lpfc/lpfc_debugfs.c:46:
drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_idiag_queacc_write':
drivers/scsi/lpfc/lpfc_sli4.h:1083:14: error: inlining failed in call to al=
ways_inline 'lpfc_sli4_qe': function body not available
 inline void *lpfc_sli4_qe(struct lpfc_queue *, uint16_t);
              ^~~~~~~~~~~~
drivers/scsi/lpfc/lpfc_debugfs.c:4488:12: note: called from here
   pentry =3D lpfc_sli4_qe(pque, index);
            ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/scsi/lpfc/lpfc_debugfs.c:46:
drivers/scsi/lpfc/lpfc_sli4.h:1083:14: error: inlining failed in call to al=
ways_inline 'lpfc_sli4_qe': function body not available
 inline void *lpfc_sli4_qe(struct lpfc_queue *, uint16_t);
              ^~~~~~~~~~~~
drivers/scsi/lpfc/lpfc_debugfs.c:4488:12: note: called from here
   pentry =3D lpfc_sli4_qe(pque, index);
            ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  9afbee3d62a4 ("scsi: lpfc: Reduce memory footprint for lpfc_queue")

I applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Mar 2019 11:44:21 +1100
Subject: [PATCH] scsi: lpfc: remove inappropriate inline

Fixes: 9afbee3d62a4 ("scsi: lpfc: Reduce memory footprint for lpfc_queue")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/lpfc/lpfc_sli4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli4.h b/drivers/scsi/lpfc/lpfc_sli4.h
index bd5b5c3de35e..6670c6e7e28d 100644
--- a/drivers/scsi/lpfc/lpfc_sli4.h
+++ b/drivers/scsi/lpfc/lpfc_sli4.h
@@ -1080,4 +1080,4 @@ int lpfc_sli4_post_status_check(struct lpfc_hba *);
 uint8_t lpfc_sli_config_mbox_subsys_get(struct lpfc_hba *, LPFC_MBOXQ_t *);
 uint8_t lpfc_sli_config_mbox_opcode_get(struct lpfc_hba *, LPFC_MBOXQ_t *);
 void lpfc_sli4_ras_dma_free(struct lpfc_hba *phba);
-inline void *lpfc_sli4_qe(struct lpfc_queue *, uint16_t);
+void *lpfc_sli4_qe(struct lpfc_queue *, uint16_t);
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/N5SU8aPv._dTQOE9WqmASGV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyRjfMACgkQAVBC80lX
0GxeLQf/QV3B/Pfu+mu/5UjVBgaWjQmP0diYpYTjL0FJmK6+gdLxwOtrD9IoDDOO
dEI/PImPkDFlaIBCuAAyDuOnRuQ8S8HstR5RKNrDD9EL3gn7geRMoPblrK8nmn5z
XVXVEyZ/mwynqW3snVZh4C0ixKcEQgFHMCeNVXaVmZ8f+gAxgeVay1sBwZ2SyG9h
5LwNw4mUkGPGUD1tXRM/P7m88EDlRlgW93nm73LLIqimNOViyqLe1g44kMc56sR0
w8xRl9ftuCaz4piTtd+MTisDtmzN+/yZV64rNUM+n1mgRl1DQXIu4Kws32Jn34B0
L8jSoia5UrnJG5GdXl1PBabLc7cpqA==
=AH4e
-----END PGP SIGNATURE-----

--Sig_/N5SU8aPv._dTQOE9WqmASGV--
