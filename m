From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 19 Sep 2018 16:31:02 +1000
Message-ID: <20180919163102.1a0adefb@canb.auug.org.au>
References: <20180919094847.2103082b@canb.auug.org.au>
        <20180919073826.02370812@canb.auug.org.au>
        <20180910133525.28c5dd20@canb.auug.org.au>
        <15925.1537309041@warthog.procyon.org.uk>
        <3565.1537336860@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZJ0kv3G641rgu3qYMev8HnC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3565.1537336860@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ZJ0kv3G641rgu3qYMev8HnC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 19 Sep 2018 07:01:00 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > > I think the problem is that I haven't allocated system call numbers f=
or
> > > any arches other than x86 - even the x86 syscall numbers are provisio=
nal
> > > until the patchset is taken upstream.  I'm not sure of the best way to
> > > deal with this - make the samples dependent on the X86 arch? =20
> >=20
> > But the sample programs are built with HOSTCC, so you can't depend on
> > ARCH (since I, for one, am cross compiling).  Maybe SUBARCH.  Better
> > would be to use either Kconfig's shell primitive or some make magic to
> > figure out if the syscall number define's are defined. =20
>=20
> I meant put the dependency in the Kconfig.

Yeah, sure.  Kconfig now has the ability for that dependency to be the
result of an external program "$(shell ....)", so you could have a
script or program that checked to see if the syscall numbers are
defined and then have the Kconfig symbol(s) for the tests depend on that.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZJ0kv3G641rgu3qYMev8HnC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluh7SYACgkQAVBC80lX
0GxYPgf/bF74y30ZUjwdoFuUqy4+blmM+81kFJkuEtiNT+PQRFDjrzAxZvIGAJX+
EVNSHZAl6Wfy39W0gCGA6K0GB3YWaNYqlZXjxLPlb28Z910dCjxl44z+cDQ/0qTx
eooBlAH0z80gFw3MZqPErWf40rV0e0AuILJ6QE7o3qc7+tw6jP+3CiKJshuZFvm4
RQG54g7Zxva8Nc9180iq68ag8PtYK6f8PzHeCruLU4sDgj/hMeHUcl/EdrCJFf45
MLxBb5B+kdMUqoh3ByBp2L6GlmWhiNjH4X1veIqUL+CXlJbKyKVseAgBFutnJkbw
9vgLxBtjLIS4vcMYSNbw0Zi3Uk1PHQ==
=qN9e
-----END PGP SIGNATURE-----

--Sig_/ZJ0kv3G641rgu3qYMev8HnC--
