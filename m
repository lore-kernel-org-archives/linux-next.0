From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 1 Nov 2011 19:57:52 +1100
Message-ID: <20111101195752.edd10d7028ec859db96415a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__1_Nov_2011_19_57_52_+1100_TatmNHvOvXLGdoU_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:39767 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134Ab1KAI6Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2011 04:58:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>

--Signature=_Tue__1_Nov_2011_19_57_52_+1100_TatmNHvOvXLGdoU_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

next/drivers/scsi/sd.c: In function 'sd_probe':
next/drivers/scsi/sd.c:2583:43: error: 'SD_MAX_DISKS' undeclared (first use=
 in this function)

Caused by commit ddabd33db5a2 ("drivers/scsi/sd.c: use ida_simple_get()
and ida_simple_remove() in place of boilerplate code") (which was fixed
up by me). I am not sure how to fix this properly (SD_MAX_DISKS was
removed by other commits), so I have just reverted that patch for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Nov_2011_19_57_52_+1100_TatmNHvOvXLGdoU_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOr7SQAAoJEECxmPOUX5FED5MP/A9ukhM2b3+RQL5v9ySBGNmJ
pEnLm/6I4DyFJNn6XsK+iP1rGU0SulhEImFHnrCZOsKnW3mz5syCkWR+CakvgNW+
Jsr7jJjKzbRWiW132ljEUtipVHjM/pb93+zbpcCjd6uBjKVW6+ufBwLZtYhujz6Z
+eSV06WdX/6xA4OVbJLoHQmK3s//9E5FR/ADnrMXLb0m/6+dbaWs1Pu982llHT4E
4wTLZBJcR8NbqWbrJb286mEmoqM4g8078rTNO8jBwFdkVS9G+o0yh1XmcRCpYyd2
BrDky9fYmcU2K5Tb6LPrGV0X/uVVkI+knRsgyw2YtOdlDHNbXarxevJZzFiMxzd5
gSw1Y6svNbNq51PwI1h90DtIMPJAqPFm9ecE9qAgDLkjbXz1NIf+QUJXUVBu0HoL
Sl00O18ijfe90eV+WvvRGXTX6KuO6y1ORSUI1w1vwgAxmSc1jLf2hC7Dxh+DkVvU
nFAefxC6h/2SZg0LRGdg8sjhfQ7MbxjORhRVmM/KKbjmiQGOfQnbgFi+Otk7m7WE
fM1/sKNvvBhWw9qS9xCsZJHHW6wLyO6Phd+NtHSKaDlTpRS0ALzb/B3UM8CVL52I
R3LN5lLt88WpBGYO+f2b1xtrgcU6CDQNRp6M2na5nEXMB54hZuRwjRnGtTmUsS9R
bbAN5xcJPUQarbC5qXfX
=dsOq
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Nov_2011_19_57_52_+1100_TatmNHvOvXLGdoU_--
