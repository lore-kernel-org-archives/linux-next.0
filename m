From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 4 May 2018 14:17:56 +1000
Message-ID: <20180504141756.670dc3f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=/Tc5mW9Nj5Wdyl8rOBY+ij"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minchan Kim <minchan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=/Tc5mW9Nj5Wdyl8rOBY+ij
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build
(x86_64_allmodconfig) produced this warning:

drivers/block/zram/zram_drv.c: In function 'read_block_state':
drivers/block/zram/zram_drv.c:674:16: warning: format '%llu' expects argume=
nt of type 'long long unsigned int', but argument 5 has type '__kernel_time=
_t {aka long int}' [-Wformat=3D]
    "%12lu %12llu.%06lu %c%c%c\n",
           ~~~~~^
           %12lu
    (unsigned long)index, ts.tv_sec,
                          ~~~~~~~~~

Introduced by commit

  827c7dbda8eb ("zram-introduce-zram-memory-tracking-update-fix-fix")

--=20
Cheers,
Stephen Rothwell

--Sig_/=/Tc5mW9Nj5Wdyl8rOBY+ij
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrr3vQACgkQAVBC80lX
0GzoEAgApamxJmvlwEytxiGZwDhW3CYK3Za0jtTD7LMd+b17SyZIAT/Ah95K6j7L
3XcgiI6GbJ+YUhSVHbAfcvMb5HoLD+IDegl+0Ma+9NqfS18vYEciiXl0RM5LPtT2
Pn1CdUy0xaKYJThBbcWcKR41MlpaMWxlqzj7ihGXJa1JzG53d343g7fDQCIgEFjJ
hNZZYGeIVbOqQGFxI9e/R5EZtUvJtfuE2+dOwCjqrs7NM6bIpyWszWoUDZb3GjCL
GMdV3nBB5JsQVJWF+Q/brOk5RgwcZaMYc/4rOk1kfuDXVYv6R8UzdXjZPtStIBqX
u27JHdNU8yzktdiQWrWsvuBIgG0VVw==
=sutG
-----END PGP SIGNATURE-----

--Sig_/=/Tc5mW9Nj5Wdyl8rOBY+ij--
