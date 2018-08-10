From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ida tree
Date: Fri, 10 Aug 2018 16:36:12 +1000
Message-ID: <20180810163612.39c88e1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ki8R8ftO+7xfF_spdjNocgV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Christie <mchristi@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ki8R8ftO+7xfF_spdjNocgV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the ida tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/target/iscsi/iscsi_target_login.c: In function 'iscsi_login_zero_ts=
ih_s1':
drivers/target/iscsi/iscsi_target_login.c:376:16: error: 'sess_idr_lock' un=
declared (first use in this function); did you mean 'auth_id_lock'?
  spin_lock_bh(&sess_idr_lock);
                ^~~~~~~~~~~~~
                auth_id_lock
drivers/target/iscsi/iscsi_target_login.c:376:16: note: each undeclared ide=
ntifier is reported only once for each function it appears in
drivers/target/iscsi/iscsi_target_login.c:377:14: error: 'sess_idr' undecla=
red (first use in this function); did you mean 'sess_ida'?
  idr_remove(&sess_idr, sess->session_index);
              ^~~~~~~~
              sess_ida

Caused by commit

  9cd88edeaa9d ("target/iscsi: Allocate session IDs from an IDA")

interacting with commit

  ad86353cbddb ("iscsi target: fix session creation failure handling")

I have reverted commit 9cd88edeaa9d for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ki8R8ftO+7xfF_spdjNocgV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlttMlwACgkQAVBC80lX
0GwszAf+PsflRtk5GYQPCcOOFQ48Eh/XGIjtacOmVqMFf9u2AYe4FALfC6NqlXvG
oTL89OaQKAiGtyq5EQ5xNJvQKfSwG6hGrBJ9jSsD4UNYza+egUN3FvpgdpoxVH5Q
d0TbPcPHBCfJ7/Tta3/wuBkOj6zxKEu6NK2yISbtqMNMecdmf3/yr1tDenO6X0JN
9zEZL0cy62wNZ2+PrYZp7Hj4HZ/Aeo3N+jJaTO0vBYUasq40uG3FQDv6Jg0Qjfe2
n43srCfRK0SqlyLN+Yp30l3Ahc8l9hQxNTIY/xD78FQ6SwN3UC+ZyFsAZJ2xZcm2
INLVRb9feAr9kqWyJNbmM7LXZl76ZA==
=f9F1
-----END PGP SIGNATURE-----

--Sig_/ki8R8ftO+7xfF_spdjNocgV--
