From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the f2fs tree
Date: Mon, 26 Nov 2018 11:19:33 +1100
Message-ID: <20181126111933.1b0fb324@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/61jSQ85djv1WbQ9/FxPbGSK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>, Kees Cook <keescook@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/61jSQ85djv1WbQ9/FxPbGSK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

After merging the f2fs tree, today's linux-next build
(x86_64_allmodconfig) produced this warning:

In file included from fs/f2fs/dir.c:11:
fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimplicit=
-fallthrough=3D]
   if (set)
      ^
fs/f2fs/f2fs.h:2390:2: note: here
  case FI_DATA_EXIST:
  ^~~~

Exposed by my use of -Wimplicit-fallthrough

I am not sure why this has turned up now (as opposed to earlier today).

--=20
Cheers,
Stephen Rothwell

--Sig_/61jSQ85djv1WbQ9/FxPbGSK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7PBUACgkQAVBC80lX
0GyWZgf/ZkYA1gJUFaIJwm03LPobMPWfJmqvZJQ4gqB1pmtAejp4eyePfiIymtt7
XpCLqakTpnh0sDIyUd9AUrhO7DNiCyxrs+13mfF6JlolsF5HhCUrrZt+RhFoZcUW
6in3JNUIwd9KK9vbhuP0XzuKXq0eXubSI4RoPC53wm38nIuPPv7E/IYQ0utmA5oN
0qA2BFJqbHoYW6PIWy9ArITH6R0+nM7fs3zJYQ5AyeUhZ0L8BWk6lsOFrmNRUCy3
pkvVWjch7zC699x7AA5OJ7EntKlvXGoCly2tMO0NfkuF1VmUIFPSriebO7txNTAX
6eVJfGCeaHuc3sqg4cmPzTs8+Xq6/Q==
=gpQL
-----END PGP SIGNATURE-----

--Sig_/61jSQ85djv1WbQ9/FxPbGSK--
