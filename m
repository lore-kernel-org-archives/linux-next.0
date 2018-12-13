From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Thu, 13 Dec 2018 16:37:28 +1100
Message-ID: <20181213163728.037ac535@canb.auug.org.au>
References: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
        <20181213094820.62d26354@canb.auug.org.au>
        <20181212233909.hhf5q4vpi3mmi37u@ast-mbp.dhcp.thefacebook.com>
        <20181212.164526.189502766995329983.davem@davemloft.net>
        <20181213043339.znj2674c2povyl2n@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7H3qB79KrcrLaNaQNx2AHBj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213043339.znj2674c2povyl2n@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: David Miller <davem@davemloft.net>, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/7H3qB79KrcrLaNaQNx2AHBj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

On Wed, 12 Dec 2018 20:33:41 -0800 Alexei Starovoitov <alexei.starovoitov@g=
mail.com> wrote:
>
> If Stephen's scripts can recognize SOB anywhere in the log then
> --signoff can theoretically solve it.

My script just grabs all the Signed-off-by lines in the commit message.

> Unfortunately it's "Incompatible with the --interactive option"
> So we have to do things manually
> or fix scripts
> or fix git.

My version (2.19.1 and 2.20.0) of git does not say it is incompatible
with --interactive, so maybe the last is true :-)  It says:

           Note that
           if --interactive is given then only commits marked to be picked,
           edited or reworded will have the trailer added.

--=20
Cheers,
Stephen Rothwell

--Sig_/7H3qB79KrcrLaNaQNx2AHBj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwR8BgACgkQAVBC80lX
0GwZPgf/UmHtBKwEHKlzvpGEysPSw6VMw8TpQ7WHhm+KNsZI++FdVlIKZeE3+79F
zImch/oZHecj4UOWESGJkFKcxvOO0frnadh9twhYTnzPudiGevNWSq/ZxKpv/3yO
GBEq1BbiY9NV4EYsAHWkaEFcsFWNLT0t9K4n6mFqKd1sVcYGfhikD5rlj7qcDhnh
Xer6O63kB+r3DhF+vkl9ydYe1tV7A8uu+/w2YNbSW0/g+OLZEefyngZjb/MLbrsX
YNlgz0/zdxM/kQHBAgJQhnx4H52CzUMUNDE1yTozgvZJI2fJpbqdF67KZ3H/EAlO
CsTmjihZ0/AyaaUxKyLlTwkYpjlL/A==
=hjO7
-----END PGP SIGNATURE-----

--Sig_/7H3qB79KrcrLaNaQNx2AHBj--
