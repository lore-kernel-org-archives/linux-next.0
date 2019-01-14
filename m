From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the cisco tree with the vfs tree
Date: Tue, 15 Jan 2019 09:33:30 +1100
Message-ID: <20190115093330.1cbb0625@canb.auug.org.au>
References: <20181002162923.13f3f8b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//A=/GjsJxw4P=Epi8/=Qf3V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002162923.13f3f8b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <dwalker@fifo99.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_//A=/GjsJxw4P=Epi8/=Qf3V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 2 Oct 2018 16:29:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the cisco tree got a conflict in:
>=20
>   arch/x86/kernel/setup.c
>=20
> between commit:
>=20
>   dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless ex=
plicitly enabled")
>=20
> from the vfs tree and commit:
>=20
>   2c070709ea75 ("This updates the x86 code to use the CONFIG_GENERIC_CMDL=
INE")
>=20
> from the cisco tree.
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
> diff --cc arch/x86/kernel/setup.c
> index e493202bf265,ee109f490b22..000000000000
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@@ -51,7 -51,7 +51,8 @@@
>   #include <linux/kvm_para.h>
>   #include <linux/dma-contiguous.h>
>   #include <xen/xen.h>
>  +#include <uapi/linux/mount.h>
> + #include <linux/cmdline.h>
>  =20
>   #include <linux/errno.h>
>   #include <linux/kernel.h>

This is now a conflict between the cicso tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//A=/GjsJxw4P=Epi8/=Qf3V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw9DjoACgkQAVBC80lX
0GwNVQf/S0pWebPpo5F/IIino/Ko3GWl61ufOLwrj5mEgOxgGfI76sW6tV5YLZjL
4J2JzKwU9KF5vf/dwZE9LLE38HDEQnUI9iUT6TsJPQs7aUsgSWTvTPqWI1dSdg7l
tSYBmKRy+cpwiPpfcg5WIM+A0EKxKHo/dkceKbc3WSV9Oh4gnOXvmhdhoPlo8DuD
k1L+uWP+qbStHF7ejDFLKa50t3VGZ6zW/Qd7Ml0EI8atMl70XwvxVMZ+xZFl01FT
cN7Mgz8Cbcu8kJRCMJcD8gP/bGZ3eE20sZgnULWyJzpo/aDKVtBN68zjAXZMZ2mq
IBoWByOz8BwMGqaH5sbg4AT9/A1nCg==
=N42Y
-----END PGP SIGNATURE-----

--Sig_//A=/GjsJxw4P=Epi8/=Qf3V--
