From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Thu, 11 Oct 2018 20:58:49 +1100
Message-ID: <20181011205849.6f6645fa@canb.auug.org.au>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
        <20180828072333.36af4d5d@canb.auug.org.au>
        <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
        <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
        <20181011114809.5590ecb3@canb.auug.org.au>
        <d5b166d6-461c-f382-e3d2-8993b845bd5a@linux.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EGgn+pDjhFAk.Ev/HHXFnOE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d5b166d6-461c-f382-e3d2-8993b845bd5a@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: arnd@arndb.de, Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gregkh@linux-foundation.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/EGgn+pDjhFAk.Ev/HHXFnOE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 11 Oct 2018 09:44:36 +0200 Peter Oberparleiter <oberpar@linux.ibm.c=
om> wrote:
>
> On 11.10.2018 02:48, Stephen Rothwell wrote:
> > OK, I have been carrying this "quick fix" patch in linux-next since
> > September 7.  Is anyone going to pick this up and send it to
> > Greg/Linus, please? =20
>=20
> Sorry about that - I posted a modified fix at
>=20
>   https://lkml.org/lkml/2018/9/13/367
>=20
> but didn't get a response. I guess I should have reposted sooner. But
> before I do that:
>=20
> Arnd: Is this something that you can pick up or should I include someone
> else?

It would be nice if it could go in before the v4.19 release because the
commit that exposed the warnings went into v4.19-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/EGgn+pDjhFAk.Ev/HHXFnOE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/HtkACgkQAVBC80lX
0GyTegf+Ig7CBxbIa5giF6HtY4eEjmfP3pXGwhrQC7NLDPbPGx3uEheT+/X1L3P8
56v+bEZMpO7c1hISVSIy8y8b3LlH2+iCCn8FQauDIE71kxGZRy6Cz01shzs0UziK
Ya9afDxHS0RwaBrXnN93ds42V6GR3Vxkvc+SAhv+8+Rx48HJYJB9HS40lNVtMYB3
+svQ83T5YbK0NrOs5M/ilKJvXBoynHbj1Q6Efb+VmO0/d4dnYtL4dLjs+f9rXn6j
DZCzN/fN4mf2ivMt32OsM8/VizxubiwZUzc3wBzDT2x8r2z1vUYj7NdDREdCOOMW
8oJ04A4E8l1CbdM4pq+M4+cueH8vwA==
=Z44O
-----END PGP SIGNATURE-----

--Sig_/EGgn+pDjhFAk.Ev/HHXFnOE--
