From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm tree build failure
Date: Sat, 14 Feb 2009 15:27:55 +1100
Message-ID: <20090214152755.6f672b37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__14_Feb_2009_15_27_55_+1100_4F4aA4SxWmqK21I5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56912 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbZBNE2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2009 23:28:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

--Signature=_Sat__14_Feb_2009_15_27_55_+1100_4F4aA4SxWmqK21I5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next build (arm versatile_defconfig and many other configs)
failed like this:

  AS      usr/initramfs_data.o
arch/arm/include/asm/unwind.h: Assembler messages:
arch/arm/include/asm/unwind.h:68: Error: Bad macro parameter list
arch/arm/include/asm/unwind.h: Assembler messages:
arch/arm/include/asm/unwind.h:68: Error: arch/arm/kernel/entry-common.S:26:=
 Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-common.S:27: Error: Bad macro parameter listbad instr=
uction `unwind .cantunwind'
arch/arm/kernel/entry-common.S:44: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:158: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:158: Error: bad instruction `unwind .save{r0-p=
c}'
arch/arm/kernel/entry-armv.S:202: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:207: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:207: Error: bad instruction `unwind .save{r0-p=
c}'
arch/arm/kernel/entry-armv.S:235: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:258: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:258: Error: bad instruction `unwind .save{r0-p=
c}'
arch/arm/kernel/entry-armv.S:286: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:291: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:291: Error: bad instruction `unwind .save{r0-p=
c}'
arch/arm/kernel/entry-armv.S:329: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:405: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:405: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:432: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:437: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:437: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:463: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:470: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:470: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:498: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:673: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:673: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:686: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:692: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:693: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:697: Error: bad instruction `unwind .fnend'
arch/arm/kernel/entry-armv.S:707: Error: bad instruction `unwind .fnstart'
arch/arm/kernel/entry-armv.S:708: Error: bad instruction `unwind .cantunwin=
d'
arch/arm/kernel/entry-armv.S:738: Error: bad instruction `unwind .fnend'

Presumably caused by commit 7e4e372df35c93e8f2693fd37010cec05c57ff47
("[ARM] 5383/1: unwind: Add core support for ARM stack unwinding").

Does this require a particular binutils version?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__14_Feb_2009_15_27_55_+1100_4F4aA4SxWmqK21I5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmWSEsACgkQjjKRsyhoI8xrSwCdGCLfNYTnxuluT0sAilKmB2AO
Q+UAoKQZWiJej49aBgYmnpDpNRzJ0De6
=6Drh
-----END PGP SIGNATURE-----

--Signature=_Sat__14_Feb_2009_15_27_55_+1100_4F4aA4SxWmqK21I5--
