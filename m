From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [linux-next] rtlwifi commit contains a patch reject file
Date: Mon, 22 Apr 2019 12:59:26 +1000
Message-ID: <20190422125926.15862fdd@canb.auug.org.au>
References: <20190420155008.GM23044@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FMG7rIUi7/.5Jw=V3/E=ouY"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190420155008.GM23044@windriver.com>
Sender: netdev-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-next@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/FMG7rIUi7/.5Jw=V3/E=ouY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sat, 20 Apr 2019 11:50:09 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> I'm kind of surprised sfr doesn't have a bot to complain when it sees
> a foo.c.rej or foo.c.orig in a commit...

You mean like this:

Commit

  ddab2eee7949 ("rtlwifi: Convert the wake_match variable to local")

added this unexpected file:

  drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c.rej

I have added that test to my commit checks now.  Thanks for the
suggestion.  So far it only checks for .rej and .orig files - any
others?

--=20
Cheers,
Stephen Rothwell

--Sig_/FMG7rIUi7/.5Jw=V3/E=ouY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly9Lg4ACgkQAVBC80lX
0GyVgQgAjbJ0frD4A4duxpv724dqn7i5Fox8RooH8Q/TFk5QjjNbgSJJksA5PZGz
Okv0DU/CuxQSV9sJgiKHvm9t/g2fi8Ojbw/Xg0bWmwlgppnr+V24HElOQq0ad7US
iA92QUrDSZxPEXqA3YuGtWRjCta5FHezII5HbU2p255qqficGiEijCFvrd/jJpph
90bwV8OQ/9laxzhjEmv6o3cnDVc2QBlai+FiDo8WQuC7N0g+HtBnuTH3UFx/QX3a
Y0hL+Km6z6TkGmY6BeV9VG8H/epR/gl9zK1GvWCBJ03QDdFtOPxi1eyvHFiucGYi
Sn1p3OBDdM1KuqCqYAda1SzOFHSGHA==
=8+tb
-----END PGP SIGNATURE-----

--Sig_/FMG7rIUi7/.5Jw=V3/E=ouY--
