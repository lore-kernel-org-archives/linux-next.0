From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi tree
Date: Fri, 19 Oct 2018 15:50:34 +1100
Message-ID: <20181019155034.2cf7f864@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YhnTqcejkmKsHIn==Lt+2KQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YhnTqcejkmKsHIn==Lt+2KQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_nodelist_open':
drivers/scsi/lpfc/lpfc_debugfs.c:706:17: warning: 'nrport' may be used unin=
itialized in this function [-Wmaybe-uninitialized]
   switch (nrport->port_state) {
           ~~~~~~^~~~~~~~~~~~
drivers/scsi/lpfc/lpfc_debugfs.c:553:30: note: 'nrport' was declared here
  struct nvme_fc_remote_port *nrport;
                              ^~~~~~

I am not sure where this has come from :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/YhnTqcejkmKsHIn==Lt+2KQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvJYpoACgkQAVBC80lX
0GzAzAf/Q29BgDltr7uqPOkiypn8fnVrlkvwvHw06lO8/CXLrrLKiFIWxrzHyaTW
d46aWRHrGiu00wwhI2juf3K9w4H+yGXYGCxS8g2/GdMhoTSJucYSPzx69w81pKL1
//6Grth0xYldeHNhbIQyE0kan/5ffanJgi9OqnITaSYyTrw3Nv9Vj13Moaaqwm31
Z2r7UFiivKt2ArBNRFF637PVCO7FRNK5gVg1erJAqQLvi3SFGw9UAeRTzA8WWQlE
kD24vV3+B16t+ci9PewtLQFh8Qrc08DNta8nwmWejIdzFs1mejtz4gdtJ/Ww2Y7E
G6BP9hlwJPQ3VaBzCagHgB/7adrX/A==
=o9z7
-----END PGP SIGNATURE-----

--Sig_/YhnTqcejkmKsHIn==Lt+2KQ--
