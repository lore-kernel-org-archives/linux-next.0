From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Fri, 5 Oct 2018 15:31:07 +1000
Message-ID: <20181005153107.26147ecc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zOMbtx6=kRGT5fGq.h/g2LE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srikanth Jampala <Jampala.Srikanth@cavium.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zOMbtx6=kRGT5fGq.h/g2LE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/crypto/cavium/nitrox/nitrox_debugfs.c: In function 'stats_show':
drivers/crypto/cavium/nitrox/nitrox_debugfs.c:62:30: warning: format '%lld'=
 expects argument of type 'long long int', but argument 3 has type 'long in=
t' [-Wformat=3D]
  seq_printf(s, "  Posted: %lld\n", atomic64_read(&ndev->stats.posted));
                           ~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                           %ld
drivers/crypto/cavium/nitrox/nitrox_debugfs.c:63:33: warning: format '%lld'=
 expects argument of type 'long long int', but argument 3 has type 'long in=
t' [-Wformat=3D]
  seq_printf(s, "  Completed: %lld\n",
                              ~~~^
                              %ld
      atomic64_read(&ndev->stats.completed));
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/crypto/cavium/nitrox/nitrox_debugfs.c:65:31: warning: format '%lld'=
 expects argument of type 'long long int', but argument 3 has type 'long in=
t' [-Wformat=3D]
  seq_printf(s, "  Dropped: %lld\n", atomic64_read(&ndev->stats.dropped));
                            ~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            %ld

Introduced by commit

  2a8780be9c26 ("crypto: cavium/nitrox - updated debugfs information.")

--=20
Cheers,
Stephen Rothwell

--Sig_/zOMbtx6=kRGT5fGq.h/g2LE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu29xsACgkQAVBC80lX
0GyBXQgAjrNHLQb795frCbMCZPl/DIeMXdlp9w04Unb65LGRbRmgJFfnNFpdohIn
QZbzC8BsqWjJXtmZHxu1VU3IweaMDBUkPuZQTFKo0iN9aGg0lVrwIcqmZC9G+1EX
1LO9fUhAeyQn26J1IA4n1fq0XZgqnRl3JuzBFXfOoLQebQKkgCbIgZ3njDSnmsK6
JB2ebvDJkdzg0yGRPGy7sNKvBgKpX6fCq4bN6gOoO4LoE65b9SfElcrHtVeDugym
D7TTOqnKSQn68IVagDC/BZLmbBHCt472auTTEVI948XhzaoW0dp/LGkclMp6MwT+
2N/bWTvoGCLkJogZh+/a/fOVsRo+ZQ==
=TvXe
-----END PGP SIGNATURE-----

--Sig_/zOMbtx6=kRGT5fGq.h/g2LE--
