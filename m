From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with the arm-soc
 tree
Date: Wed, 18 Mar 2015 12:03:47 +1100
Message-ID: <20150318120347.21288162@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2F0H_Dfwkn+dUH5l/aEkIDQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2F0H_Dfwkn+dUH5l/aEkIDQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Today's linux-next merge of the slave-dma tree got a conflict in
arch/arm/mach-shmobile/board-mackerel.c between commit a521422ea4ae
("ARM: shmobile: mackerel: Remove Legacy C board code") from the
arm-soc tree and commit c078c62a7528 ("mmc: sh_mobile_sdhi: remove
sh_mobile_sdhi_info v2") from the slave-dma tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2F0H_Dfwkn+dUH5l/aEkIDQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCM7zAAoJEMDTa8Ir7ZwVJ8kQAIyA6RWSfK5ooCKYQ4xKwqL1
E9dhkcUIKIHKYN185XmVNrkyfCFmSWC6/hfWAO971zPPQ0p89WMLKKBSl/XnyVd7
a5/U1v8c3g/KJy/218c+Regpitvl1bae1YEn1EF2K0k81Rf6IY4y+APhILmIrrEF
/D+466izBKZCfa7DLnwTxIlgZRw3GDyXmRYwRdxpV/8/o5uQYdcE9AoKCNVGb8ml
coe5zVgYr2lz80X9n609PGIro/sRwFdaXKd1wSUSegKGZ55gUz2wf+YiEvfw8SGq
tiPci+XYcBcpfHSlfLduhCFm3dYsFx4e0+zaPl06lULcjiqXfT5/jGiwPiDbKtZh
hFtWB3sn5Rwd83YoBhCZv5HuFEN6opBcpjj2Jj7hE0uGu0njPDpsVPJH+kvG1FSI
/3q8O3l2V/M2g7a6iEZdDpcQ2CrWQS45Z7wcq4OZirgN1R2EjkHNUY8w7ZENw/Ii
daThJjE8rJ7j7XivzZlg/rSKK7nybEIWGVmGMQiQ7HmQ5opioDFQHd4VHXk2HLff
XylgSodFBL3eYirv4fCwChzXlN6kVabCkMvBaRHQCaEhyn84Wkl/HJDb7tR5SQGw
0Dqs/Czi4kSKSVwwY0/wfl3gbDyBSJd9RXluhiciXHXDMdo0FfP47vso+inqCqhF
0b9MqDuxv+tjtXntkc7S
=dcdY
-----END PGP SIGNATURE-----

--Sig_/2F0H_Dfwkn+dUH5l/aEkIDQ--
