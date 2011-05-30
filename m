From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warningiIn Linus' tree
Date: Mon, 30 May 2011 11:48:28 +1000
Message-ID: <20110530114828.8ef6625b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_May_2011_11_48_28_+1000_LEVTr8ISRrs3AJHC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47676 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752256Ab1E3Bsh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 May 2011 21:48:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <len.brown@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, stable@kernel.org

--Signature=_Mon__30_May_2011_11_48_28_+1000_LEVTr8ISRrs3AJHC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (x86_84 allmodconfig) produced
this warning:

arch/x86/kernel/process.c: In function 'idle_setup':
arch/x86/kernel/process.c:645:1: warning: unknown escape sequence: '\i'

Introduced by commit 5d4c47e0195b ("x86 idle: deprecate mwait_idle() and
"idle=3Dmwait" cmdline param").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__30_May_2011_11_48_28_+1000_LEVTr8ISRrs3AJHC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN4vdsAAoJEDMEi1NhKgbs2FsIAKDwAjtUo5DItxVo99hZODzP
Rv3cAhZ2W9UBtYHfOTMvj6qQrHIqv4w8OpXihWZ0jfxCQaV16dUetqHj0mU0Lki+
5FnZWSwGV9fqN9NZ114ryKP1LYkL37sy0piiD7j79rwF3Gncdu8567aTNycGaY7J
zQvISdlPMGkUDwuPjGo+vF2NAuorhk0VxRsmshVY9W7jww3Qnjfph2yrMC8t484Q
dbiwjyodQKmjVAz057N/FdeZLC/zAvW/f79tDgNpS23/TRj8oQqqgJ1dbt0t6DMs
zkCjIVBqO83kKIsgfL7aNNLr3q3Mmctl9qurVkvaYnUx0WM9z4856TGV7ap713U=
=G5Sc
-----END PGP SIGNATURE-----

--Signature=_Mon__30_May_2011_11_48_28_+1000_LEVTr8ISRrs3AJHC--
