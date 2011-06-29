From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the security-testing tree
Date: Wed, 29 Jun 2011 13:48:00 +1000
Message-ID: <20110629134800.9ee0d5b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Jun_2011_13_48_00_+1000_98y2=.A0GHTrxRDA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39141 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751711Ab1F2DsJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jun 2011 23:48:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

--Signature=_Wed__29_Jun_2011_13_48_00_+1000_98y2=.A0GHTrxRDA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the security-testing tree, today's linux-next build (x86_64
allmodconfig) failed like this:

security/built-in.o: In function `tomoyo_bprm_set_creds':
tomoyo.c:(.text+0x4698e): undefined reference to `tomoyo_load_policy'

I am not sure what caused this (but tomoyo_load_policy is guarded by
#ifndef CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER
and that is set in this build).

I have used the security-testing tree from next-20110628 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Jun_2011_13_48_00_+1000_98y2=.A0GHTrxRDA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOCqBwAAoJEDMEi1NhKgbsnxgH/jfqe3YEdNMYFjO/f8hZE7RR
XGygjtUUvuTvQlGJWLwCMrC+wLIaOcUiOcfefdHeK0seqtquRU/ncZxcy5ylk9mi
IUdpanGvHXZQNBN5EQKUtjEyOvgOavj8jQ5iG4F4Hxhj3SN23Pmz8q20CFVwU+Xb
zTZUw5IBNGVfXgwDNYmbJ+DMz4jBnpMmf71JCmob5Jx2dcG96SoriYAIqCGtR8Yz
t3LRCFwUyqmiUwPKEwz3V5K4g3i0n8uPHGWFiH5kAh0UvZZkD2Veu+AcooEe4x0p
z2RwUPtso5uy0/T3GfZP0cwJlvxauFBEJqChhpmCxjSHs0BkySW5JxklVdAbodc=
=N4xd
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Jun_2011_13_48_00_+1000_98y2=.A0GHTrxRDA--
