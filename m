From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the
 wireless-drivers-next tree
Date: Wed, 19 Dec 2018 13:47:38 +1100
Message-ID: <20181219134738.4efed34f@canb.auug.org.au>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.Ln/vvvD5+uehjVwFMF=H+m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130120555.1d35eb6b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sara Sharon <sara.sharon@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.Ln/vvvD5+uehjVwFMF=H+m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 30 Nov 2018 12:05:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the wireless-drivers-next tree, today's linux-next build
> (x86_64 allmodconfig) produced these warnings:
>=20
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c: In function 'iwl_parse_tlv_=
firmware':
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1098:7: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
>     if (iwlwifi_mod_params.enable_ini)
>        ^
> drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1100:3: note: here
>    default:
>    ^~~~~~~
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: In function 'iwl_parse_=
fw_dbg_tlv':
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:203:4: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
>     iwl_fw_dbg_copy_tlv(trans, tlv, true);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:204:3: note: here
>    default:
>    ^~~~~~~
>=20
> Introduced by commit
>=20
>   f14cda6f3b31 ("iwlwifi: trans: parse and store debug ini TLVs")
>=20
> These are noted because I use -Wimplict-fallthrough
>=20
> The warnings can be suppressed by adding a comment like
> 	/* fall through */
> at the appropriate place to indicate that the fallthough is intended.

I am still seeing these warnings (but in the net-next tree now) and I
do not see a fix patch in the wireless-drivers-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.Ln/vvvD5+uehjVwFMF=H+m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwZsUoACgkQAVBC80lX
0Gy5xgf+I5Szsum5v2pCc9Enp1aQ+dR+lHqCHb5FjWdzJO/YjVLRIAQWc4n/i5dQ
xT1ycuy0n9Qr2ADsWdCqeTpEeTY559Idpp9TLylQWMu+yTf8Y+KFYeMIO+vecTcu
Qb9YC76QRf9HuWCDupWZondywRQwzHaVrByvF4n0tKc8J3WQSDZcMfpjHz6K2Q4T
NeLQFNjF2bL9t1B5x+pVy+w9WxvCfbXdfCTsyFiQ2w1x4++mJRFpOHWoIx4FVCXj
9xcK8QLWJxMElapC8ZWf7NynDAIJ0sjeVK8Di7tn8mVOVYEphlFv0BJecP3A9eTj
2AiTcVM+7FuYEFAN4/CZHXonr9V9JQ==
=asyU
-----END PGP SIGNATURE-----

--Sig_/.Ln/vvvD5+uehjVwFMF=H+m--
