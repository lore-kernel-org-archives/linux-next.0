From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the dma-mapping tree
Date: Tue, 2 Oct 2018 08:35:17 +1000
Message-ID: <20181002083517.1807848f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yz89m_hRQyoF9ou0R1hxWk1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/yz89m_hRQyoF9ou0R1hxWk1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

After merging the dma-mapping tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/base/platform.c:1182:12: warning: 'dma_default_get_required_mask' d=
efined but not used [-Wunused-function]
 static u64 dma_default_get_required_mask(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  dma_default_get_required_mask ("dma-mapping: make the get_required_mask m=
ethod available unconditionally")

It is only used in the case ARCH_HAS_DMA_GET_REQUIRED_MASK is not defined.

--=20
Cheers,
Stephen Rothwell

--Sig_/yz89m_hRQyoF9ou0R1hxWk1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluyoSUACgkQAVBC80lX
0GyNFAgApnKu/WiOJ9KOcgKaqN7lGP7creL9JROP8x03SX/3svrY6QEZJn0tR/4a
jVNROcwpP/tE1/jhrv0CobT85SuUxLETbCHkC+5BYTMXiOcOyskkBbwyjXSbSRA5
nw2nhuJGvNOj6spWJhmN9TEQK7wqLSUPLc5820Oy/pWE52KubbhDRgF8h+RvZAsd
rXERQVL2m0jSykEhxS23JKA9p0OkoR0AJZ9iZjFHwviXh5GNFMrroeaTXemoIwnz
CnPMaP7L3j04SEv5FuX6DjSTROEly6PeocTlWuAeK1mJVgkGUBa7RZJ42AV2XSjX
ENhcxPyM3YjrKYtW2rF7b99yQHH5HQ==
=fO6V
-----END PGP SIGNATURE-----

--Sig_/yz89m_hRQyoF9ou0R1hxWk1--
