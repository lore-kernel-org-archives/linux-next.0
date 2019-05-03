From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 3 May 2019 20:22:30 +1000
Message-ID: <20190503202230.3327af07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t18M1VKjA4QbQyCBnHOWmQH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bo YU <tsu.yubo@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/t18M1VKjA4QbQyCBnHOWmQH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2e712675ffd1 ("perf bpf: Return value with unlocking in perf_env__find_bt=
f()")

Fixes tag

  Fixes: 2db7b1e0bd49d: (perf bpf: Return NULL when RB tree lookup fails in=
 perf_env__find_btf())

has these problem(s):

  - the colon after the SHA1 is unexpected
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/t18M1VKjA4QbQyCBnHOWmQH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzMFmYACgkQAVBC80lX
0Gz6zAf+JKCAd6+h9l+BIkTS1rsx5bUSzL/DLjquiv/pMgM4jNmmsEwTPi3ic1gz
9+3aguopebStuFebNCViTvrsKqPE6U38N1EKnJG1VTUi7zSny/eIn0T3X7ZM8AdJ
Mj4l2djat5a2FSldRgaMkKnUl09wscbKlM08d8oW5P27cf0JgRaC5HpY0q8XNhQn
qcRlKIz0lwkMll/v7elMzicBtwWNG2BxVcwx1fm+uoSxWzX3fbSXJ5LkJ9Bjd2T9
ZEqRehE9aSqyxVcxBbWh0jvw7UsINVnrpIgct2nRW0cuoy8mX4fsF+xbq8Hg2H69
3VZiCGuzJQVmxKJBGbENkn9DZXKtFQ==
=4e1b
-----END PGP SIGNATURE-----

--Sig_/t18M1VKjA4QbQyCBnHOWmQH--
