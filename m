From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bpf-next tree with the jc_docs
 tree
Date: Mon, 15 Apr 2019 11:09:02 +1000
Message-ID: <20190415110902.41c3c201@canb.auug.org.au>
References: <20190412110518.46e329af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/On+q+vVQzapSkCpAR7cPwSn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412110518.46e329af@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Networking <netdev@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Miller <davem@davemloft.net>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>
List-Id: linux-next.vger.kernel.org

--Sig_/On+q+vVQzapSkCpAR7cPwSn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Apr 2019 11:05:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>=20
>   .mailmap
>=20
> between commit:
>=20
>   9b628c6ab437 ("mailmap: update my obsolete email address")
>=20
> from the jc_docs tree and commit:
>=20
>   fa0dcb3fe2ca ("mailmap: add entry for email addresses")
>=20
> from the bpf-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc .mailmap
> index 151501c73503,e7984bb6b4b0..000000000000
> --- a/.mailmap
> +++ b/.mailmap
> @@@ -16,8 -16,9 +16,11 @@@ Alan Cox <alan@lxorguk.ukuu.org.uk
>   Alan Cox <root@hraefn.swansea.linux.org.uk>
>   Aleksey Gorelov <aleksey_gorelov@phoenix.com>
>   Aleksandar Markovic <aleksandar.markovic@mips.com> <aleksandar.markovic=
@imgtec.com>
>  +Alex Shi <alex.shi@linux.alibaba.com> <alex.shi@intel.com>
>  +Alex Shi <alex.shi@linux.alibaba.com> <alex.shi@linaro.org>
> + Alexei Starovoitov <ast@kernel.org> <ast@plumgrid.com>
> + Alexei Starovoitov <ast@kernel.org> <alexei.starovoitov@gmail.com>
> + Alexei Starovoitov <ast@kernel.org> <ast@fb.com>
>   Al Viro <viro@ftp.linux.org.uk>
>   Al Viro <viro@zenIV.linux.org.uk>
>   Andi Shyti <andi@etezian.org> <andi.shyti@samsung.com>

This is now a conflict between the net-next tree and the jc_docs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/On+q+vVQzapSkCpAR7cPwSn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz2a4ACgkQAVBC80lX
0GyEtwf9G4Kb/zHrH1eBX6xUKmmgAOoaNYDfqlH2JHknJ2h69Vydixnlk+OJeBIx
fr1y9qnbdPH3wX8RSkKRxkVyYfoH6ru9+JSR3Li1WTvm8e7DxHXPvMobwuy13qea
tLMUzXKXz+aqss4cruHmhCSf/6TZ/auEwmzIFVBiPVetn78V3raUrItvr5QQB98A
ruqeFaq9/Pe9TVR59JRrD4JzBpVVmOZv5ng8X3FfiUDfN8E5mHJF8WTD2baTDkWd
XamYTmcFKXP65eXp4HlCx4iOa+Sb+TQr/SithJBsPnNjjIqJfhxgY5i1EkHdwDhD
hgiMWDkSeU9ujun6E9Djv982SAlb8A==
=G3pb
-----END PGP SIGNATURE-----

--Sig_/On+q+vVQzapSkCpAR7cPwSn--
