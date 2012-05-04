From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (nfs tree
 related)
Date: Fri, 4 May 2012 17:27:18 +1000
Message-ID: <20120504172718.738a452880ccdd61d60e33e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__4_May_2012_17_27_18_+1000_tylupfs8nfonzVO."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:34378 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029Ab2EDH1p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 May 2012 03:27:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fred Isaman <iisaman@netapp.com>

--Signature=_Fri__4_May_2012_17_27_18_+1000_tylupfs8nfonzVO.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
ppc44x_defconfig) produced these warning:

fs/nfs/direct.c: In function 'nfs_direct_read_schedule_segment':
fs/nfs/direct.c:325:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:325:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:325:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:352:27: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c: In function 'nfs_direct_write_schedule_segment':
fs/nfs/direct.c:622:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:622:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:622:11: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]
fs/nfs/direct.c:650:27: warning: comparison of distinct pointer types lacks=
 a cast [enabled by default]

Introduced by commit 584aa810b624 ("NFS: rewrite directio read to use
async coalesce code").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__4_May_2012_17_27_18_+1000_tylupfs8nfonzVO.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPo4TWAAoJEECxmPOUX5FEoAMQAKI+s0oBMveNjblA/iVY4S6K
Tj0YBBUcDdi3fhIGS7usPIXFuwMvIeAWZf0Rp60jQRQvqf5UuVmr13hmHYXUszOw
5FXrTc7BA4lREGd6bZX8oC/KyHTXvQp+Sw7Rww90Y1cKXqhjio9zD4anBJmZyvx2
hDpP9ZO3yY0CKz10z1Jg4Vcrlw5TNBUXTJgM8ejFh34bVUj3JdCbvkoYMOwAHhwL
DlgIrUs7vf2GvXJhqBhcex3VbG+nMZ9gUP1CyvKwm+bYjBO0BpSFJjuLvWXh32Rs
EGY0DCMgn8ZIVuXS/HI5Tdz2NtlLncTjCGNoXXBWDnwUWPoQKTPqD2EaPt/6UJ6p
5fBIgZMv+vQsD2g+iVzQ2dPzUc/ffjl/nOjH7/yBGOrG0JPRHXHBQ2E7FVkVcUoD
pyE5jJjVuMy/91/QBONcaawg+F55waF7NXNyHDORZTQz637cHu5CZPgiAnw+1JQ7
ckKkwI7IOduqu0aQAV5EFWS2KfPIuEY3rA4q7SBUM6FMXHLvpu6+c7nPO64tG2U+
lTCEOLilhErBBCDXnuoKLlw7J6YtkMi8rnx8xkSN058J+angFrXH8p1gGOEUYya5
LKi8NDgfeqNZVvmBfcQJed225lxAzIWQLiiNjAxQ2rmgl4JVtohnA/dLU+ZidsH/
BKA3s4y3Lq1C/JmrLzBy
=tczX
-----END PGP SIGNATURE-----

--Signature=_Fri__4_May_2012_17_27_18_+1000_tylupfs8nfonzVO.--
