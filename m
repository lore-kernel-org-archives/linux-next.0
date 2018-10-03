From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf-next tree
Date: Wed, 3 Oct 2018 13:18:48 +1000
Message-ID: <20181003131848.4f76db59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_LeNpFlzomfevWWMX4DcrUD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Stringer <joe@wand.net.nz>
List-Id: linux-next.vger.kernel.org

--Sig_/_LeNpFlzomfevWWMX4DcrUD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: net/core/filter.o: in function `sk_lookup':
(.text+0x19219): undefined reference to `__udp6_lib_lookup'

Caused by commit

  6acc9b432e67 ("bpf: Add helper to retrieve socket in BPF")

I assume that __udp6_lib_lookup ended up in the IPv6 module.

I used the bpf-next tree from next-20181002 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/_LeNpFlzomfevWWMX4DcrUD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0NRgACgkQAVBC80lX
0Gz+SAf9FKEDyJgjbfjBNflGzNVaQMQ8lrdsMs7E/IcFhvGKSinjtDBl3OQK7Dpw
dJhy20OOCfs1zr9ajCCSdeiWW2NlM6d9lToWiiu0scAhoVNJpMQYeHqwx+vziJhd
Wc1VuOdissh8i/Fc9EimXppmndOh0ko+ZuqBPfry5rUAQqVnRSzqsCwomW2LbK1W
6NenlhhFpoRiH8UkZbjY/r0XckvtAcUillbLZ+YGvsPuBRx6xRzYH1QEG3CRqaOf
+62s2kThTHjE5BQDcdjQx5eu6JmjU2+6rJ8xvjMpyTeoRNsu73fR9oJiukSA/E/f
dgsJ3pHMH+y0M7yta2KTvSHXZ2Z/kQ==
=5X/A
-----END PGP SIGNATURE-----

--Sig_/_LeNpFlzomfevWWMX4DcrUD--
