From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Wed, 2 Jan 2019 15:01:40 +1100
Message-ID: <20190102150140.704c4533@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8j9bjcOUK=mLTmizsGGHgnM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8j9bjcOUK=mLTmizsGGHgnM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

fs/fs_context.c: In function 'logfc':
fs/fs_context.c:400:3: error: implicit declaration of function 'vprintk_emi=
t'; did you mean 'dev_printk_emit'? [-Werror=3Dimplicit-function-declaratio=
n]
   vprintk_emit(0, LOGLEVEL_WARNING, NULL, 0, fmt, va);
   ^~~~~~~~~~~~
   dev_printk_emit

Caused by commit

  e6d72ffc503f ("vfs: Implement logging through fs_context")

# CONFIG_PRINTK is not set

I added the following hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Jan 2019 14:57:36 +1100
Subject: [PATCH] vfs: work around CONFIG_PRINTK=3Dn in fs_context logging c=
ode

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/fs_context.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fs_context.c b/fs/fs_context.c
index 8728d49c7871..b0324598f573 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -391,6 +391,7 @@ EXPORT_SYMBOL(vfs_dup_fs_context);
  */
 void logfc(struct fs_context *fc, const char *fmt, ...)
 {
+#ifdef CONFIG_PRINTK
 	va_list va;
=20
 	va_start(va, fmt);
@@ -409,6 +410,7 @@ void logfc(struct fs_context *fc, const char *fmt, ...)
=20
 	pr_cont("\n");
 	va_end(va);
+#endif
 }
 EXPORT_SYMBOL(logfc);
=20
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/8j9bjcOUK=mLTmizsGGHgnM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsN6QACgkQAVBC80lX
0GxCOAf+NcYWsZYMSnzubZq+Zgtrm5R1QlmhKgC2krRKzMqaBNbjgI71MQk4p80Q
6911oaW0wnjnRV7a3h76GGYc2l3IJdJxNK4nC3WW0zD6zcUCbyg/K4MxvphdNc58
QF0PQ1MJLi3SWFjXnqt6SLPunW6GwDMzrs/LMJU0BUUW14TLPSyz4qwTRqdT0Vq9
Vbi9qRiQF3VRaRCf6Bjoc1bDb5qyg+mdCU8Ibbr4+mu3pmQrHfyHDDTp0q4yqa7D
Pxd606xuX8EfOjbesfcfx7iR15XYlQ4e/rhsnw36F+kviVW1nIYP6CWhmCYodApm
FmaxQ+5mPDqlIjT/+sE8olxiH8tNnA==
=mJu7
-----END PGP SIGNATURE-----

--Sig_/8j9bjcOUK=mLTmizsGGHgnM--
