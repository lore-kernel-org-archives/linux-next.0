From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure in Linus' tree
Date: Mon, 18 Jun 2018 13:50:41 +1000
Message-ID: <20180618135041.5b661a2c@canb.auug.org.au>
References: <20180612122640.534118ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lwvCwP46zO1EbN+lvHavvXu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612122640.534118ed@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

--Sig_/lwvCwP46zO1EbN+lvHavvXu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Jun 2018 12:26:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Building Linus' tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
>=20
> ld: net/bpfilter/bpfilter_umh.o: compiled for a little endian system and =
target is big endian
> ld: failed to merge target specific data of file net/bpfilter/bpfilter_um=
h.o
>=20
> This has come to light since I started using a native compiler (i.e. one
> that can build executables, not just the kernel) for my PowerPC builds
> on a powerpcle host.
>=20
> I have switched back to my limited compiler.

Any progress on this?
--=20
Cheers,
Stephen Rothwell

--Sig_/lwvCwP46zO1EbN+lvHavvXu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnLBEACgkQAVBC80lX
0Gxiigf/TavmN8fnRIYbvk8WFY9glYBpJkMjz/X3ZUJBrKAW7V46laetFyUZtkib
7W3oVrAWPwg0SUXY/q7kPhp/D3wXu2RVUlJh9LIsHBaf5kpNqlSb2rreDqIwoOWB
qn4lJkhE10AfmbBxbppaNOyNIwpbzWW9gZIxAGUe0pYZqtUBZnAIF5QSFNET6sml
fLdgNk/dXDCxuEUjdrnQxhoti0NTKuerjnfjRg//TdSHriRLmKHJBK9MezdnNuth
7qpT/IoTv/JD/EtYFYH8VZ1uxaYHRxAzCHGkKkOMhe18j2E+/u9XeNA09u0iRNfw
EuNiDaipfXBk+zKeDbiFZBPYf4lcVw==
=dP4B
-----END PGP SIGNATURE-----

--Sig_/lwvCwP46zO1EbN+lvHavvXu--
