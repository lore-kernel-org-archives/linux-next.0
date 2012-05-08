From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed import of rr tree
Date: Tue, 8 May 2012 10:59:04 +1000
Message-ID: <20120508105904.1709f6f2b7da99e86327e3e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__8_May_2012_10_59_04_+1000_7ZEP2dN.KiJ4j_ym"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:40607 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754377Ab2EHA7M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 20:59:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_May_2012_10_59_04_+1000_7ZEP2dN.KiJ4j_ym
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Importing the rr tree today produced this:

$ git am ../quilt/rr/virtio:balloon_separate_out_common_code_between_remove=
_and_freeze_functions.patch
Applying: virtio: balloon: separate out common code between remove and free=
ze functions
error: patch failed: drivers/virtio/virtio_balloon.c:381
error: drivers/virtio/virtio_balloon.c: patch does not apply
Patch failed at 0001 virtio: balloon: separate out common code between remo=
ve and freeze functions

so I tried applying the patch with patch(1):

$ patch -p1 -E <.git/rebase-apply/0001
patching file drivers/virtio/virtio_balloon.c
Hunk #1 FAILED at 381.
Hunk #2 succeeded at 408 (offset -1 lines).
1 out of 2 hunks FAILED -- saving rejects to file drivers/virtio/virtio_bal=
loon.c.rej

Did you use the wrong base (v3.4-rc6)?

I will use the rr tree from next-20120507 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__8_May_2012_10_59_04_+1000_7ZEP2dN.KiJ4j_ym
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPqG/YAAoJEECxmPOUX5FE7rkP/1NhZyNULNn1WGPYCyz9oUx2
46Nf63x4BGBL6xWrrFYxSM0Wh7gxbuq9/z0NUguCO1x8XDFN69HxO6pHhFJKz1gl
vlKj9mkc4MztSKjXPRjzxeqqhlhDMtPCwEK2nrDdOPuRogJ6/vxtfnjfRTyDR111
cSb5SsMW+3di50rc4imoleiUzAYs/CL6H157TIqRegO97nVnyn4Q03Mc5N65rgEA
vypVcAN7WdLO0qu5iCksi/C/TrjXhAuTShmdrw0nwcN6iCfjF+4INlYr8GTmAzYR
Qh4gVJWk2hESV6r7WBHgAu5mWTSE3QKdrof3jTlYUOKKiN19QJojm6W47Vgg6G3m
KLAXafu26Ar5EvsN8YdU8Rxcf49mMLAgUW8fo2w9bMcqDx1dcN4kxFUOodFzo53s
c7OYSGWQqsKtidnJL5mz6OqZUm4A4/+taXvXr0X7shlWjh14r9HY9AFsXvJWMfTu
/8gIWyRHB+q3MtLFqoBZ6W0XwstUeBgl+Zqv4/AlC0R1rFYE0UE8Q9l9eXT/vfhP
hWZXjdPeIa2urwWrGhTAWjMm9SOZrN8LPdGjAJJZcuOvLFWNtoEuA6U1HQZEexjD
qeGGo2lGGs+NIVokr52uHifyppCSX2+8tXuHIpIcubN3VjIf/L1vc18qCtXok2zj
JkuRGRweK1u0NGAOgMJl
=kV3t
-----END PGP SIGNATURE-----

--Signature=_Tue__8_May_2012_10_59_04_+1000_7ZEP2dN.KiJ4j_ym--
