From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the slave-dma tree
Date: Thu, 13 Sep 2018 12:22:18 +1000
Message-ID: <20180913122218.0fb31482@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a=1Z73gZHiu.ccaUFaLIjJi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Angelo Dureghello <angelo@sysam.it>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/a=1Z73gZHiu.ccaUFaLIjJi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/dma/mcf-edma.c: In function 'mcf_edma_filter_fn':
drivers/dma/mcf-edma.c:296:33: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
   return (mcf_chan->slave_id =3D=3D (u32)param);
                                 ^

Introduced by commit

  e7a3ff92eaf1 ("dmaengine: fsl-edma: add ColdFire mcf5441x edma support")

--=20
Cheers,
Stephen Rothwell

--Sig_/a=1Z73gZHiu.ccaUFaLIjJi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluZydoACgkQAVBC80lX
0GzSsQgAiwnMSowK8AeznNkbyzk1Jeph5SLBYN67OIx5H0569+2MC13a2PPIPEHx
B+9ey3N1bhEhHOtz92RAGK3dtmnL14jw2sgAb1fOWkhlb/XsxPmXIX9bWj9HLB1S
+HIkuLX9BT23mSUvkXN7fFLbiUDpZiocElhoCOl/moqyxdWMDH3nwcLjBE9xMdbR
87E4XqaLAwkq+jIM2jhBuCDDVzY0skMMfPV1v0i3UaLcigBCevotcMOr/gQ+lMGl
4phvnpslKgtwpJQxXWAIv8HcYE8sjfDzPNY24wOOer0dKiAGs6uQJTRcJKLtrqlk
moCEETtgLIGjkMfggpQDCjEoZJqKyw==
=Cwva
-----END PGP SIGNATURE-----

--Sig_/a=1Z73gZHiu.ccaUFaLIjJi--
