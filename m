From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the mac80211-next tree
Date: Sat, 12 May 2018 13:57:57 +1000
Message-ID: <20180512135757.7c4e3bc7@canb.auug.org.au>
References: <20180509145624.643d2e56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4NiqZE+n7_0ITHj05L_/v63"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509145624.643d2e56@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Toke =?UTF-8?B?SMO4aWxhbmQt?= =?UTF-8?B?SsO4cmdlbnNlbg==?= <toke@toke.dk>, Wireless <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4NiqZE+n7_0ITHj05L_/v63
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just cc'ing the wireless list at Kalle's suggestion.

On Wed, 9 May 2018 14:56:24 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi Johannes,
>=20
> After merging the mac80211-next tree, today's linux-next build (arm_multi
> v7_defconfig) produced this warning:
>=20
> drivers/net/wireless/marvell/mwifiex/uap_event.c: In function 'mwifiex_pr=
ocess_uap_event':
> drivers/net/wireless/marvell/mwifiex/uap_event.c:333:1: warning: the fram=
e size of 1680 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
>  }
>  ^
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: In function =
'brcmf_notify_connect_status_ap':
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5530:1: warni=
ng: the frame size of 1680 bytes is larger than 1024 bytes [-Wframe-larger-=
than=3D]
>  }
>  ^
>=20
> Maybe introduced by commit
>=20
>   52539ca89f36 ("cfg80211: Expose TXQ stats and parameters to userspace")

--=20
Cheers,
Stephen Rothwell

--Sig_/4NiqZE+n7_0ITHj05L_/v63
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr2ZkUACgkQAVBC80lX
0Gz0mQf/VZUkfeVvkvAWDWJDLTYgq5Yk9Q64iaVZDnVFlxOYVjsBUyGrxPylIMFo
AQ5ubLlp7+M0NUqBCXtjoeq8ivRMvKLFuuUxFUW5ywy6hfI2Hzai7x7IxaRo7lRC
2VXRMWBHsqpVh2gsPLZwm4rO1humWvl4xIE7u80hfqhZmnlNybxQF4D+1oe8jD5H
4Hsp80sNIaRqAJnqfISq8FwGKQcGRLW2Xr2aKdqTS7ALGqTwqqBx4k2+p3nq+p4l
WO9fNPutkIzvV7oO91HkkG9W6d3N9sxJ3kSVhYT+DuYKKrZVM/xn8b3VeXPeA+EF
m9c2VKNdSZ5T5ry/BTIxZxyVQVtCZg==
=P+Kz
-----END PGP SIGNATURE-----

--Sig_/4NiqZE+n7_0ITHj05L_/v63--
