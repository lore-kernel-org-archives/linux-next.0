From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
 (driver-core tree related)
Date: Tue, 8 May 2012 18:02:45 +1000
Message-ID: <20120508180245.002eca30eee763fce1ad468b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__8_May_2012_18_02_45_+1000_Mwm2pAZSHokhTvIS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:45789 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256Ab2EHIDA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 04:03:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay@vrfy.org>, William Douglas <william.douglas@intel.com>

--Signature=_Tue__8_May_2012_18_02_45_+1000_Mwm2pAZSHokhTvIS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allnoconfig) failed like this:

kernel/built-in.o: In function `devkmsg_read':
printk.c:(.text+0x27e8): undefined reference to `__udivdi3'

Caused by commit e11fea92e13f ("kmsg: export printk records to
the /dev/kmsg interface").  Most probably the "msg->ts_nsec / 1000" since
ts_nsec is a u64 and this is a 32 bit build ...

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__8_May_2012_18_02_45_+1000_Mwm2pAZSHokhTvIS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPqNMlAAoJEECxmPOUX5FE+CAP/1e+emUdGYBueY7i4QKwoSuc
1nTYsP55/k8PBvNDKit+ePrb4y+1HYxFnRUfXl6EenODFGSjOI0+HvtwyL1Zof/v
QDXzn4ak+A18doc9ra+Kc1X+tUqyCI58fGOa/bfKdTFGK+MRDvfiVlzd0taoFgqr
FHiJRK5Gj8+/y62kMdVHs0/Godd3m825HMw+W8pUIV35qjee1YBSkOuqWJKz6PI4
0iNb+Wwodgzl6c106K4G7LKMROOlih29YvRk4Zf0Tw9Jlz5NogfszhhlWb8L/IUl
+YEzVph4o3VaBKYzVX4PyDJgK102Dad/x+up0e31drhBoWJUayuxS+IyIWN12IOg
uinsx9lfrHbir0ec2aKsg5Z5yEEe4ksEO8YxjGUc4CZLucUSrMHY+r2ZO1aVrmH+
uBFaqQGQWnreOGMhAl+jnoY9U1zI3Zn3a/r7v7LiRsNYsKR41UgLnmcWOqNjel6+
rtd3cdGJrrv+tirnNq4p34cI5+4ZdqG8bSE7mS8mgmFnhfguYfGbNmgepYz+j3c+
bW/5+JHyjt66ONkq15opWBvQ77hHqx8vUHAiqTRSp13AlTW5Wv++2llyuTmKXBac
oKYacB0vxOrGvDnIvo8CJvav/HTI2dHata0JqZ7ug90YF5g57+ce08lnf75oAmWp
ViTnKWZI9dsJk60lB1L5
=tW8/
-----END PGP SIGNATURE-----

--Signature=_Tue__8_May_2012_18_02_45_+1000_Mwm2pAZSHokhTvIS--
