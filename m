From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 13 Aug 2018 18:22:18 +1000
Message-ID: <20180813182218.595fe0bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i8v81v0_6pKOT5ElPwG24Y9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsO8cmc=?= Billeter <j@bitron.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/i8v81v0_6pKOT5ElPwG24Y9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/exit.c: In function 'reparent_leader':
kernel/exit.c:640:3: error: too few arguments to function 'group_send_sig_i=
nfo'
   group_send_sig_info(p->signal->pdeath_signal_proc,
   ^~~~~~~~~~~~~~~~~~~
In file included from include/linux/sched/signal.h:6:0,
                 from include/linux/sched/cputime.h:5,
                 from kernel/exit.c:14:
include/linux/signal.h:262:12: note: declared here
 extern int group_send_sig_info(int sig, struct siginfo *info,
            ^~~~~~~~~~~~~~~~~~~

Caused by commit

  b04bd4d0117c ("prctl: add PR_[GS]ET_PDEATHSIG_PROC")

interacting with commit

  0102498083d5 ("signal: Pass pid type into group_send_sig_info")

from the uerns tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Aug 2018 18:07:07 +1000
Subject: [PATCH] merge fix up for "signal: Pass pid type into
 group_send_sig_info"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 7b72bed283d4..066c66448258 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -638,7 +638,7 @@ static void reparent_leader(struct task_struct *father,=
 struct task_struct *p,
=20
 	if (p->signal->pdeath_signal_proc)
 		group_send_sig_info(p->signal->pdeath_signal_proc,
-				    SEND_SIG_NOINFO, p);
+				    SEND_SIG_NOINFO, p, PIDTYPE_TGID);
=20
 	/* We don't want people slaying init. */
 	p->exit_signal =3D SIGCHLD;
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/i8v81v0_6pKOT5ElPwG24Y9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltxP7oACgkQAVBC80lX
0GzdwQf9EmRTqtPBceXGFGX3rfkOvFom64t3bUMsLuP/zhBdpD51TLCa1mjg6h/b
S6+aVAOihJlbxGygtbIeR6lU+S3+5gYkDy29mXji8KWD1cspYr8FhW1q7SQ5n8kK
s8LvQEZE2IXJFyxNkejhGYmDIuKY/y/JVK3rSKkb3D6YZ6F2U1UW2kpRMr7IMhHu
fnXZfRBdTTFiEKPhFEk4kS3MxLEWAnVonWdkeP4dd8q9qP0S0+5oRCpddwlBwodp
jnn+dWsXxt3BucWzdyMG8fTEqKXVrJICSeABIRrtdPngV/AEhdygQ8rMTDmLgU0I
AtAJnJ+zxs2+zVwdeN6Nlw0VWGAeXg==
=L4bW
-----END PGP SIGNATURE-----

--Sig_/i8v81v0_6pKOT5ElPwG24Y9--
