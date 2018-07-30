From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 30 Jul 2018 17:33:56 +1000
Message-ID: <20180730173356.694fbf4e@canb.auug.org.au>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
        <20180727190647.3525f5f7@canb.auug.org.au>
        <20180727205511.7c0f2e62@canb.auug.org.au>
        <20180727125522.GA6173@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Fiy+PxQW0/MKhR+VtiALeCT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727125522.GA6173@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Kees Cook <keescook@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Fiy+PxQW0/MKhR+VtiALeCT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Jul 2018 13:55:22 +0100 Will Deacon <will.deacon@arm.com> wrote:
>
> On Fri, Jul 27, 2018 at 08:55:11PM +1000, Stephen Rothwell wrote:
> > On Fri, 27 Jul 2018 19:06:47 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > On Fri, 27 Jul 2018 19:02:07 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote: =20
> > > >
> > > > After merging the kspp tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >=20
> > > > cc1: error: plugin stackleak_plugin should be specified before -fpl=
ugin-arg-stackleak_plugin-disable in the command line
> > > >=20
> > > > Maybe caused by commit
> > > >=20
> > > >   a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking the=
 kernel stack")
> > > >=20
> > > > I have used the kspp tree from next-20180726 for today.   =20
> > >=20
> > > Well, that obviously didn't work since the tree hasn't changed for a
> > > few days.
> > >=20
> > > I can't see what has interacted to make this happen, so I have dropped
> > > the kspp tree for today. =20
> >=20
> > Actually, it may have been caused by commit
> >=20
> >   0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")
> >=20
> > from the arm64 tree. =20
>=20
> Thanks, Stephen. I managed to reproduce this by merging for-next/kspp from
> Kees's tree and for-next/core from the arm64 tree. The failure happens wh=
en
> building the EFI stub, so the commit you mention above is almost certainly
> the culprit.
>=20
> We build the stub with the following GCC invocation:
>=20
>  gcc -Wp,-MD,drivers/firmware/efi/libstub/.efi-stub-helper.o.d  -nostdinc=
 -isystem /usr/lib/gcc/x86_64-linux-gnu/4.9/include -I./arch/x86/include -I=
./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arc=
h/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -i=
nclude ./include/linux/kconfig.h -include ./include/linux/compiler_types.h =
-D__KERNEL__ -mcmodel=3Dsmall -m64 -D__KERNEL__ -O2 -fPIC -fno-strict-alias=
ing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -DDISABLE_BRANCH_PROFILIN=
G -D__NO_FORTIFY -ffreestanding -fno-stack-protector -fplugin-arg-stackleak=
_plugin-disable   -fno-builtin      -DKBUILD_BASENAME=3D'"efi_stub_helper"'=
 -DKBUILD_MODNAME=3D'"efi_stub_helper"' -c -o drivers/firmware/efi/libstub/=
.tmp_efi-stub-helper.o drivers/firmware/efi/libstub/efi-stub-helper.c
>=20
> so given that we're not passing any -fplugin=3D option anyway (because we
> override KBUILD_CFLAGS for the stub), I don't understand why we need
> to the disable option at all.
>=20
> Laura?

So today I am just trying reverting that arm64 tree commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fiy+PxQW0/MKhR+VtiALeCT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltev2QACgkQAVBC80lX
0Gxb+wf+P4UdIy5U3y3xgTWs4oq1pcp5iovuKt3zTZepwJuRTlWqRUo4hiAe266u
zxc1a0w+Ri/+nSsPj5+qkUorZV6wtS8jz1egF/h3qP9oABVtheYg8496ncQCKYZU
uX1ggMNuXeGnhR1msAGqisQD/RjTSAxIbTrNGBJBqrCw2BUCitMF06wa8QEK1eoe
wJTRN+JSNCT7i9YLx61t0Y1A51jo2Ew/wPD+LdTlNHbeGjj67WV4MN9u/FXbJSvk
RKrSo5dx3yw4MFHkAFFrljfXDvuoiFCAYCKV0DkqWgCbFBU0HO7b5rUr6tJe5SLo
eMVmeuCcKE3QGI27nu7KAekq4Wrb9w==
=+Eni
-----END PGP SIGNATURE-----

--Sig_/Fiy+PxQW0/MKhR+VtiALeCT--
