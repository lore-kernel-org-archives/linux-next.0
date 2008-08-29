From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 29 Aug 2008 18:14:42 +1000
Message-ID: <20080829181442.e00b23ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Aug_2008_18_14_42_+1000_g8QSalNAYKABEAuq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57207 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753208AbYH2IOt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 04:14:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, KaiGai Kohei <kaigai@ak.jp.nec.com>

--Signature=_Fri__29_Aug_2008_18_14_42_+1000_g8QSalNAYKABEAuq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
security/selinux/hooks.c between commit
d9250dea3f89fe808a525f08888016b495240ed4 ("SELinux: add boundary support
and thread context assignment") from the security-testing tree and commit
89be244cbb79a6c4a6d73730a1f042fc04d30967 ("CRED: Inaugurate COW
credentials") from the creds tree.

I fixed it up as best I could (see below) and can carry the fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/selinux/hooks.c
index 89f446d,b6ae264..0000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -5206,49 -5312,30 +5312,37 @@@ static int selinux_setprocattr(struct t
  	/* Permission checking based on the specified context is
  	   performed during the actual operation (execve,
  	   open/mkdir/...), when we know the full context of the
- 	   operation.  See selinux_bprm_set_security for the execve
+ 	   operation.  See selinux_bprm_set_creds for the execve
  	   checks and may_create for the file creation checks. The
  	   operation will then fail if the context is not permitted. */
- 	tsec =3D p->security;
- 	if (!strcmp(name, "exec"))
+ 	tsec =3D new->security;
+ 	if (!strcmp(name, "exec")) {
  		tsec->exec_sid =3D sid;
- 	else if (!strcmp(name, "fscreate"))
+ 	} else if (!strcmp(name, "fscreate")) {
  		tsec->create_sid =3D sid;
- 	else if (!strcmp(name, "keycreate")) {
+ 	} else if (!strcmp(name, "keycreate")) {
  		error =3D may_create_key(sid, p);
  		if (error)
- 			return error;
+ 			goto abort_change;
  		tsec->keycreate_sid =3D sid;
- 	} else if (!strcmp(name, "sockcreate"))
+ 	} else if (!strcmp(name, "sockcreate")) {
  		tsec->sockcreate_sid =3D sid;
- 	else if (!strcmp(name, "current")) {
- 		struct av_decision avd;
-=20
+ 	} else if (!strcmp(name, "current")) {
+ 		error =3D -EINVAL;
  		if (sid =3D=3D 0)
- 			return -EINVAL;
+ 			goto abort_change;
+=20
 -		/* Only allow single threaded processes to change context */
 -		error =3D -EPERM;
 -		if (!is_single_threaded(p))
 -			goto abort_change;
 +		/*
 +		 * SELinux allows to change context in the following case only.
 +		 *  - Single threaded processes.
 +		 *  - Multi threaded processes intend to change its context into
 +		 *    more restricted domain (defined by TYPEBOUNDS statement).
 +		 */
- 		if (atomic_read(&p->mm->mm_users) !=3D 1) {
- 			struct task_struct *g, *t;
- 			struct mm_struct *mm =3D p->mm;
- 			read_lock(&tasklist_lock);
- 			do_each_thread(g, t) {
- 				if (t->mm =3D=3D mm && t !=3D p) {
- 					read_unlock(&tasklist_lock);
- 					error =3D security_bounded_transition(tsec->sid, sid);
- 					if (!error)
- 						goto boundary_ok;
-=20
- 					return error;
- 				}
- 			} while_each_thread(g, t);
- 			read_unlock(&tasklist_lock);
++		if (!is_single_threaded(p)) {
++			error =3D security_bounded_transition(tsec->sid, sid);
++			if (error)
++				goto abort_change;
 +		}
- boundary_ok:
 =20
  		/* Check permissions for the transition. */
  		error =3D avc_has_perm(tsec->sid, sid, SECCLASS_PROCESS,

--Signature=_Fri__29_Aug_2008_18_14_42_+1000_g8QSalNAYKABEAuq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki3r/IACgkQjjKRsyhoI8yfQgCeMbhS8aTmTjy1LAXEwd3nm+96
T1EAmwRorkjeg214nf7A5gZgqUoJ7LVY
=hIsX
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Aug_2008_18_14_42_+1000_g8QSalNAYKABEAuq--
