From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mips tree with the kbuild tree
Date: Fri, 3 Aug 2018 16:42:52 +1000
Message-ID: <20180803164252.5f519701@canb.auug.org.au>
References: <20180803092100.7d0fda13@canb.auug.org.au>
        <20180803064128.GA1715@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//6Qid3F994UQa5_AbKl8lym"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803064128.GA1715@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>
List-Id: linux-next.vger.kernel.org

--Sig_//6Qid3F994UQa5_AbKl8lym
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, 3 Aug 2018 08:41:28 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Aug 03, 2018 at 09:21:00AM +1000, Stephen Rothwell wrote:
> > I fixed it up (see below) =20
>=20
> I can't find any fixup below..

Sorry about that - see below.

--=20
Cheers,
Stephen Rothwell

fdd83c534b114febc41ec115449cb25f421e1719
diff --cc arch/mips/Kconfig
index 06a633eb9777,642a56e2a1ea..2af13b162e5e
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -2990,6 -2988,13 +2984,9 @@@ config PGTABLE_LEVEL
  	default 3 if 64BIT && !PAGE_SIZE_64KB
  	default 2
 =20
+ config MIPS_AUTO_PFN_OFFSET
+ 	bool
+=20
 -source "init/Kconfig"
 -
 -source "kernel/Kconfig.freezer"
 -
  menu "Bus options (PCI, PCMCIA, EISA, ISA, TC)"
 =20
  config HW_HAS_EISA

--Sig_//6Qid3F994UQa5_AbKl8lym
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltj+WwACgkQAVBC80lX
0Gx4sAf9GVRiLKOf4m5j4OctetBwbUwBSZp6OJaiDy5qfgqTbyJb0NGZDoDs4mGx
RWwHJeBdvYfhhv/6Z7QVP7S2MZK96KIsQS/YMI/eFVu5BY+0rFngFwpPT10JOjwG
IRt2xloJpQ/dc8ZS3xyctEBwtJN9QAnnLSI23/rszc2hikq8HF21kj1nV989wMrJ
i2n81rXqsGkeE8SxxCPv13lzVEAIxOQoK2ZpQxoVqBzul5ewk3y2rJS6xE1dYYAB
R21r3C+3OHnTQ/uIqk2xtzQMzVSVdpndXvu/u1vVd1NN5eJS74rLJUSg1T0NUfaK
50t+BAfo7/IT3TtaRxgjO+0zpzimDg==
=jdUD
-----END PGP SIGNATURE-----

--Sig_//6Qid3F994UQa5_AbKl8lym--
