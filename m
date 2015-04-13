From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with the vfs tree
Date: Mon, 13 Apr 2015 17:15:59 +1000
Message-ID: <20150413171559.7c414a1b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i_bR+tihZn.MlU/2A92KrTE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/i_bR+tihZn.MlU/2A92KrTE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

Today's linux-next merge of the ftrace tree got a conflict in
kernel/trace/trace.c between commit aa1083274669 ("VFS: kernel/:
d_inode() annotations") from the vfs tree and various commits from the
ftrace from the ftrace tree.

I fixed it up (the latter removed a lot of the code modified by the
latter) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/i_bR+tihZn.MlU/2A92KrTE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK20zAAoJEMDTa8Ir7ZwV4SwP/RQoNmBbNLqfLhasPq2VYjfA
y2/J0XD9FpD5LvloBsyvoYR0DhLex2ojL0KOVr3wZREtIoLYibmXq+/H7I/Xpq7d
TRaUTUCQMRDzG07LWMNiRri/Dbci36CRUzDMaPavQvc5PewLz1U70ra1BF15G5ym
pcks46Ov67XuWRIxAOSNn8H3gKZtxFE+TVxkoJRgvl7d9CDMqzql2Np4sPqYr1q/
ZYZN6KXPLzLaSiy3n8J5rQbVVl6WT4Py/b7grNINuBJhkwJcsQlIKpp7I8QnU4gb
TIXbqp7Pr3bmCMtnApzwh86ap2+1e7as+DTcnZ64S9la6Wua7ibaet4Dwaty9IT2
xAQp/sEcKUaBTAJyxIT98as3eSYpczy5bYwmFg5Lt6xQPPJ6fmX5Q6cuPMPJkSy3
faq/59Jq/DMgLP0mbbJWUt+CGMrU6PnkvzJWnw7nBRPqIGOeH/mTBIfH9ak2H1P8
rgyrHJ9ucveXSI4A4BiQaXAViBjZ+CJUU3OPhBK86MdLKjV8GAdSWjH/6+QZk3J3
eN1HuO/Wd6y8tq1BX3Bay9wcQj0KSmKmIsUk33VMixjiHvfJl/3eaGIamx6nkh+/
9+sYctPCHflZ7be3ZQp8zMxuZvwgKe1psQF3Fzdq9mb+oQiDEPh8sCPcg1knBb+l
QIgYIElOY+LIcY332Cun
=7FnL
-----END PGP SIGNATURE-----

--Sig_/i_bR+tihZn.MlU/2A92KrTE--
