From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the clk tree
Date: Tue, 30 Apr 2019 15:56:38 +1000
Message-ID: <20190430155638.48e059f1@canb.auug.org.au>
References: <20190430101939.76dc077c@canb.auug.org.au>
        <DB3PR0402MB3916B4CE00494BE730C07047F53A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K8vF_YX5vxvj4+T9qG7HvnH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916B4CE00494BE730C07047F53A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/K8vF_YX5vxvj4+T9qG7HvnH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anson,

On Tue, 30 Apr 2019 01:44:58 +0000 Anson Huang <anson.huang@nxp.com> wrote:
>
> 	Thanks for notice.
> 	As it is intentional, I will send out a patch to add "/* fall through */=
" to avoid this build warning,

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/K8vF_YX5vxvj4+T9qG7HvnH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzH45YACgkQAVBC80lX
0GyzHQf+MDOwduTppkTMmqNBNvANKGSLzgM5SCQYLxUUEiwvgQ2F3OEdv28njdbG
IWeahaQisDX/lHf+ovKat4PYMO6cPpTIL+SgwiJREeR/PT7gnXj+QwYFg1e84ZnB
ao51Yd7t53GvmVJRwuHkJrdxAvTX2uAGFMmW0fnkVylwrQZrxuDfE57S5LsILw/u
mmV5QF4H0+X1gWdEo552bvNPomKsDa0DOjBuyUTNqq2dSaWWTwlVAJ4XrNoEsITB
GVwj8U1SXA6NRBpuwEB1i9V2WYhcapvxrKkOM40k4V6uqTPcV4r8BGAJ9cvy0qLA
W4nPNDhm/TX2z135CPjACbqgyIzK0A==
=qNhx
-----END PGP SIGNATURE-----

--Sig_/K8vF_YX5vxvj4+T9qG7HvnH--
