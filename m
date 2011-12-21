From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bluetooth tree
Date: Wed, 21 Dec 2011 13:19:41 +1100
Message-ID: <20111221131941.b946391eb42a6d2d76d4fd58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__21_Dec_2011_13_19_41_+1100_7Aux_RtAN95NEbld"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:41789 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519Ab1LUCTu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Dec 2011 21:19:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Gustavo F. Padovan" <padovan@profusion.mobi>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Wed__21_Dec_2011_13_19_41_+1100_7Aux_RtAN95NEbld
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

After merging the bluetooth tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/wireless/ath/ath9k/dfs.c: In function 'ath9k_postprocess_radar_=
event':
drivers/net/wireless/ath/ath9k/dfs.c:73:1: error: 'ATH_DBG_ATH_DBG_DFS' und=
eclared (first use in this function)
drivers/net/wireless/ath/ath9k/dfs.c: In function 'ath9k_dfs_process_phyerr=
':
drivers/net/wireless/ath/ath9k/dfs.c:166:1: error: 'ATH_DBG_ATH_DBG_DFS' un=
declared (first use in this function)

This has been inherited by the rebase onto the wireless-next tree.  I
have used the bluetooth tree from next-20111220 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__21_Dec_2011_13_19_41_+1100_7Aux_RtAN95NEbld
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO8UI9AAoJEECxmPOUX5FEUa0P/R0jcYmT9pGIA9/ZePaOSvIy
fdqugw3386Onp+SEgzyrAMh5e3K7C4L24QQJqJEIgbDk30x0VNWvwSXkArHyMFEO
ovMnCmEe2CyPDay6KIY4eYGxcF+pUkSrP0AvAwII0E2MHCMMDGf9qkMC4jYDTsKN
4WnQwzncsWOiE/xvd8jY8Gq29mEHcp0xHKqVjnxvWpger638SRhnjfvce37+e00L
eKlKzXrp3//f4RJXaNu0/cGjJqFBhppU/PTMlp5vKibeiNhkn5EiFC7dXWImrZmE
T7+u928UYzozQl6wyPeG41soZGffnc543w4W3ToucsLkM7gGzOhNkjz//v9wzz71
ynkcrEqBGFnQ/X1FQSsL0VDm7U7Z4VSg71ZMjdyH030nXfz8D2rObyPbsvwtQRpT
3FjHqp7nsaJjtFMU8NrlpgMkA5t+7AYJL/h4F3PSzb0dywOXaAdlcoVFkBrpP4th
VVBuf0iUhcstBQHtdb00yTBinUyIN6lCmOYzrKN735prNBB7wbMWaQQf1+kmTOqT
tBItKH4yN1CM0jEmYdPOaAo51IgJcXq8f+VtENhJygRLezpB8SLMsPIXBZdhSxmf
XO/VUoLeZDhtlhzxIjjDyA4KQBGi2MiTt0xMbOo6Cx0h0taESBix9h86M9J5EbfV
/4gztCuWQmYGRtBrRIWc
=t3s2
-----END PGP SIGNATURE-----

--Signature=_Wed__21_Dec_2011_13_19_41_+1100_7Aux_RtAN95NEbld--
