From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus'
 tree
Date: Wed, 20 Feb 2019 12:00:00 +1100
Message-ID: <20190220120000.741f5c09@canb.auug.org.au>
References: <20190218175120.3881e6e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Mn3Rb0HNC3dI2qIq1lMNUYM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218175120.3881e6e2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Mn3Rb0HNC3dI2qIq1lMNUYM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Feb 2019 17:51:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   fs/binfmt_script.c
>=20
> between commit:
>=20
>   cb5b020a8d38 ("Revert "exec: load_script: don't blindly truncate sheban=
g string"")
>=20
> from Linus' tree and commit:
>=20
>   76b21f3b9c4d ("exec: load_script: allow interpreter argument truncation=
")
>=20
> from the akpm-current tree.

Since Linus has applied something similar to his tree, I have dropped
that latter patch from the akpm-current tree from today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Mn3Rb0HNC3dI2qIq1lMNUYM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsppAACgkQAVBC80lX
0GxCXQf+Li+sv2odKDmv4E63aGsUTZ+KEYKh7PaEfh9bQpDnwhYRgLSiJgnBJdzD
CwK27StB7/cnFGMjmfBR7tcdN1akpRpKJdf1XAdZbBwGjriDK4RGRcQva89K4pDQ
PlF/mQBWUj2xQ757CeW4GBzXSDKiIrYp5t39acs6oT5SNJUI6ox9mg8gqg/RIlkV
q48sw4wpQ8ML5eQbScRsQlqnbKoNLvHlBf0mPk4/fbPnxQmNh/xmZbqnjrJvxazF
ZAYYLy2JmClxVMiv7jmKidv7fObGbnV6bKd6TVhcJp55ypX6yuKQmUSctdbruFTd
BqGqe8GUNceKMGaAKDTXgRA4MPitIg==
=Ez+j
-----END PGP SIGNATURE-----

--Sig_/Mn3Rb0HNC3dI2qIq1lMNUYM--
