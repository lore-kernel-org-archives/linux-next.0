From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the userns tree with the vfs tree
Date: Wed, 20 Jun 2018 13:31:06 +1000
Message-ID: <20180620133106.7d71897a@canb.auug.org.au>
References: <20180620114441.285f5dfa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/f=cgb/d5A/o9FV+=IlwwX6d"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620114441.285f5dfa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/f=cgb/d5A/o9FV+=IlwwX6d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Jun 2018 11:44:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the userns tree got a conflict in:
>=20
>   fs/proc/internal.h
>=20
> between commit:
>=20
>   0223e0999be2 ("procfs: Move proc_fill_super() to fs/proc/root.c")
>=20
> from the vfs tree and commit:
>=20
>   04035aa33a12 ("proc: Don't change mount options on remount failure.")
>=20
> from the userns tree.
>=20
> diff --cc fs/proc/internal.h
> index ea8c5468eafc,69fa8d953cde..000000000000
> --- a/fs/proc/internal.h
> +++ b/fs/proc/internal.h
> @@@ -270,10 -252,16 +270,15 @@@ static inline void proc_tty_init(void)=20
>   /*
>    * root.c
>    */
> + struct proc_mount_options {
> + 	kgid_t pid_gid;
> + 	int hide_pid;
> + };
> +=20
>   extern struct proc_dir_entry proc_root;
>  -extern int proc_parse_options(char *options, struct proc_mount_options =
*opts);
>  =20
>   extern void proc_self_init(void);
>  -extern int proc_remount(struct super_block *, int *, char *);
>  +extern int proc_reconfigure(struct super_block *, struct fs_context *);
>  =20
>   /*
>    * task_[no]mmu.c

The struct proc_mount_options was removed by my later merge resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/f=cgb/d5A/o9FV+=IlwwX6d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlspynoACgkQAVBC80lX
0GwkRQf/cIck6KaSZ5ZDw/E5HhZgFpsk00RhAgPtM2cs19faMnp6P3LUNI0ynVGm
sfZUnRWL3D5iyDJab7DCCqSbHod4cnkmi9VTHEHyEANX9ayfedsYICG+BSgm8nTW
lX79gNDxTr79gacwnaJ2H/BcnUztIUemBAaeZy0XDPvPS75Q1HGaLWIkozJqErIR
fONXwHAKxGzpeUSQJyXe3wFk1gupfoFLwWE49+RVs2ntfscjmMqAZ6zy3HXyApKH
oiL+PUNbcuc6A07QxWr9u0tdR87945QPae4Y3lAeL1oOqBF6v4IOtxDLx3Oxre29
kybGDAvErjL2f3uIspxlUgb71mgoow==
=KVfB
-----END PGP SIGNATURE-----

--Sig_/f=cgb/d5A/o9FV+=IlwwX6d--
