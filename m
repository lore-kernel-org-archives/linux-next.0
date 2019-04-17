From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 18 Apr 2019 09:02:47 +1000
Message-ID: <20190418090247.2982dafd@canb.auug.org.au>
References: <20190417165321.61cd6380@canb.auug.org.au>
        <CAGXu5jKYxLe9-umda7C3iWfYFe-Thv=dL4bJQC9nU4GMGK5Wwg@mail.gmail.com>
        <CAGXu5j+9_f=5aT7x=K=Hg9LS3eQ9-dhVF18LCBfZcx+EmTO3PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/13rMavU0T_TyHpnv8t5sT_i"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5j+9_f=5aT7x=K=Hg9LS3eQ9-dhVF18LCBfZcx+EmTO3PA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/13rMavU0T_TyHpnv8t5sT_i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Wed, 17 Apr 2019 17:28:39 -0500 Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Apr 17, 2019 at 5:22 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Apr 17, 2019 at 1:53 AM Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote: =20
> > >
> > > Hi Andrew,
> > >
> > > After merging the akpm-current tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > fs/binfmt_elf.c: In function 'load_elf_binary':
> > > fs/binfmt_elf.c:1140:7: error: 'elf_interpreter' undeclared (first us=
e in this function); did you mean 'interpreter'?
> > >   if (!elf_interpreter)
> > >        ^~~~~~~~~~~~~~~
> > >        interpreter =20
> >
> > static int load_elf_binary(struct linux_binprm *bprm)
> > {
> > ...
> >         char * elf_interpreter =3D NULL;
> >
> > This is _absolutely_ a valid variable. =20

It was. However commit a34f642bccf1 from Andrew's tree changes its scope.

So there is nothing wrong with commit 3ebf0dd657ce, it is the incorrect
rebase of it on top of a34f642bccf1 that causes the build problem.

> > > Caused by commit
> > >
> > >   3ebf0dd657ce ("fs/binfmt_elf.c: move brk out of mmap when doing dir=
ect loader exec")
> > >
> > > interacting with commit
> > >
> > >   a34f642bccf1 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP")
> > >
> > > I have applied the following patch for today.
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Wed, 17 Apr 2019 16:48:29 +1000
> > > Subject: [PATCH] fix "fs/binfmt_elf.c: move brk out of mmap when doin=
g direct loader exec"
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  fs/binfmt_elf.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > > index b3bbe6bca499..fe5668a1bbaa 100644
> > > --- a/fs/binfmt_elf.c
> > > +++ b/fs/binfmt_elf.c
> > > @@ -1137,7 +1137,7 @@ static int load_elf_binary(struct linux_binprm =
*bprm)
> > >          * collide early with the stack growing down), and into the u=
nused
> > >          * ELF_ET_DYN_BASE region.
> > >          */
> > > -       if (!elf_interpreter)
> > > +       if (!interpreter) =20
> >
> > No, this is very wrong and will, I think, cause all PIE binaries to fai=
l to run. =20
>=20
> I may be wrong: I think this will cause all static binaries to see
> their brk moved very unexpectedly. All static PIE binaries will fail?

Are you sure that elf_interpreter =3D=3D NULL is not equivalent to
interpreter =3D=3D NULL by this point in the code?  Earlier if
elf_intpreter is not NULL, we have set interpreter (using open_exec)
and errored out if that fails.
--=20
Cheers,
Stephen Rothwell

--Sig_/13rMavU0T_TyHpnv8t5sT_i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly3sJcACgkQAVBC80lX
0Gy8qQgAnbt0cxYETgUrMpPGHkvUSluXfu3gIA3zlwYpzkZKmK/uRVYH0kMjKuvy
RhDFBSlhAXuMlBr+kNR+3GTB4gneNnu4kpeNdbJzzyUv7gXCBmTvPiHiwOKuMSxF
lMgEEhDdZFpbVYCPgDlWZzRIrQMAaLudt+H0yqmm7O0dkZ1EHHEyPjpZTJZgEQWU
wPITT3IaUgq0nKBM7Sr/NTGgYjbqK9xP0jiPStjvezNNSTjgUjKIGaGtnOvVfKgv
xI8EOYZB6hqeuZ3wNt8CZyok78w77o5WEUmCGxtMEDvFX5FMx/iEIUkD+JPqduGt
uPsrCEN+PnF48qWfB3KtgpBHC9cecw==
=Zg77
-----END PGP SIGNATURE-----

--Sig_/13rMavU0T_TyHpnv8t5sT_i--
