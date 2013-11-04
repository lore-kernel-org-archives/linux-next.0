From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: randconfig build error with next-20131104, in security/integrity
Date: Mon, 04 Nov 2013 18:13:49 -0500
Message-ID: <1383606829.15186.25.camel@dhcp-9-2-203-236.watson.ibm.com>
References: <CA+r1Zhir86Mdmps5N1awK7mJxf1CWgkr-RDKYVhmpj_3+oYyYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhir86Mdmps5N1awK7mJxf1CWgkr-RDKYVhmpj_3+oYyYQ@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, james.l.morris@oracle.com, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 2013-11-04 at 11:29 -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> security/integrity/digsig.c:70:5: error: redefinition of =E2=80=98int=
egrity_init_keyring
> =E2=80=99
>  int integrity_init_keyring(const unsigned int id)
>      ^
> In file included from security/integrity/digsig.c:22:0:
> security/integrity/integrity.h:149:12: note: previous definition of
> =E2=80=98integrity_init_keyring=E2=80=99 was here
>  static int integrity_init_keyring(const unsigned int id)
>             ^
> security/integrity/integrity.h:149:12: warning:
> =E2=80=98integrity_init_keyring=E2=80=99 defined but not used [-Wunus=
ed-function]
> make[2]: *** [security/integrity/digsig.o] Error 1

Thanks!  The following patch should resolve these errors.

Subject: [PATCH] ima: fix random config build error

Define stub integrity_init_keyring() definition based on
CONFIG_INTEGRITY_SIGNATURE, not CONFIG_INTEGRITY_ASYMMETRIC_KEYS.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
---
 security/integrity/integrity.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/security/integrity/integrity.h b/security/integrity/integr=
ity.h
index b9e7c13..a3c678c 100644
--- a/security/integrity/integrity.h
+++ b/security/integrity/integrity.h
@@ -123,6 +123,7 @@ struct integrity_iint_cache *integrity_iint_find(st=
ruct inode *inode);
 int integrity_digsig_verify(const unsigned int id, const char *sig, in=
t siglen,
 			    const char *digest, int digestlen);
=20
+int integrity_init_keyring(const unsigned int id);
 #else
=20
 static inline int integrity_digsig_verify(const unsigned int id,
@@ -132,24 +133,22 @@ static inline int integrity_digsig_verify(const u=
nsigned int id,
 	return -EOPNOTSUPP;
 }
=20
+static int integrity_init_keyring(const unsigned int id)
+{
+	return 0;
+}
 #endif /* CONFIG_INTEGRITY_SIGNATURE */
=20
 #ifdef CONFIG_INTEGRITY_ASYMMETRIC_KEYS
 int asymmetric_verify(struct key *keyring, const char *sig,
 		      int siglen, const char *data, int datalen);
=20
-int integrity_init_keyring(const unsigned int id);
 #else
 static inline int asymmetric_verify(struct key *keyring, const char *s=
ig,
 				    int siglen, const char *data, int datalen)
 {
 	return -EOPNOTSUPP;
 }
-
-static int integrity_init_keyring(const unsigned int id)
-{
-	return 0;
-}
 #endif
=20
 #ifdef CONFIG_INTEGRITY_AUDIT
--=20
1.8.1.4



--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
