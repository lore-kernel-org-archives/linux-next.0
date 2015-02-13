From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Feb 13 (runtime failures and 'non-zero
 nr_pmds' messages)
Date: Sat, 14 Feb 2015 10:37:34 +1100
Message-ID: <20150214103734.3052cd2f@canb.auug.org.au>
References: <20150213165615.1ad43047@canb.auug.org.au>
	<20150213185428.GA31193@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6mYdyl_z00KQLPIwBJ4_Q_m"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52762 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753294AbbBMXhm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2015 18:37:42 -0500
In-Reply-To: <20150213185428.GA31193@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Sabrina Dubroca <sd@queasysnail.net>

--Sig_/6mYdyl_z00KQLPIwBJ4_Q_m
Content-Type: multipart/mixed; boundary="MP_/4Pam9CByG4Qzsu=FO/Zff=A"

--MP_/4Pam9CByG4Qzsu=FO/Zff=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Guenter,

On Fri, 13 Feb 2015 10:54:28 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>
> I see a number of runtime failures with this version.
> It affects alpha, mips64, ppc64, and x86_64.
> Symptom is always the same. There are lots of
>=20
> BUG: non-zero nr_pmds on freeing mm: X (where X is 1..4)
>=20
> messages in the log, and the affected VMs don't reboot.
>=20
> I don't see the problem in curent mainline, nor in mmotm.
> Bisect points to "Merge branch 'akpm-current/current'",
> which isn't really helpful.
>=20
> Not sure if this is a bad merge resolution, so just take this
> as a heads-up for now.

Yours is the second report overnight (see attached).  Almost certainly
a bad merge resolution on my part (its a bit hard when Andrew get part
of his patch set merged by Linus :-()

I will fix up the merge on Monday (unless Andrew gets more stuff merged
or updates mmotm for me).

Sorry about that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--MP_/4Pam9CByG4Qzsu=FO/Zff=A
Content-Type: message/rfc822
Content-Transfer-Encoding: binary
Content-Disposition: inline

Return-Path: <sd@queasysnail.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on bilbo.ozlabs.org
X-Original-To: sfr@canb.auug.org.au
Delivered-To: sfr@ozlabs.org
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ozlabs.org (Postfix) with ESMTPS id 5662314028E
	for <sfr@canb.auug.org.au>; Fri, 13 Feb 2015 22:03:36 +1100 (AEDT)
Received: from kria (unknown [IPv6:2a01:e35:8b11:1410:6ea0:5486:4093:b69])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A70C7A6321;
	Fri, 13 Feb 2015 12:03:22 +0100 (CET)
Date: Fri, 13 Feb 2015 12:03:26 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: linux-next: Tree for Feb 13
Message-ID: <20150213110326.GA26177@kria>
References: <20150213165615.1ad43047@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20150213165615.1ad43047@canb.auug.org.au>
User-Agent: Mutt/1.5.23 (2014-03-12)

2015-02-13, 16:56:15 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> Changes since 20150212:

Hi Stephen,

Your conflict resolution in

8fe7fba50596 "Merge branch 'akpm-current/current'"

for mm/memory.c looks a bit off.  I get flooded with these messages:

  BUG: non-zero nr_pmds on freeing mm: 4

and fixed it with:


diff --git a/mm/memory.c b/mm/memory.c
index 450e4952c5ef..802adda2b0b6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3350,7 +3350,6 @@ int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 	smp_wmb(); /* See comment in __pte_alloc */
 
 	spin_lock(&mm->page_table_lock);
-	mm_inc_nr_pmds(mm);
 #ifndef __ARCH_HAS_4LEVEL_HACK
 	if (!pud_present(*pud)) {
 		mm_inc_nr_pmds(mm);


references:
http://www.spinics.net/lists/linux-mm/msg84294.html
dc6c9a35b66b "mm: account pmd page tables to the process"

[CC'ed Kirill A. Shutemov]


Thanks

-- 
Sabrina

--MP_/4Pam9CByG4Qzsu=FO/Zff=A--

--Sig_/6mYdyl_z00KQLPIwBJ4_Q_m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU3orDAAoJEMDTa8Ir7ZwV450P/3Z6YCG66rtqaLPnZETXv5ux
ZmlIJZWUqeHvN7NdnvMHO8R18vbxLt42v3GFJWo1xOSLKpYyW6/n6n+uS4vOptIl
VOOpJeO96tGF0tS6dbXMV+mWnhCtw6cNjHNb0G92heb8Jh5anLIjRt4sqJsgKsDV
c9zJzblJMJv/KqwDomUBogYkhhcNZrJNkNbvsCKrfxCg/SV5LI6X6HINFDqe/WiV
71WErHVNudZ6BxqfccyBftzS5zE34lMW1XzLpoz0bCv3AVzBiVEIyb18P90wilOp
pWDr1E2YMriIYdMl9PJazEM4OU6OoS1djorrLRW6yuZEl+srbRei5D4F/4hhzkoV
JGjY0QXXEqxW5+28idHBAowF7FLMXVjIsl/ERZ5wCzZiq8BwfS9/+W75O+VwYQvk
LcOQOGQRv5Fr94bNxqe/AFTAVBoZavgNwhRkJ7kOKaYPurQGpjy8m9To0omKjPOl
ZiyxlCAyWgrKmqVIQ+19xoq15FjG1H5aLlOT9r/WjcAIScF1ZZ879/9Vt6CdmJ1+
WV+6F/cAsJbCrabGuhhf7yDtLs8g2cdQgrokzZeF/pC7i+yXAV3P/LKi9B15B2Dv
tGoU9w35K3FhxVzw/jIvQnqfu/9ldTaax3eUGgbCJBkzck2GzHP02R3oQyPfIqtT
o6EOMwbpTnSAySGFfObj
=WLxx
-----END PGP SIGNATURE-----

--Sig_/6mYdyl_z00KQLPIwBJ4_Q_m--
