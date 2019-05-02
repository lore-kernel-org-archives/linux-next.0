From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the f2fs tree
Date: Thu, 2 May 2019 10:53:09 +1000
Message-ID: <20190502105309.7ad51660@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mjvae70KivZvaKfso_KbnL3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/mjvae70KivZvaKfso_KbnL3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jaegeuk,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/trace/define_trace.h:96,
                 from include/trace/events/f2fs.h:1724,
                 from fs/f2fs/super.c:35:
include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_filemap_fau=
lt':
include/trace/events/f2fs.h:1310:3: error: '_entry' undeclared (first use i=
n this function); did you mean 'dentry'?
   _entry->ret)
   ^~~~~~
include/trace/trace_events.h:360:22: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  trace_seq_printf(s, print);     \
                      ^~~~~
include/trace/trace_events.h:79:9: note: in expansion of macro 'PARAMS'
         PARAMS(print));         \
         ^~~~~~
include/trace/events/f2fs.h:1287:1: note: in expansion of macro 'TRACE_EVEN=
T'
 TRACE_EVENT(f2fs_filemap_fault,
 ^~~~~~~~~~~
include/trace/events/f2fs.h:1307:2: note: in expansion of macro 'TP_printk'
  TP_printk("dev =3D (%d,%d), ino =3D %lu, index =3D %lu, ret =3D %lx",
  ^~~~~~~~~
include/trace/events/f2fs.h:1310:3: note: each undeclared identifier is rep=
orted only once for each function it appears in
   _entry->ret)
   ^~~~~~
include/trace/trace_events.h:360:22: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  trace_seq_printf(s, print);     \
                      ^~~~~
include/trace/trace_events.h:79:9: note: in expansion of macro 'PARAMS'
         PARAMS(print));         \
         ^~~~~~
include/trace/events/f2fs.h:1287:1: note: in expansion of macro 'TRACE_EVEN=
T'
 TRACE_EVENT(f2fs_filemap_fault,
 ^~~~~~~~~~~
include/trace/events/f2fs.h:1307:2: note: in expansion of macro 'TP_printk'
  TP_printk("dev =3D (%d,%d), ino =3D %lu, index =3D %lu, ret =3D %lx",
  ^~~~~~~~~

Caused by commit

  90a238561901 ("f2fs: add tracepoint for f2fs_filemap_fault()")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 2 May 2019 10:44:46 +1000
Subject: [PATCH] f2fs: fix up for "f2fs: add tracepoint for
 f2fs_filemap_fault()"

Fixes: 90a238561901 ("f2fs: add tracepoint for f2fs_filemap_fault()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/trace/events/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 6a53c793cf20..53b96f12300c 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1307,7 +1307,7 @@ TRACE_EVENT(f2fs_filemap_fault,
 	TP_printk("dev =3D (%d,%d), ino =3D %lu, index =3D %lu, ret =3D %lx",
 		show_dev_ino(__entry),
 		(unsigned long)__entry->index,
-		_entry->ret)
+		__entry->ret)
 );
=20
 TRACE_EVENT(f2fs_writepages,
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/mjvae70KivZvaKfso_KbnL3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKP3UACgkQAVBC80lX
0GxomAf+PvRbGvZzUz5s+c+oY2LoUiGQ5PMkbrlvhizdMTEssjzMLN3gSZxcMRfu
PIc4FquWPSMxj/UsuQGDIf7cVImzlKaJdoz7gtXldIVGtKK7gIg0b4N53wxWfnjk
yeTC6u4k2g/DhFkJB7S4uhBnsyJeGgMf1xSi7MEphOm4OWQANH9XHYioq0uUSSJH
SKQCwN7JfTqtBu4azBs+ct8N46iXWjHv5AtQEACHy8fET3tdb+MrchNz8MIzwFE+
C7lad+Qt2aUjeWM3O0kRmhMHAdhZ423l1NH88iF++z0TTqN8dH3NAJjnahGiGiQq
G9CD6UV3+kCh81k4tqvf/9dcH4NL6A==
=jdKv
-----END PGP SIGNATURE-----

--Sig_/mjvae70KivZvaKfso_KbnL3--
