From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build warning
Date: Fri, 15 Aug 2008 12:59:57 +1000
Message-ID: <20080815125957.97930de0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_12_59_57_+1000_/KR26p4ksAEpyc3F"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52871 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752347AbYHODAJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 23:00:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Jason Baron <jbaron@redhat.com>

--Signature=_Fri__15_Aug_2008_12_59_57_+1000_/KR26p4ksAEpyc3F
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

In file included from include2/asm/string.h:4,
                 from include/linux/string.h:19,
                 from include/linux/dynamic_printk.h:4,
                 from include/linux/kernel.h:19,
                 from arch/x86/boot/memory.c:16:
include2/asm/string_64.h:34:1: warning: "memcpy" redefined
In file included from /scratch/sfr/next/arch/x86/boot/memory.c:15:
arch/x86/boot/boot.h:231:1: warning: this is the location of the previous d=
efinition

Probably caused by commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
("driver core: basic infrastructure for per-module dynamic debug
messages") which added an include of linux/dynamic_printk.h to
linux/kernel.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_12_59_57_+1000_/KR26p4ksAEpyc3F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkik8S0ACgkQjjKRsyhoI8xipACbB4gTM34yaDNDRyxbq/3lYfdU
kXMAoJZT5PfrvHw5WT2WqajO7ELCsXbE
=72VV
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_12_59_57_+1000_/KR26p4ksAEpyc3F--
