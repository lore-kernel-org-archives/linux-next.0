From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Fri, 7 Sep 2018 13:34:47 +1000
Message-ID: <20180907133447.4d4632a1@canb.auug.org.au>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
        <20180828072333.36af4d5d@canb.auug.org.au>
        <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
        <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
        <20180907081440.38623043@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8NjSV3GupDu4uliy6PByJr+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907081440.38623043@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de
List-Id: linux-next.vger.kernel.org

--Sig_/8NjSV3GupDu4uliy6PByJr+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, 7 Sep 2018 08:14:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 6 Sep 2018 12:49:39 +0200 Peter Oberparleiter <oberpar@linux.ibm.=
com> wrote:
> >
> > I've attached a quick fix that should address both problems. I'd
> > appreciate if this patch could get some testing before I post proper fix
> > patches. =20
>=20
> I have added that into linux-next today ... I will let you know this
> afternoon how it went (it looks sensible, though).

It certainly gets rid of the PowerPC linker messages, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/8NjSV3GupDu4uliy6PByJr+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluR8dcACgkQAVBC80lX
0Gx44Qf+JJx6egPTqcyI1JQ+G4VGNypqXvhdvxjb5jCJfn9omFXcXYi2+lvwMGb6
OXkiTigNAcPoqd3Qe1vdxJwGguqs05+G150ajLVZvvR4AW5jIFDYF1kjM/gO1sp3
QdmrHTpWEt6tVPlcXftiGISmnjBmk+bE7JscYormD4yDwWZ3QmKCaPJCplU0FenJ
zWVM6dzdGmTGM4tb4RNTke9vGzOZ4K/ZOWWjH/+gHnN8MtENsd0yG6KCl64QHycE
ZblHYvk27jLQp3JWwiuF3nHS8Yv6st7OmTuA1K/jpitj/Vev+AgANUWEk7risbJs
V56tvybwtfndEIkjo9UNaLecjR+3Ig==
=EvUQ
-----END PGP SIGNATURE-----

--Sig_/8NjSV3GupDu4uliy6PByJr+--
