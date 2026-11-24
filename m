Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537775;
	b=HL5NRLWsBkSziGjsjM0ykkJUXWYxNHhF6TQVMUMeTbinPu7I3u/tQIqtWdIU02M7rYrc
	 lcmLnkcLEfGt/GPHXaOKrGd8dSbolglAHgp0AzRjSQ2TVlRx63wiMBM6muH0R7xZ5G7r8
	 kDYXbPn0LLDUS37gcpjpdMCiT6W8KL9DLweoxJ1SOavmtSg75MvaFSfA7a18bhiDYDuCS
	 GAktebPZiYYzwOg6hLD16O56XlV69NYoJEWsoDnXnpzZPrK8Rn3m+J1P9Oc48mpN4BClM
	 YQklkt2pL0ZVp59eJt9BoethI2IfzVjM6q4jSjDpMNbybbaCv9j2iHHi+h2qt72rxYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537775;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=tWySwmkRBU/RwVT/X9/RQW6df9RVZygUwLk/9sFD2/E=;
	b=f5YYQgxH6RTgXTZ1O82UxKgxpS0I8ToMSdGuQpPT4X+4zLZgtz9ALGLLmUyY1dfXLRvZ
	 4lOrY03h67nioh5ozx5fvxk1s6n8ZZS0kJhA10D4ftM2FKQUYZGEOAyvGB6ORgd5G7yEr
	 +kUCo77t9daMHtE0ARSTxOXsHXCGHGC3XB5TYu/AX449Mz4lHY5dva0/GxpSsKaKwxk1T
	 HE7WEYM6G7YpHa0XH45xuqhn/NsI2ir/0z8XzeophLyRxWUyZJ9P9g0IoGlYqCQjEpUnr
	 KSB1zdx0FTTEdgbktLVZsAowtjuKR/l277Y5ZwOTcEi7G6sVBpawBAW3lcQXEyc4P5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QtC/qqyD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0704606A31E;
	Tue, 24 Nov 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtC/qqyD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2A61F000C4;
	Tue, 24 Nov 2026 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537774;
	bh=tWySwmkRBU/RwVT/X9/RQW6df9RVZygUwLk/9sFD2/E=;
	h=Date:From:To:Cc:Subject;
	b=QtC/qqyDEQukEwEYwUkkxpyDw+cnyxJkVGXo1Nr/QNcUZ5nc6N1CpSc3cRhS6lAKN
	 Bw3Bv+4GiedsFR+k9Y259AyPaXC37UiXgHrpS7phwKOHKxX96ezUOdWAo2dCsnuXRG
	 J+AuBGXhdIGaeZEkVeDdX89o87S8RvGKFvRjlwKfvrooipx7P0bJJ6q5pBOBndLTjo
	 n8/JwOvPBt2528aZfTZXQLKd+qfZQb1+UhsqQ7antWX60gkXaL6KE7MwMOTD98oMiC
	 cerNa0DBKs5eGDI9yYfQS/wFCfmxoSIhKSt21oBlnyomqlSCqY2/JVdRZ7hv56XmkM
	 hkFJ6ldALLiuA==
Date: Tue, 24 Nov 2026 16:29:30 +0000
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the net-next tree
Message-ID: <awW7asWvY4vQFkNd@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M84+XN09hS7xgber"
Content-Disposition: inline


--M84+XN09hS7xgber
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/net/tun.c: In function 'tun_get_user':
/tmp/next/build/drivers/net/tun.c:1881:37: error: 'struct ubuf_info' has no=
 member named 'ops'
 1881 |                                 uarg->ops->complete(NULL, uarg, fal=
se);
      |                                     ^~

Caused by commit

   ecca9bb2c855a (net: skbuff: replace ubuf_info ops ptr with type id)

interacting with

   3896ae4adf5ff (tun: complete the zerocopy buffer of packets consumed by =
XDP)

=66rom the net tree.  I have applied Sasha's fix (see below) and can carry
as needed. =20

=46rom 1f0a8fbb8fcddcb0502b33987a53ed883aafb90c Mon Sep 17 00:00:00 2001
=46rom: Sasha Levin <sashal@kernel.org>
Date: Tue, 24 Nov 2026 09:56:49 -0500
Subject: [PATCH] linux-next: semantic conflict between the net and net-next
 trees

Hi Mark,

The current net tree has a semantic conflict with the net-next tree
that breaks the build:

  drivers/net/tun.c:1881:11: error: no member named 'ops' in 'struct ubuf_i=
nfo'

3896ae4adf5f ("tun: complete the zerocopy buffer of packets consumed by
XDP") in the net tree calls uarg->ops->complete() in tun_get_user(), and
ecca9bb2c855 ("net: skbuff: replace ubuf_info ops ptr with type id") in
the net-next tree removes ubuf_info::ops. The fix uses
net_zcopy_complete(), as ecca9bb2c855 does for the same call later in
tun_get_user():

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/net/tun.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 84e2d0f24b417..f3735bf3819f3 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1875,11 +1875,8 @@ static ssize_t tun_get_user(struct tun_struct *tun, =
struct tun_file *tfile,
 			goto drop;
 		if (!skb) {
 			/* consumed by XDP, after copying */
-			if (msg_control) {
-				struct ubuf_info *uarg =3D msg_control;
-
-				uarg->ops->complete(NULL, uarg, false);
-			}
+			if (msg_control)
+				net_zcopy_complete(NULL, msg_control, false);
 			return total_len;
 		}
 	} else {
--=20
2.47.3


--M84+XN09hS7xgber
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFu2kACgkQJNaLcl1U
h9Dxbwf/QrnMGp5a8Z+zZgxyUxldzWsN8v0VMTw1aIHEMEketLslrYwqGMCj8Doi
pYa57mAkmAjGVEPqMJYVmoLl1M3mOMpoIQ8QWjchfg2KSdy504OTkw7bl60DM9HU
qmi8BebLYxsv8+wuiOa7m3U9SMzHBEShtq8+cYBaoEOZnnl4AJN75AWr/vBo4KSb
Syg5uGiZnUDfJXR3EKkDlY/Qv35mvh3Vh7tHXdlDRE0KZw77KEszd+0QK4jIl3z6
GElxYVMxqbk+2cnSwjm7zB2sYT8tcirkLy896EO3wyArjzPBoc11yiwOTKwNvgYK
PdBRozVofY1A/j+88JKz16HpDo36vQ==
=YcMj
-----END PGP SIGNATURE-----

--M84+XN09hS7xgber--
