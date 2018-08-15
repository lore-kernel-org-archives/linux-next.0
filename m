From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kbuild tree
Date: Thu, 16 Aug 2018 09:55:30 +1000
Message-ID: <20180816095530.5b3c9ecb@canb.auug.org.au>
References: <20180803183653.4d394bcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WhVJZ.73GqrZNRLQbxG=4.T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180803183653.4d394bcf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/WhVJZ.73GqrZNRLQbxG=4.T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 Aug 2018 18:36:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   lib/Kconfig.debug
>=20
> between commit:
>=20
>   06ec64b84c35 ("Kconfig: consolidate the "Kernel hacking" menu")
>=20
> from the kbuild tree and commit:
>=20
>   bbd89226bb66 ("fs/buffer.c: add debug print for __getblk_gfp() stall pr=
oblem")
>=20
> from the akpm-current tree.
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
> diff --cc lib/Kconfig.debug
> index 46f755a60872,01ec99f1cf2e..000000000000
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@@ -1729,10 -1713,9 +1727,9 @@@ config KPROBES_SANITY_TES
>   	bool "Kprobes sanity tests"
>   	depends on DEBUG_KERNEL
>   	depends on KPROBES
> - 	default n
>   	help
>   	  This option provides for testing basic kprobes functionality on
>  -	  boot. A sample kprobe, jprobe and kretprobe are inserted and
>  +	  boot. Samples of kprobe and kretprobe are inserted and
>   	  verified for functionality.
>  =20
>   	  Say N if you are unsure.
> @@@ -1851,12 -1820,8 +1844,11 @@@ config TEST_HAS
>   	  This is intended to help people writing architecture-specific
>   	  optimized versions.  If unsure, say N.
>  =20
>  +config TEST_IDA
>  +	tristate "Perform selftest on IDA functions"
>  +
>   config TEST_PARMAN
>   	tristate "Perform selftest on priority array manager"
> - 	default n
>   	depends on PARMAN
>   	help
>   	  Enable this option to test priority array manager on boot
> @@@ -2062,6 -2018,8 +2045,12 @@@ config IO_STRICT_DEVME
>  =20
>   	  If in doubt, say Y.
>  =20
> + config DEBUG_AID_FOR_SYZBOT
> +        bool "Additional debug code for syzbot"
> +        default n
> +        help
> +          This option is intended for testing by syzbot.
> ++
>  +source "arch/$(SRCARCH)/Kconfig.debug"
>  +
>  +endmenu # Kernel hacking

This is now a conflict between Linus' tree and the akpm-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WhVJZ.73GqrZNRLQbxG=4.T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0vXIACgkQAVBC80lX
0GxqSwgAmOSJNo/nYCfFHZbZr7ytCrplrCElefErP1QoQ3j+2Xc41Hs76EqbW+OL
bTB4zIphHd1B297WS0qjUpE/ZaBHESJl8+d8qDUn9/BrVfQSwGUtV49ZU6MlyhBD
8Lw2Ev597TwxDqw1w6Ay7BKDi9sfXfiIhO5POwr/a20cuTWXhnDLat3a4ZTYKmLg
XS9VQ/jwtAnCXu3VEjejg7NrU7aBOaVAvkRn2yErZ4jpLiLzQ0h5ZpItBrj5AiRf
l/ZVMt8G8ZlR1bC5V7ByMYV4j24NQzexX3EWniU9qSWVFzKwPHtmSMAm+Hfm7kkV
5vJrEGyApqDCWglIsxQGITZ6JZnNIg==
=qcvH
-----END PGP SIGNATURE-----

--Sig_/WhVJZ.73GqrZNRLQbxG=4.T--
