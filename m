From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Oct 4
Date: Fri, 5 Oct 2018 09:44:45 +1000
Message-ID: <20181005094445.4d0b68bc@canb.auug.org.au>
References: <20181004183449.36bcc93b@canb.auug.org.au>
        <20181004134644.GA9130@roeck-us.net>
        <CAMuHMdXfhbFi8HYtqd6BeACyG64_eQvoiSQ7DMpyOmdXEXPymg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1Ambw=BwbLYFipXzDTvp3qv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXfhbFi8HYtqd6BeACyG64_eQvoiSQ7DMpyOmdXEXPymg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/1Ambw=BwbLYFipXzDTvp3qv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 4 Oct 2018 16:21:42 +0200 Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>
> On Thu, Oct 4, 2018 at 3:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > Time for a status report.
> >
> > Build results:
> >         total: 135 pass: 121 fail: 14
> > Failed builds:
> >         arm:allmodconfig
> >         i386:allyesconfig
> >         i386:allmodconfig
> >         m68k:defconfig
> >         m68k:allmodconfig
> >         m68k:sun3_defconfig
> >         mips:allmodconfig
> >         parisc:allmodconfig
> >         powerpc:ppc6xx_defconfig
> >         s390:defconfig
> >         s390:allmodconfig
> >         s390:allnoconfig
> >         sparc32:allmodconfig
> >         xtensa:allmodconfig =20
>=20
> Most (all?) 32-bit builds are broken due to commit 571ed1fd2390f74e
> ("SUNRPC: Replace krb5_seq_lock with a lockless scheme"), presumably fixed
> by Arnd's "SUNRPC: use cmpxchg64() in gss_seq_send64_fetch_and_inc"
> (https://lore.kernel.org/patchwork/patch/994909/).

I have added that patch to the nfs tree merge in linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Ambw=BwbLYFipXzDTvp3qv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu2pe0ACgkQAVBC80lX
0GxyPgf/SZTNxWSN/TKpHs8ENfnrb9JjTE3pX6NSKe/UqoLVQDrxx72+AXfbbI26
gIVL5oawVL9Z0IcQvxv5c2vjbjtiBgvo/kH+ZACYQYHP2C4SY7SNMJc7NtbAwHJE
0mpEOfwSA5KXoBRsBvvpFHFabLi4ysaq57ExOM9aYOUTmvVUYMseJuy21FDuQaoc
HBhSwvrU09kYY6Mwz6Msma6poa0bjVskRaqJO/TERrD1in3LSuHv1tK37PDZxcB2
DIuRbADCTPPxlbWq5/+HtBix4IpxPT3Tg0T7A0oEiXQE7vlMQUusdGvwTbqi5oS9
eVGbGNHm4bfw6n+5LofdrcLZSsHEQg==
=eg9t
-----END PGP SIGNATURE-----

--Sig_/1Ambw=BwbLYFipXzDTvp3qv--
