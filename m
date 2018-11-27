From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 27 Nov 2018 22:50:13 +1100
Message-ID: <20181127225013.133adc7d@canb.auug.org.au>
References: <20181127115246.00967523@canb.auug.org.au>
        <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YkvK3WE_k3dKyW++C4mhphL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/YkvK3WE_k3dKyW++C4mhphL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ondrej,

On Tue, 27 Nov 2018 09:53:32 +0100 Ondrej Mosnacek <omosnace@redhat.com> wr=
ote:
>
> Hm... seems that there was some massive overhaul in the VFS code right
> at the wrong moment... There are new hooks for mounting now and the

The mount changes have been in linux-next since before the last
release ...

> code that our commit changes is now here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/tree/securit=
y/selinux/hooks.c?h=3Dfor-next#n3131
>=20
> It seems that the logic is still the same, just now our patch (or the
> VFS one) needs to be updated to change the above line as such
> (untested pseudo-patch):
>=20
> - if (fc->purpose =3D=3D FS_CONTEXT_FOR_KERNEL_MOUNT)
> + if (fc->purpose =3D=3D (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBM=
OUNT))

OK, so from tomorrow I will use that merge resolution.  Someone needs
to remember to tell Linus about this when the latter of the vfs and
selinux trees reach him.

Thanks for the better resolution.
--=20
Cheers,
Stephen Rothwell

--Sig_/YkvK3WE_k3dKyW++C4mhphL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv9L3UACgkQAVBC80lX
0Gy73Af+MA5I4pLotm7nRlo1YtazY/j8g8wiiIn/ewKfi/HgHZEXAsLK7omb0d1O
H5t/0RchuJyjKwS9jaSWUBOXINtRA6jxuGWcn8pEDtuczu4nRMeZIai2T3a7Vq4F
woTD1xt96C93n9cAn1KsJFouVWN/gUjl4MeW082bo56dPNx1t5E5pFSlGHb9v0Fh
WnG2AHugu1gcODBR7cUbpj80pEnPYjHK2Mqar9G7EV16kV0HY2h9uVFb/hunQFfn
5re+JPAMBLYJOZEvDFnfErCzshMkcAQpGkc/LICbfYczD3hxGJhMmp5VzbfpQ1lt
DfLrTCSMY8SApGzyP1ZCs0jdqS72cA==
=HX9m
-----END PGP SIGNATURE-----

--Sig_/YkvK3WE_k3dKyW++C4mhphL--
