From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 21:27:29 +1000
Message-ID: <20150407212729.36e459cf@canb.auug.org.au>
References: <20150407212153.33327869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5F6KSRBVaAwwS7NQO4W0eHA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43760 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753174AbbDGL1g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 07:27:36 -0400
In-Reply-To: <20150407212153.33327869@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>

--Sig_/5F6KSRBVaAwwS7NQO4W0eHA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 7 Apr 2015 21:21:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in
> kernel/watchdog.c between commit e164ade07b21 ("watchdog: add
> watchdog_exclude sysctl to assist nohz") from the tile tree and commits
> e0afaab242da ("watchdog: introduce separate handlers for parameters
> in /proc/sys/kernel"), 866d62a433cc ("watchdog: enable the new user
> interface of the watchdog mechanism") and 09d1b2261fcc ("watchdog:
> clean up some function names and arguments") from the akpm-current tree.
>=20
> I fixed it up (see below, but it may need more work) and can carry the
> fix as necessary (no action is required).
>=20
> diff --cc kernel/watchdog.c
> index 083bd9007b3e,f2be11ab7e08..000000000000
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c

It also needed this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Apr 2015 21:24:56 +1000
Subject: [PATCH] watchdog: fix up for bad merge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/watchdog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index c5c87d1af41b..95ad9d6cb761 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -721,8 +721,6 @@ static int proc_watchdog_update(void)
=20
 }
=20
-static DEFINE_MUTEX(watchdog_proc_mutex);
-
 /*
  * common function for watchdog, nmi_watchdog and soft_watchdog parameter
  *
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/5F6KSRBVaAwwS7NQO4W0eHA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI78mAAoJEMDTa8Ir7ZwVz+YP/jjFRLdqY6SNE/40JGAWGegg
nGcRJ29o0F/rN4wSFkEsbwMxlR1I9lWJn9AhAFYdIE1BF2qEkBTBEDwEn4ppwyXf
Tt9Qp8ZodeeR+W/8r5DwHB+JNF1kDJtsb7yEGGKRKx/FC881ozhgFpltV2gQgUqX
V+ZABGvebXImrzemBMxagcyGVO7qFp3BNsM0RT9TBnoxXfNCcDrBeXJ/zL+PNBOD
Oc21UQQhGuyq2rL8Q4OOLMJZshuCWNSTO/Fv4WFGCoYSlT0/V3fpB1EY/X9q+5aY
4BEL1wkUs8zdxcN2CwzswE9fSbSudnpkHDKUf/REyG7aFjMgetuEozoHkN+Ky+oM
s2rDxXlQ8iCGlWmId6Wj2I44a8gRm4Cu9We4x3D3I+FPTt0pa+xqV3UkAkNzHS/W
T5WUaILp0FkAnv4bPlfPcJWOoX1afeKRD6ZVytsg3art6iHB/tORzb7vCIWfgfDj
IIULlBodqycBWjp1FRpMvKzIRrGHGyww4KdfSvvkdMVqjEh1DhcgkKb0qVPXidC2
O/EVInK2B9Wvjg2LUa2oOw6F/Be6/G84xz24vv5nU8VskJxKBXXBs6ryzm06wInV
EIAnP+X7wBuPOgRv8er53KAFQXbuea3HqluBsN+yDpJ0aLjMoURwJxSCKwFm9A+J
y8MSFaPWMFWYmlzzOnkE
=HcIg
-----END PGP SIGNATURE-----

--Sig_/5F6KSRBVaAwwS7NQO4W0eHA--
