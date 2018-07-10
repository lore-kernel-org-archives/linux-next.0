From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the printk tree
Date: Tue, 10 Jul 2018 16:45:14 +1000
Message-ID: <20180710164514.22c552db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FURb5/juwPe4KedDlPCpTFT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maninder Singh <maninder1.s@samsung.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FURb5/juwPe4KedDlPCpTFT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (x86_64
allnoconfig) produced this warning:

kernel/printk/printk.c:2033:13: warning: 'suppress_message_printing' define=
d but not used [-Wunused-function]
 static bool suppress_message_printing(int level) { return false; }
             ^~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  375899cddcbb ("printk: make sure to print log on console.")

--=20
Cheers,
Stephen Rothwell

--Sig_/FURb5/juwPe4KedDlPCpTFT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEVfoACgkQAVBC80lX
0GxQTwf9EZwdtrXMLQwD1/qJOadRHs1fyvT5nyUdMbCPctaMkdIm4Nsyx1lai8r/
oFMjjlMqmwO+YqneRwojhv+nAZ77+CtBURnV7k2riazf3mHcrUjHCzfQ2el5Fgsj
6p3Yaowl45+lTVYa9uEZxs59QWWFrZnfPKdDk8jDFeFppG1N3UHr9rQJm9pis6TA
9rZFucyeWAZAe7wMkbpeKPl8whpVUPXxwDgtgIjiotVg5tKluC7RNcQwLzMbBH0o
u2haX3SDfeqOdxi05Weh4QIXKo7kFAyX3os+wyyUPoIv40uWuhLAf1I6WhdPBdbi
gLCiuK5xrnNYmgxURg7moHUQ+0PzDw==
=bSrM
-----END PGP SIGNATURE-----

--Sig_/FURb5/juwPe4KedDlPCpTFT--
