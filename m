From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 19 Sep 2018 09:49:42 +1000
Message-ID: <20180919094847.2103082b@canb.auug.org.au>
References: <20180919073826.02370812@canb.auug.org.au>
        <20180910133525.28c5dd20@canb.auug.org.au>
        <15925.1537309041@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A3kqd4LaF7HuI/jy6GhqSpL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15925.1537309041@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/A3kqd4LaF7HuI/jy6GhqSpL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 18 Sep 2018 23:17:21 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > > After merging the vfs tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > >=20
> > > samples/vfs/test-fsinfo.c: In function 'fsinfo':
> > > samples/vfs/test-fsinfo.c:37:17: error: '__NR_fsinfo' undeclared (fir=
st use in this function); did you mean 'fsinfo'? =20
>=20
> I think the problem is that I haven't allocated system call numbers for a=
ny
> arches other than x86 - even the x86 syscall numbers are provisional unti=
l the
> patchset is taken upstream.  I'm not sure of the best way to deal with th=
is -
> make the samples dependent on the X86 arch?

But the sample programs are built with HOSTCC, so you can't depend on
ARCH (since I, for one, am cross compiling).  Maybe SUBARCH.  Better
would be to use either Kconfig's shell primitive or some make magic to
figure out if the syscall number define's are defined.

> > > samples/vfs/test-fsinfo.c:180:30: warning: format '%llx' expects argu=
ment of type 'long long unsigned int', but argument 2 has type '__u64' {aka=
 'long unsigned int'} [-Wformat=3D]
> > >   printf("\tmax file size: %llx\n", f->max_file_size); =20
>=20
> Sigh.  On powerpc __u64 is unsigned long, but on x86_64 it's unsigned long
> long.  Is it possible to shift all arches to use unsigned long long for _=
_u64?

I doubt it - that would probably cause more warnings in the arch code.
Instead, just explicitly cast it to unsigned long long.
--=20
Cheers,
Stephen Rothwell

--Sig_/A3kqd4LaF7HuI/jy6GhqSpL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluhjxYACgkQAVBC80lX
0GxW6gf/Vs35Z87tFVTKLvK3DyMWgVcJl17DclSTyVJbxE+KYVF3qyFYT9/Rvk0g
DKEu0BymA/Zn2c7Qu1KKavt6roUqOmPWyxuiIG2xTZDWf/kow38p3TmWOoUtcwvZ
uu7WFbUQIdDPF2gk8FGJwzNIpFJDTTW+LbFpbHhXAByfJfhN0/yC9/04BFsmjawW
cVz7I2V5nL1cg5Lvu52OOzZu/9Ntw0XW40gE0RPmX+Q1kPQ9lCkNvs97wwYigveH
mb+7NJkVi2ZQvFKtkpa9DaMMhipL1mN9HmlplXdjDIaSqbGlk+fn9opeZ4KyhN/e
AfPuNstm+2Gc9zRxjjULCfBsDltnVA==
=4n9x
-----END PGP SIGNATURE-----

--Sig_/A3kqd4LaF7HuI/jy6GhqSpL--
