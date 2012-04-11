From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the md tree
Date: Wed, 11 Apr 2012 13:42:59 +1000
Message-ID: <20120411134259.61f755a90055b23a6876687b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__11_Apr_2012_13_42_59_+1000_Ws9vxMzv_hf=8ZJg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Kukunas <james.t.kukunas@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__11_Apr_2012_13_42_59_+1000_Ws9vxMzv_hf=8ZJg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

After merging the md tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

lib/raid6/recov.c: In function 'raid6_has_ssse3':
lib/raid6/recov.c:27:2: error: implicit declaration of function 'boot_cpu_h=
as' [-Werror=3Dimplicit-function-declaration]
lib/raid6/recov.c:27:22: error: 'X86_FEATURE_XMM' undeclared (first use in =
this function)
lib/raid6/recov.c:27:22: note: each undeclared identifier is reported only =
once for each function it appears in
lib/raid6/recov.c:28:16: error: 'X86_FEATURE_XMM2' undeclared (first use in=
 this function)
lib/raid6/recov.c:29:16: error: 'X86_FEATURE_SSSE3' undeclared (first use i=
n this function)
lib/raid6/recov.c: At top level:
lib/raid6/recov.c:25:12: warning: 'raid6_has_ssse3' defined but not used [-=
Wunused-function]

Caused by commit 56d3ac7ef905 ("lib/raid6: Add SSSE3 optimized recovery
functions").  All the world is not X86 :-)

I have used the md tree from next-20120410 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__11_Apr_2012_13_42_59_+1000_Ws9vxMzv_hf=8ZJg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPhP3DAAoJEECxmPOUX5FE8P8P/3fPobKQCtkJJicS2wf7Jehu
GWbIEuOFIswmOtA1I7JJ4WXkb2Pmwif3iNLcFRgAU+18wMENd6DhK6Htn9OPoqKj
QYv7FuPJ77mC9ry0RZUcOSgA0jCFdkcI78BDGv6V6Pfxa6bCPyu+0vswXdKLNAZd
ywYxpNs8fbUqZa5u9FBwtJfxajpAcotAQXg3zItx1iUF61uqAMChqkmi6+hoGs6P
ga8NHTvQW4EbAymQG5sf/MwImVFyuzrfDIvfl9bD+m/pHAUsXYBh2soLpr42E1M/
J/9atKFgy02tEk9aIXqnuVKswZaUKRWjRtQltaDSytzsd5yag3jJZgzG4ZhwdnDj
xn6okS7wjKQQJqBplvazPDIk1o/RhDgo509Yca0wuVloHERnPtfHJwx/E13BvUzi
bBtbGZCiLOjca52XpOStCkLCephpgZG974hESDJYc0WLFkbBN3phDpF6ONJiVEZa
Mtuf0XdCtxjb68IWi4RNxiMsbJWTgw6Z6i7cakOrJFuOxoZ/Z8ybR2mNatLzmVVj
puEO5O+OqYBb8ROePd23ONOUcN6NcadvO0yluT9V97dpO0GnYJkUCfQUlTpsThQB
aJGh6hRbSsDgrBtu2o3EforRxWxs8obXlTsnRe6TzDkdzGN61j7r+D/tSsc6lu+4
+UJ4aXU1qbn4WvfFhQaa
=kZkL
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Apr_2012_13_42_59_+1000_Ws9vxMzv_hf=8ZJg--
