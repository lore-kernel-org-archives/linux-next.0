From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 4 Oct 2018 15:44:38 +1000
Message-ID: <20181004154438.64f9d8c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YCPojftoRel_Sj9/MM3eZ0c"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>
List-Id: linux-next.vger.kernel.org

--Sig_/YCPojftoRel_Sj9/MM3eZ0c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/dma/fsl-edma.c:67: warning: "EDMA_SEEI_SEEI" redefined
 #define EDMA_SEEI_SEEI(x) ((x) & 0x1F)

In file included from drivers/dma/fsl-edma.c:25:
drivers/dma/fsl-edma-common.h:21: note: this is the location of the previou=
s definition
 #define EDMA_SEEI_SEEI(x) ((x) & GENMASK(4, 0))

 ...

drivers/dma/fsl-edma.c:115:6: error: nested redefinition of 'enum fsl_edma_=
pm_state'
 enum fsl_edma_pm_state {
      ^~~~~~~~~~~~~~~~~
drivers/dma/fsl-edma.c:115:6: error: redeclaration of 'enum fsl_edma_pm_sta=
te'
In file included from drivers/dma/fsl-edma.c:25:
drivers/dma/fsl-edma-common.h:63:6: note: originally defined here
 enum fsl_edma_pm_state {
      ^~~~~~~~~~~~~~~~~

and so on ...

Caused by commit

  101d256a45ed ("Merge branch 'testing/dirn_remove' into next")

which reintroduced a whole lot of stuff into drivers/dma/fsl-edma.c that
had been modev out in commit

  9d831528a656 ("dmaengine: fsl-edma: extract common fsl-edma code (no chan=
ges in behavior intended)")

I used the slave-dma tree from next-20181003 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YCPojftoRel_Sj9/MM3eZ0c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu1qMYACgkQAVBC80lX
0GzQZwf+N7ov5mEqgHd2zxDeUnbUp1F9dbFm55OyikJ46v3KGNWvXdS603YCAsQx
2WVTImr9gL9gLxUFh+em6A83GEnbphHtOx6IywadJtRrm2pGl/hEVYYJiBIPBwL/
KqBnKgLLllEhqndK/q8/FL1h5y7JBQls2L70TODqJpdcwUldRKGkDSAuzfqhMNVO
vdy9RlBttU27e5pJjYhC+GqBiGIh+7F9vc6XyrJK2g0+KtXhLTyjenFwOj3iwTws
FyW4N3iIUPbYl+FayMxoAQHmwveX4uetYbLbxahhlc97qhiFZlUuO/R3Ce1udURz
7f0u0JqeRIgmF7GxTS/sZdqLAHzTWg==
=CrCk
-----END PGP SIGNATURE-----

--Sig_/YCPojftoRel_Sj9/MM3eZ0c--
