From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the bluetooth tree
Date: Mon, 18 Mar 2019 10:30:25 +1100
Message-ID: <20190318103025.12221d14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VoK8rJ/=9pFlPirTxDeQ.3P"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VoK8rJ/=9pFlPirTxDeQ.3P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/bluetooth/btmtksdio.c: In function 'btmtksdio_interrupt':
drivers/bluetooth/btmtksdio.c:470:2: warning: 'old_len' may be used uniniti=
alized in this function [-Wmaybe-uninitialized]
  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          old_data, old_len, true);
          ~~~~~~~~~~~~~~~~~~~~~~~~
drivers/bluetooth/btmtksdio.c:376:15: note: 'old_len' was declared here
  unsigned int old_len;
               ^~~~~~~
drivers/bluetooth/btmtksdio.c:470:2: warning: 'old_data' may be used uninit=
ialized in this function [-Wmaybe-uninitialized]
  print_hex_dump(KERN_ERR, "err sdio rx: ", DUMP_PREFIX_NONE, 4, 1,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          old_data, old_len, true);
          ~~~~~~~~~~~~~~~~~~~~~~~~
drivers/bluetooth/btmtksdio.c:375:17: note: 'old_data' was declared here
  unsigned char *old_data;
                 ^~~~~~~~

Introduced by commit

  d74eef2834b5 ("Bluetooth: mediatek: add support for MediaTek MT7663S and =
MT7668S SDIO")

--=20
Cheers,
Stephen Rothwell

--Sig_/VoK8rJ/=9pFlPirTxDeQ.3P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyO2JEACgkQAVBC80lX
0GxFNAf/ReP9mM3KG+CGIOkr/Rj72tuecW+ZaikVqYk7wgTUPvSwlJlUXgbMFBmP
QBB8RTELrKq0+pX6deHOyFstiHY9N8Qt/u7siY2/WigNbBL9n1/nbxQoYxiKyXcp
gpY/lZJ6X9sULmCTOUEJD87v1HrrqKCL8solsX+VCNgbHQ5IB6gqTMEuTuxfK2Lj
tkop/xExYhuRbloXVmKA2PxVLgAuxPFvgfJ5iO33G3u+eWMpue8SAb0n4Roy9JRB
wffylM5ltAulhvpTz23GGNyn7RBNjN40TjkZ5ZaRzYmE50JERUpTQ86Iduji39+S
gKl8ttjFTO9vYg2pMozt5EQMD16fJg==
=Q1J2
-----END PGP SIGNATURE-----

--Sig_/VoK8rJ/=9pFlPirTxDeQ.3P--
