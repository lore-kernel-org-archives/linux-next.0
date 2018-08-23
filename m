From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the apparmor tree
Date: Thu, 23 Aug 2018 10:20:12 +1000
Message-ID: <20180823102012.0c7cbe1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ne3jaP9jZKMvco7v7M/_dyG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Johansen <john.johansen@canonical.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ne3jaP9jZKMvco7v7M/_dyG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

After merging the apparmor tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

security/apparmor/policy_unpack.c: In function 'unpack_dfa':
security/apparmor/policy_unpack.c:426:1: warning: label 'fail' defined but =
not used [-Wunused-label]
 fail:
 ^~~~

Introduced by commit

  fb5841091f28 ("apparmor: remove no-op permission check in policy_unpack")

--=20
Cheers,
Stephen Rothwell

--Sig_/ne3jaP9jZKMvco7v7M/_dyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt9/bwACgkQAVBC80lX
0GxBPwf/cHb/E+iZ6IeOU9O64Y/SExKCaGLlsOAp/7K2wbsiVmRdkeyBG9mO1Qlt
GVEt50EmvREmYdiJkJ1wojfPC3+ML/ScehG/meMqLKoY1AV2r4oNRGdJc2U/RzHs
c9C4qBBlltjVRw53tJFLDzivc1wBqkYN113s76kuu5TTC2xY+vChg21DvjxHKbhK
NBsGdXmKZRHr5avAdm6KXdda5kLbhIfMgq1/IH7vNLo3NsyQClFGrf+5Qa1jXKIu
Ho3WNcBQswY9q8wi7q/BnFAeZs9w/qdwZGMdTfwUCe5EadZgXsWXr6XMOL9Ng49n
OMF4Qd2HHPyep/jp0iVlKyW8YlsTJg==
=3qEc
-----END PGP SIGNATURE-----

--Sig_/ne3jaP9jZKMvco7v7M/_dyG--
