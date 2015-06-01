From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Mon, 1 Jun 2015 16:30:01 +1000
Message-ID: <20150601163001.01003d92@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/22mzgbuoGLDwMsiV.EOCHVr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>, James Morris <james.l.morris@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/22mzgbuoGLDwMsiV.EOCHVr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in
security/lsm_audit.c between commit 5deeb5cece3f ("lsm: copy comm
before calling audit_log to avoid race in string printing") from Linus'
tree and commit 5c5bc97e2fc8 ("lsm: rename duplicate labels in
LSM_AUDIT_DATA_TASK audit message type") from the audit tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc security/lsm_audit.c
index 1d34277dc402,07fc99724d41..000000000000
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@@ -281,10 -281,8 +281,10 @@@ static void dump_common_audit_data(stru
  		if (tsk) {
  			pid_t pid =3D task_pid_nr(tsk);
  			if (pid) {
 +				char comm[sizeof(tsk->comm)];
- 				audit_log_format(ab, " pid=3D%d comm=3D", pid);
+ 				audit_log_format(ab, " opid=3D%d ocomm=3D", pid);
 -				audit_log_untrustedstring(ab, tsk->comm);
 +				audit_log_untrustedstring(ab,
 +				    memcpy(comm, tsk->comm, sizeof(comm)));
  			}
  		}
  		break;

--Sig_/22mzgbuoGLDwMsiV.EOCHVr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa/vtAAoJEMDTa8Ir7ZwV22sQAIoqRPEysJcCQKdWTHW2PQhl
PhqQGfDhCYbCQHnSbdAEdyKNIYbkfxBgvtODcYHnTOCKC8rs627h00bU+NdEXYWn
L8QH69W1/gLDtGyxZtcpHuu1vayLxJsYQcX4iud/I351gVsF3cYCrSAT2MiXlxSH
QB9y/KTq+B7b9mKlIfrZDSR10lgy7wQZM+W9w7eMxjdPW1XbpJBWrsYP2IgwpeJO
ub61WBeRlahM0zVheBZQa2Ytp7MgZMzmTsM2zJpUK2OlYTHHGFkdB6nmnGeJV6Na
Mob9Fwz1/2lUdzGXEuEeS0HzjIKyK2CMDaYE8kZ1o+UE3H5t/V5QQ73PnEB/8nXd
g+434sIvP9F34qq8jo7qIkytk3Buivc69Q9JOmqkq87sJC3q/FVMq3bhDI9eIOj4
ooFTDm8ZhEsfNGn+fIGPZGmSitplC+nlWRB5N7Mu9sCprXertvIYGDOVT0SixuW0
EJUMbaOOzw2ITvVDegZnDPJD/Sw9u8m0hMKe7h1Yb5Ik7E3yywOTeJk4vbkM3wQp
5v+vpxD7nRybujFoQKoTupYQC/4FdRXgiIk0KEOeQ2Y8BSa6PhinKBoJgDKKFJV9
HkR8WZlxid028QwnCuoNXJmUMjS9ycmH8/Rtxoc89srU979oKa7CyAWYZDgkjwVo
d8iizTZXnkYNMMc3DNEe
=3tjY
-----END PGP SIGNATURE-----

--Sig_/22mzgbuoGLDwMsiV.EOCHVr--
