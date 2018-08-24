From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Fri, 24 Aug 2018 22:42:11 +1000
Message-ID: <20180824224211.2934d7c0@canb.auug.org.au>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e9c6xvEObhgKwcLMESA5VWx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824204756.e787765461975cd1e27502dc@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/e9c6xvEObhgKwcLMESA5VWx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masami,

On Fri, 24 Aug 2018 20:47:56 +0900 Masami Hiramatsu <mhiramat@kernel.org> w=
rote:
>
> gcc-7.3.0 cross build ld shows below warnings.
>=20
>   MODPOST vmlinux.o
> /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: or=
phan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.=
hash'.
>   KSYM    .tmp_kallsyms1.o
> /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: or=
phan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.=
hash'.
>   KSYM    .tmp_kallsyms2.o
> /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: or=
phan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.=
hash'.
>   KSYM    .tmp_kallsyms3.o
>   LD      vmlinux
> /opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: or=
phan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.=
hash'.

I reported those a while ago when I started using the native Debian gcc
on my Powerpc build box.

> But it seems another warning, and I couldn't see your warnings. Could you=
 tell me your gcc version?

Currently, it is the Debian gcc 8.2.0, ld 2.31.1.

--=20
Cheers,
Stephen Rothwell

--Sig_/e9c6xvEObhgKwcLMESA5VWx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt//SMACgkQAVBC80lX
0Gw5+gf+MwH1M707OUGCMLgta/PsBCZiEcgIa5ryFx7YuugactRTexd8SpsdRxa8
MVRjHW2VJ9OIDwwEiBOVR38KhSPSRlhs4kkpiIwbNjjc0W4XXKTrVAeo0XCpoYVc
w7C59pRUYPklQLkUuIx7V4lwAzkzzxNN6XSYtd2GaxmLf+5AXXbt4dRHUTuIu5Yr
X/uiGAkMlWi5ldKMeX1Z31oMGn4uIZSmK/l69jgX+EHcbff6VtJEhpsX10r3O9uz
w9CAv3lbd81ExRKi7Ms4tfSapzFsICkn/vAH9Ujy9AHfCADVvfka/hAjigWTicCo
BNpcTNwlW2b6g1HOJI4OjFtk8us2Ng==
=ZEGq
-----END PGP SIGNATURE-----

--Sig_/e9c6xvEObhgKwcLMESA5VWx--
