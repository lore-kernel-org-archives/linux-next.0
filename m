From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the workqueues tree
Date: Tue, 19 Mar 2013 14:58:04 +1100
Message-ID: <20130319145804.7af0b995413adb35d16992ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__19_Mar_2013_14_58_04_+1100_eplpb9ulAv32tKEL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38438 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3CSD6N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Mar 2013 23:58:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__19_Mar_2013_14_58_04_+1100_eplpb9ulAv32tKEL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

After merging the workqueues tree, today's linux-next build (powerpc
allnoconfig) produced this warning:

kernel/workqueue.c:260:13: warning: 'workqueue_freezing' defined but not us=
ed [-Wunused-variable]

Introduced by commit 699ce097efe8 ("workqueue: implement and use
pwq_adjust_max_active()").  This build does not have CONFIG_FREEZER set.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__19_Mar_2013_14_58_04_+1100_eplpb9ulAv32tKEL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRR+JMAAoJEECxmPOUX5FErjQP/0RqlES48n9kPeseH0N+NfeB
n20iWJGzjyAGH2527bt7OFaxHhDe/BPZjQ6xZ/HzWp0wRGBQ/PDaqT0ZoeUCl+DK
weu73ucYbbL1GxZp4EW9MUTm7wC1s9VduoQJ3UiLT7KiyrqGHmWrjv50vitK3epz
7njWe8qC4xpoxdvqXIoopGzYd6W4qiwX6qqTv5TGQ/bw0ihWi1iFRcj9CQUPDohr
Z0v20rjEeXUQQd06Z22nZ34X03pzvQglBDvwdlQFw0yGYTfoD7iDNiW0szODgkVx
l9Dcz+DBAvQhDHa6U4bSVKoU9c+b8br/qYuF207NYwYCDCJ/auGjMO6GeIcArB88
94PrNrqDU3apyMY3r1zRGZmk1Wdj6ao8kTx2kKOIpddWAcrxaxvNjoYDxD0FvwGH
psLudIww1QU4Oy8tloF3URKTHtIPPWFStrb2RTuoVIHH+qS6gdXAYC8yfV9nq9RV
Y8kApRHrUvWpYcoCVt82QK/JSzBrvvpB++NyteYjBEC6KDhIC7NrN8xM9FZMEQjC
EOnTSlKAha/MCB1Uvfk8injZSglP1W0tH9gAqBuVjAhS7sT5d0dqUCFGYHX1CLNG
EsfNrwSvU/3NnEISHTjh4zo/P0A0E8zmDZLNwata7fcuiHasHFa9jZXAPD5mLiHK
9wQ8U7tqua9saiKXy4XU
=tzM+
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Mar_2013_14_58_04_+1100_eplpb9ulAv32tKEL--
