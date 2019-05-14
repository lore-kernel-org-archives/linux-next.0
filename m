From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 10:56:49 +1000
Message-ID: <20190514105649.512267cd@canb.auug.org.au>
References: <20190514100910.6996d2f5@canb.auug.org.au>
        <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GAZU4z.04i=a5k9ZE+2ngzi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Tyler Hicks <tyhicks@canonical.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Schmitz <schmitzmic@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/GAZU4z.04i=a5k9ZE+2ngzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[excessive quoting for new CC's]

On Tue, 14 May 2019 09:40:53 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> On Tue, May 14, 2019 at 9:16 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > I don't know why this suddenly appeared after mergeing the ecryptfs tree
> > since nothin has changed in that tree for some time (and nothing in that
> > tree seems relevant).
> >
> > After merging the ecryptfs tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > scripts/Makefile.modpost:112: target '.tmp_versions/asix.mod' doesn't m=
atch the target pattern
> > scripts/Makefile.modpost:113: warning: overriding recipe for target '.t=
mp_versions/asix.mod'
> > scripts/Makefile.modpost:100: warning: ignoring old recipe for target '=
.tmp_versions/asix.mod'
> > scripts/Makefile.modpost:127: target '.tmp_versions/asix.mod' doesn't m=
atch the target pattern
> > scripts/Makefile.modpost:128: warning: overriding recipe for target '.t=
mp_versions/asix.mod'
> > scripts/Makefile.modpost:113: warning: ignoring old recipe for target '=
.tmp_versions/asix.mod'
> > make[2]: Circular .tmp_versions/asix.mod <- __modpost dependency droppe=
d.
> > Binary file .tmp_versions/asix.mod matches: No such file or directory
> > make[2]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
> > make[1]: *** [Makefile:1290: modules] Error 2
> >
> > The only clue I can see is that asix.o gets built in two separate
> > directories (drivers/net/{phy,usb}). =20
>=20
> Module name should be unique.
>=20
> If both are compiled as a module,
> they have the same module names:
>=20
> drivers/net/phy/asix.ko
> drivers/net/usb/asix.ko
>=20
> If you see .tmp_version directory,
> you will see asix.mod
>=20
> Perhaps, one overwrote the other,
> or it already got broken somehow.

So, the latter of these drivers (drivers/net/phy/asix.c) was added in
v4.18-rc1 by commit

  31dd83b96641 ("net-next: phy: new Asix Electronics PHY driver")

If we can't have 2 modules with the same base name, is it too late to
change its name?

I am sort of suprised that noone else has hit this in the past year.

> > I have the following files in the object directory:
> >
> > ./.tmp_versions/asix.mod
> > ./drivers/net/usb/asix.ko
> > ./drivers/net/usb/asix.mod.o
> > ./drivers/net/usb/asix.o
> > ./drivers/net/usb/asix_common.o
> > ./drivers/net/usb/asix_devices.o
> > ./drivers/net/usb/.asix.ko.cmd
> > ./drivers/net/usb/.asix.mod.o.cmd
> > ./drivers/net/usb/.asix.o.cmd
> > ./drivers/net/usb/asix.mod.c
> > ./drivers/net/usb/.asix_common.o.cmd
> > ./drivers/net/usb/.asix_devices.o.cmd
> > ./drivers/net/phy/asix.ko
> > ./drivers/net/phy/asix.o
> > ./drivers/net/phy/.asix.ko.cmd
> > ./drivers/net/phy/.asix.mod.o.cmd
> > ./drivers/net/phy/asix.mod.o
> > ./drivers/net/phy/asix.mod.c
> > ./drivers/net/phy/.asix.o.cmd
> >
> > ./.tmp_versions/asix.mod
> >
> > Looks like this:
> >
> > ------------------------------------------
> > drivers/net/phy/asix.ko
> > drivers/net/phy/asix.o
> >
> >
> > ------------------------------------------
> >
> > What you can't see above are the 256 NUL bytes at the end of the file
> > (followed by a NL).
> >
> > This is from a -j 80 build.  Surely there is a race condition here if t=
he
> > file in .tmp_versions is only named for the base name of the module and
> > we have 2 modules with the same base name.
> >
> > I removed that file and redid the build and it succeeded.
> >
> > Mind you, I have no itdea why this file was begin rebuilt, the merge
> > only touched these files:
> >
> > fs/ecryptfs/crypto.c
> > fs/ecryptfs/keystore.c
> >
> > Puzzled ... :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/GAZU4z.04i=a5k9ZE+2ngzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzaElEACgkQAVBC80lX
0Gyjdgf/VOXl+vcYN5/Ns9TE9My0Xo/JNrguSjSJhQx3ADvaV+/jtei0jM7gRdLu
Zjl0UU0Ru2sOJjhUnIgm7nAk7c9btHOG46lMDnYuFWvYATJNpPR5yepJywPvpbTy
BMtnQEcSWBUIYW8GLDZiVtsrH1bgmahjDfJ/kShawh6OiF2p5+ai/zx2bOMPV5vR
1nC41I+l76jUF8triGtXtcbHtuTKKJI5MMUhnn/xEO/uIukCNAv5FjcrC0SPHXPX
97bj/UFKpGuZEPDlGVJBUOaBaif2xOuq2d5cbGktps99xg2f2Ti9NrD9z02RW/RA
2/SyK8qUp3+tSlyC77Ns41H08A4MXQ==
=zQyT
-----END PGP SIGNATURE-----

--Sig_/GAZU4z.04i=a5k9ZE+2ngzi--
