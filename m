From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net-next tree with the bpf tree
Date: Wed, 20 Feb 2019 12:03:05 +1100
Message-ID: <20190220120305.3c22596e@canb.auug.org.au>
References: <20190220113729.49f28f73@canb.auug.org.au>
        <CAADnVQK3qg2k67LRiOqDmFnELrFOD1dLkrNbAvbMyu6xGpjBLw@mail.gmail.com>
        <CAKH8qBuoYKPMhHn6Xzo=nEBevBt93c4+9cAVW7BZZwpNj46SCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RTVdESC3lpdA4KPdqx2fHd9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKH8qBuoYKPMhHn6Xzo=nEBevBt93c4+9cAVW7BZZwpNj46SCA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanislav Fomichev <sdf@google.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/RTVdESC3lpdA4KPdqx2fHd9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stanislav,

On Tue, 19 Feb 2019 16:45:46 -0800 Stanislav Fomichev <sdf@google.com> wrot=
e:
>
> OTOH, I don't understand why is there a conflict? bpf and bpf-next
> adding tests in the same place/file? Those can be trivially resolved
> when bpf and bpf-next are merged in the next window.

Yes, and yes :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/RTVdESC3lpdA4KPdqx2fHd9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsp0kACgkQAVBC80lX
0Gz2rAf6Av4sWZUHyBHAV1e84+jXQzEnf5E0p2RShtk2H6Rj03n3BbfULRDvHi0H
vSuRh4rvkruNLBKSMcJZrL49MhqgXFUJLziuwag5NL77pnlDky7oMe6UYU/Os41l
Y7jpK4KfHNhGQxgKZL4La1FdEmbWcCw6EfB8RnHXggGaXuqKlJDhxbECd6x4pUgT
hkrUE5SNOihrVFPbw4a+V8iX1EqXVpLrX7nLfiYsMH7IaJKYxgVzgp2/qnTKXs9M
MEVliOho+9Ejy+WiTTbdYDPLVSZg8V/CKRzcpD4aec3PSy9oXryCUAwI/BVT0kUv
VB8mGov04T3qkoSzFcP0B0ZBIjrgLw==
=23Cb
-----END PGP SIGNATURE-----

--Sig_/RTVdESC3lpdA4KPdqx2fHd9--
