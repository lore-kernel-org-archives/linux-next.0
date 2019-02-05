From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mips tree with the mips-fixes
 tree
Date: Wed, 6 Feb 2019 10:44:33 +1100
Message-ID: <20190206104433.1c832a0b@canb.auug.org.au>
References: <20190206091736.73bd95ec@canb.auug.org.au>
        <20190205233530.tnk6boxzxm7okgcr@pburton-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I8EBZ///vtMYXyZ=Im65Tyu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205233530.tnk6boxzxm7okgcr@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Huang Pei <huangpei@loongson.cn>
List-Id: linux-next.vger.kernel.org

--Sig_/I8EBZ///vtMYXyZ=Im65Tyu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 5 Feb 2019 23:35:31 +0000 Paul Burton <paul.burton@mips.com> wrote:
>
> cmpxchg() doesn't need the added loongson_llsc_mb() barrier that
> set_pte() has in mips-fixes because for the affected Loongson 3
> configurations the smp_mb__before_llsc() that cmpxchg() already contains
> is equivalent (both will emit a "sync 0" instruction).

OK, good to know, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/I8EBZ///vtMYXyZ=Im65Tyu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxaH+EACgkQAVBC80lX
0GxYNQf/ftzRetfxC0vB4nWsaAsrCpC2G63z0791p/OZx1lMk217b1Z4q1pFZ4qo
KXn/v2C0UF4NJkUoDTCvmWhaxL+hj5Uj662iSFm3soYpXTyNRujLZ1DY+LyiOpyC
+UIFf0enA8JZ+KJlE9M3TKP1dR6S59OiGocpIqmcqInE9hpcc08qwxCh6/LwTGAl
w5nE7j0rJLxXnrSgPipV1SMMNT7PUANZ+6Hicm7d4p3vJVy+L39cH5GMlk0YB5XN
mgDkcIavnYRQJW563H+hkLqcvynohd0hBohrSZhpwcRB51k1NonggVkr+T2mtQcC
Xm/049xk1/DUktO1jtxovS2ORwASsw==
=7jT0
-----END PGP SIGNATURE-----

--Sig_/I8EBZ///vtMYXyZ=Im65Tyu--
