From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: powerpc le qemu boot failure after merge of the
 akpm tree
Date: Thu, 31 Jan 2019 19:35:37 +1100
Message-ID: <20190131193537.3ee3c210@canb.auug.org.au>
References: <20190131163854.307e17ab@canb.auug.org.au>
        <20190131170629.2cc20600@canb.auug.org.au>
        <962e7dd7-779b-2c32-59db-9ced6751dede@c-s.fr>
        <20190131074018.GD28876@rapoport-lnx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3HCzB6POlHzSyJeaUMNsuSh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131074018.GD28876@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Andrey Konovalov <andreyknvl@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3HCzB6POlHzSyJeaUMNsuSh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 31 Jan 2019 09:40:18 +0200 Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Andrew, can you please add the below patch to as a fixup to "treewide: add
> checks for the return value of memblock_alloc*()"?

I have added that to linux-next for tomorrow (in case Andrew doesn't
get to it).

> From 854f54b9d4fe52f477765b905a4b2c421d30f46e Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Thu, 31 Jan 2019 09:18:50 +0200
> Subject: [PATCH] mm/sparse: don't panic if the allocation in
>  sparse_buffer_init fails

Thanks all for the quick resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/3HCzB6POlHzSyJeaUMNsuSh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSs1kACgkQAVBC80lX
0GxfEAgAkdFna3qHRxKrhWtPUWeVPybkdL8yOyiL4dLOnCTHVj68HzCxCH9LpwJa
DUb+ExtaTjcoz3MvHVnJXnZyAkzIkw63mHpYwpClgg/wt7tyA2rVtmHqF7+5TlHx
4YUq4V8N4wFoiU7/obW9eKEQWQaDHtn5XPuwZys4al/MgMX4BMD7/QhSmPNkYJk9
gfxnHLWnkeiOioebDuQ49TZgtdKYiGaMLjUjoxRqcL2z9TIeP4XroCT6H1g78mlB
epEReSKn85EBD/WWBMgXJ3ZwCL5X75UKhL+WuTpQ/afOmCZ15LDMt7PR5ZIGPOrl
FuTKp54kzDFNhSsE2ore2lxiK06MGg==
=0ZFX
-----END PGP SIGNATURE-----

--Sig_/3HCzB6POlHzSyJeaUMNsuSh--
