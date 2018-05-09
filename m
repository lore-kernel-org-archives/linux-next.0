From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 9 May 2018 20:44:07 +1000
Message-ID: <20180509204407.587b4324@canb.auug.org.au>
References: <20180509141908.7b07df43@canb.auug.org.au>
        <CADYN=9JYJVVKyrPexNKNkbNjNBr1B3Xeuf6-wpdpE9+Px1UF9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ru=Z9/Q0Lq0PegGPat239o9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADYN=9JYJVVKyrPexNKNkbNjNBr1B3Xeuf6-wpdpE9+Px1UF9g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ru=Z9/Q0Lq0PegGPat239o9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anders,

On Wed, 9 May 2018 10:24:49 +0200 Anders Roxell <anders.roxell@linaro.org> =
wrote:
>
> On 9 May 2018 at 06:19, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >   TEST_PROGS :=3D run_netsocktests run_afpackettests test_bpf.sh netdev=
ice.sh rtnetlink.sh
> > - TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh pmtu.sh
> > + TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh in_netns.sh pmtu.sh =
udpgso.sh =20
>=20
> in_netns.sh shouldn't be in the above list, its already in the
> TEST_PROGS_EXTENDED below.

Thanks for that, I have fixed up my merge resolution for tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/ru=Z9/Q0Lq0PegGPat239o9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlry0PcACgkQAVBC80lX
0Gy2HQf6AkaCRgwwHDgZXDMnqX/xmLi2OGk+cscB4sXW6xmbTvlE7QKA2jgwlXl5
wz0Z/36agRR6d/VJuIiWfDD04Lm1IDFbK4n9lQEtOTVNVJy64OCuKZ2xai2P8w1O
Hx7uIGd2+bGFaBLFkQzActpqqEOewk7qr3vPamacU00RbSoO5tdcbF/Q+Uxq60Nr
1o2anKxsm34a8tqY3p75tQF8Rbt9Pf3YKOPHw41AqZkadp9OSqMpdoBFsBayqEUv
MkfAEgIx0nRPfjkVQW88gkoK4IKK4ezHnVbtwXJOF+rA+Ibxs2FiIFI4yuryFlFz
wX39uKkrFQf/aRvMszFHIAELCHtmcA==
=k0Yp
-----END PGP SIGNATURE-----

--Sig_/ru=Z9/Q0Lq0PegGPat239o9--
