From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Tue, 16 Apr 2019 11:20:39 +1000
Message-ID: <20190416112039.25136d0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FoZbPfiQ76bYU/4vrxheonn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Hurley <john.hurley@netronome.com>, Simon Horman <simon.horman@netronome.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/FoZbPfiQ76bYU/4vrxheonn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/net/ethernet/netronome/nfp/flower/offload.c: In function 'nfp_flowe=
r_copy_pre_actions':
drivers/net/ethernet/netronome/nfp/flower/offload.c:630:7: warning: this st=
atement may fall through [-Wimplicit-fallthrough=3D]
    if (tunnel_act)
       ^
drivers/net/ethernet/netronome/nfp/flower/offload.c:632:3: note: here
   case NFP_FL_ACTION_OPCODE_PRE_LAG:
   ^~~~

Introduced by commit

  1c6952ca587d ("nfp: flower: generate merge flow rule")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/FoZbPfiQ76bYU/4vrxheonn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1LecACgkQAVBC80lX
0GxDIwf/f3YHQgHHG2x1dVdkjePDOfjgvdNOQ1rLO8O1IFJVd/38q3koz1PKnfY0
cnSntxosbQUTB0POoryov+ZM+bNvJLtf5+Ui+/pj7QmLj//cajh1kR8SAFQl4TjI
TRKqBw9kiijeyEt60RAAOKnZjqgsGbINaAGpsTWEh82sSwgYiyKBIfu58eoScU8U
tbT756MbYE+qJ7S/YrQVdvpfaBwenpMU5db2xREI8E9hu2c6pdmXL93LtuAZbBa2
XYNpzluNffNBOrqFzVD+zjQ/YLy+tI/7GPoPO7HIz1Zs++SekZPERN9fI9emsMDk
csvCYvXZvVfamz220YnFLDrfJzfuzw==
=pCfi
-----END PGP SIGNATURE-----

--Sig_/FoZbPfiQ76bYU/4vrxheonn--
