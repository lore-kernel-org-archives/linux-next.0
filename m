From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the dma-mapping tree with the
 kbuild tree
Date: Wed, 15 Aug 2018 09:27:53 +1000
Message-ID: <20180815092753.5a14f14f@canb.auug.org.au>
References: <20180803080856.3de8af38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fBpBRoyY02p_TT22tjA22Fa"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803080856.3de8af38@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/fBpBRoyY02p_TT22tjA22Fa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 Aug 2018 08:08:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the dma-mapping tree got a conflict in:
>=20
>   arch/nios2/Kconfig
>=20
> between commit:
>=20
>   17c46a6aff5c ("kconfig: remove duplicate SWAP symbol defintions")
>=20
> from the kbuild tree and commit:
>=20
>   25622e045a6a ("nios2: use generic dma_noncoherent_ops")
>=20
> from the dma-mapping tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/nios2/Kconfig
> index cbe1844b0657,92035042cf62..000000000000
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@@ -1,7 -1,9 +1,10 @@@
>   # SPDX-License-Identifier: GPL-2.0
>   config NIOS2
>   	def_bool y
>  +	select ARCH_NO_SWAP
> + 	select ARCH_HAS_SYNC_DMA_FOR_CPU
> + 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> + 	select DMA_NONCOHERENT_OPS
>   	select TIMER_OF
>   	select GENERIC_ATOMIC64
>   	select GENERIC_CLOCKEVENTS

This is now a conflict between Linus' tree and the kbuild tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fBpBRoyY02p_TT22tjA22Fa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzZXkACgkQAVBC80lX
0GzGbAf/YMGZ6XVviuobSbRD/J84SoMxRBAuKbshB5RxVpe56GUwsP2SJplPtKGU
nRVXr3f3Hv/4ZbDlC1lAM4kTveBFPJWSNzs7qJDG+oBTgi3DyFl9ffSTI+tYCq2/
n/bF5BadHWXXPWzsqnsjMFDTX5U4mR+AWEGh1tO9VSjEGYyT7XDEhtkhTx6r3VMb
TtNewmgRQILaYOxd7eQVSxPY4bPQr50hOqQfMgCcr5KEniUMwUwdDs41hIohIb14
sX8BeG3Nfu5X45ygg7/NN+NmqQCoZunccr8aBz/Bn/5qE2hwfFo/QeJjqF56MMIT
fsfph5ZCEVH9aDnVjSEwB/Vk+x3LKg==
=diiZ
-----END PGP SIGNATURE-----

--Sig_/fBpBRoyY02p_TT22tjA22Fa--
