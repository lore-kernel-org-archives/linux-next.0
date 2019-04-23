From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Tue, 23 Apr 2019 17:25:24 +1000
Message-ID: <20190423172524.3bcf6bd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k9UNknx1JqUf=dlGGCpmzTt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/k9UNknx1JqUf=dlGGCpmzTt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (sparc64
defconfig) failed like this:

net/core/sock.c: In function 'sock_gettstamp':
net/core/sock.c:3007:23: error: expected '}' before ';' token
    .tv_sec =3D ts.tv_sec;
                       ^
net/core/sock.c:3011:4: error: expected ')' before 'return'
    return -EFAULT;
    ^~~~~~
net/core/sock.c:3013:2: error: expected expression before '}' token
  }
  ^

Caused by commit

  c7cbdbf29f48 ("net: rework SIOCGSTAMP ioctl handling")

I have applied the followinf patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Apr 2019 17:12:19 +1000
Subject: [PATCH] net: fix sparc64 compilation of sock_gettstamp

Fixes: c7cbdbf29f48 ("net: rework SIOCGSTAMP ioctl handling")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/core/sock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 443b98d05f1e..925b84a872dd 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3004,10 +3004,10 @@ int sock_gettstamp(struct socket *sock, void __user=
 *userstamp,
 	/* beware of padding in sparc64 timeval */
 	if (timeval && !in_compat_syscall()) {
 		struct __kernel_old_timeval __user tv =3D {
-			.tv_sec =3D ts.tv_sec;
-			.tv_usec =3D ts.tv_nsec;
+			.tv_sec =3D ts.tv_sec,
+			.tv_usec =3D ts.tv_nsec,
 		};
-		if (copy_to_user(userstamp, &tv, sizeof(tv))
+		if (copy_to_user(userstamp, &tv, sizeof(tv)))
 			return -EFAULT;
 		return 0;
 	}
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/k9UNknx1JqUf=dlGGCpmzTt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+veQACgkQAVBC80lX
0GzafQf/e3IBpnfR4vf6BXz3uaEfuMtioBsb5zL1Fa/jOu6+UCvX09AfhP9h+NR+
0jvr17MpAJeKjdN1MEUmI/Q+BG4Cg/xdPZkaOcneOm6NIxvdOlQjfmliWLsJMy+p
q1JNepOVRVffHLxM7klbBEBa6ePk5xm5bQT0CgyGToRq5sOu9Q9nKmD7reE80SK7
YH4IiOxnxA9zdUq4L773rIySDLC/grEZfZVUElMhobld6xvfc8PQ4kqSLXI3An9Q
f8l4CpGKkdZGwjmNMlW35dWZP36g/KbhTwF1GVy96ODBQ8M87+ksmagQuBLLJcKP
+wZC/1P00NIiANkoaL4yWPWweIFGrQ==
=WQ1p
-----END PGP SIGNATURE-----

--Sig_/k9UNknx1JqUf=dlGGCpmzTt--
