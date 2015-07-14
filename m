From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 14 Jul 2015 15:19:08 +1000
Message-ID: <20150714151908.75da0497@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qnt1tmG_lh_LKd45C3H=beg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Al Viro <viro@ZenIV.linux.org.uk>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qnt1tmG_lh_LKd45C3H=beg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/nsfs.c: In function 'nsfs_show_path':
fs/nsfs.c:145:2: error: void value not ignored as it ought to be
  return seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
  ^
fs/nsfs.c:146:1: warning: control reaches end of non-void function [-Wretur=
n-type]
 }
 ^

Caused by patch

  "fs/seq_file: convert int seq_vprint/seq_printf/etc... returns to void"

from the akpm tree interacting with commit

  75509fd88fbd ("nsfs: Add a show_path method to fix mountinfo")

from the userns tree (which has reappeared).

I have applied the same fix patch from last time:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: nsfs: fix for seq_printf() API change
Date: Thu, 25 Jun 2015 17:41:14 +1000

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joe Perches <joe@perches.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/nsfs.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN fs/nsfs.c~fs-seq_file-convert-int-seq_vprint-seq_printf-etc-retur=
ns-to-void-fix fs/nsfs.c
--- a/fs/nsfs.c~fs-seq_file-convert-int-seq_vprint-seq_printf-etc-returns-t=
o-void-fix
+++ a/fs/nsfs.c
@@ -142,7 +142,8 @@ static int nsfs_show_path(struct seq_fil
 	struct inode *inode =3D d_inode(dentry);
 	const struct proc_ns_operations *ns_ops =3D dentry->d_fsdata;
=20
-	return seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
+	seq_printf(seq, "%s:[%lu]", ns_ops->name, inode->i_ino);
+	return 0;
 }
=20
 static const struct super_operations nsfs_ops =3D {

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/qnt1tmG_lh_LKd45C3H=beg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVpJvSAAoJEMDTa8Ir7ZwVRjMP/1VCjz4fbcGUtZg1/LbeGQTx
aRtZPLiiRzzKBwrw4Velh3OBt1m21OLDU5TRizODFY0jjzSDYvD++qkeBnI4moAV
WqGkm4G4Cq2fOHus82xXZNvlqDIxYLM5wO2qP5/DT6qr7tEEoW3HRoO93uKCKsfJ
mvO8+oAcDNZuE2YAokrvinarGYOLCahOs36vRcsPOSCt9GK7dYfzm9JHsJhl09Jj
0ekJJ/tIZLGO6jcgydi/9CA5iP15LyZnAaNwLBZo+ufdvnZpfRcTg2LZtgOqcELe
iAClcEc35C+4PP5zdVdkxPTCP72xVt5MyYtLhCAd5R7s5hPntjEX579/PisriNwU
VhftSQ9GTTb4BUZ8Av5wari+f1w10r/zmh1U5vujQP/LHoFJWnuwIoA3T3Q0iiea
lC1a8UTD7pPEgFjmnFmdSQdxG8gPL1Lksz0hKftE2r0gDCBR9gt07QIvoAo7xxNI
qZgIpiGejiemeZOtvM3EmFKAL7VSpTb0VEDvbI/imqbix4E0tGBqZvuhJVwnpof7
9wOzQfAqRuGHwJSYCmBTfPt2k03accFofKyXnvVh8YfVkdvZf/1oNgU0qPe9s1pR
nzYY5CngzKzySoqsmFcGATaQ2KGK6iaxmRrH88zElOHNsIbH4eRGd6H8T7BtP59t
DlRdxqI5m6Fnj+5Uf/dN
=/Vh1
-----END PGP SIGNATURE-----

--Sig_/qnt1tmG_lh_LKd45C3H=beg--
