From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-tegra tree
Date: Mon, 4 Feb 2019 11:12:41 +1100
Message-ID: <20190204111241.278b6215@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vuFuZpYzUppTel1lu9266P2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/vuFuZpYzUppTel1lu9266P2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

After merging the drm-tegra tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/host1x/cdma.c: In function 'host1x_cdma_wait_pushbuffer_space':
drivers/gpu/host1x/cdma.c:279:13: error: 'struct host1x_cdma' has no member=
 named 'sem'
   down(&cdma->sem);
             ^~

Caused by commit

  abb289796799 ("gpu: host1x: Use completion instead of semaphore")

interacting with commit

  db5652be58a9 ("gpu: host1x: Introduce support for wide opcodes")

I have used the drm-tegra tree from next-20190201 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/vuFuZpYzUppTel1lu9266P2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXg3kACgkQAVBC80lX
0GwI8wf+LvaaP1f9ZFNpFhIxJODXYdI7c7W3nDdHP98jBZNCqOIncX+NIDl5MJPG
IqQd4MzqijCIjR1+i+PsHwXi2lNCbvZRum0DQYpBKOmRUx3KkLF1bnO8TyiekLLx
doSjwKRK+7PF9AnQH9sd/pLzLOSc7MTR81fTsFU/fJHdySkJVae+otJf8ZzD7e8/
KnftByXw5KrM4e+PHnZXI+mIcU3hr5q0WjP4bGYfdG6tQwMH7mzpI+t9xoPMkVds
+izkY87r277gPbs7oapCcRUqcirB7Gy3LRwGIs1wUKP70ojqIjGs62sE1m7clWi5
f/BtCRHsgjYhmoBdvJcrkgY0xgHY/A==
=Cr3E
-----END PGP SIGNATURE-----

--Sig_/vuFuZpYzUppTel1lu9266P2--
