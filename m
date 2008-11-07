From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: wireless/arm build failure
Date: Fri, 07 Nov 2008 07:39:35 +0100
Message-ID: <1226039975.3619.254.camel@johannes.berg>
References: <20081107121941.911bc31a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-QpGxEgc8suYoMjFPJEBu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xc.sipsolutions.net ([83.246.72.84]:33450 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929AbYKGGjj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 01:39:39 -0500
In-Reply-To: <20081107121941.911bc31a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Russell King <rmk@arm.linux.org.uk>


--=-QpGxEgc8suYoMjFPJEBu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-11-07 at 12:19 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> An arm cam60_defconfig build of next-20081106 produces these errors:
>=20
> include/net/mac80211.h:405: error: size of array 'type name' is negative
> net/mac80211/main.c:957: error: size of array 'type name' is negative
>=20
> The first is
>         BUILD_BUG_ON(
>             offsetof(struct ieee80211_tx_info, status.ampdu_ack_len) !=3D=
 23);
> in ieee80211_tx_info_clear_status().
> The second is
>         BUILD_BUG_ON(sizeof(struct ieee80211_tx_info) > sizeof(skb->cb));
> in ieee80211_init().
>=20
> Maybe something to do with commit
> e6a9854b05c1a6af1308fe2b8c68f35abf28a3ee ("mac80211/drivers: rewrite the
> rate control API") from the wireless tree (which introduced the
> BUILD_BUG_ON in mac80211.h and modified struct ieee80211_tx_info
> somewhat).

Yeah, it does, a few people have observed it, we missed some special arm
alignment rules and our structures got too large for skb->cb on arm, a
patch is on its way. Thanks!

johannes

--=-QpGxEgc8suYoMjFPJEBu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJE+KhAAoJEKVg1VMiehFYz8IP/ix7bemml1UnJfTDqGNfsSdz
EOgwxn9yvtHpKRn9ugsEFLttaxHLWP3iRgYVsATdUiBLZCQ2HRACPulOaMm6W1aC
OyI+N3fuSGSI6SzpXK9I2jgoAr4J0kwZ80cOGGVux9zTkAN+tQH1Y+TyHlKrI+tu
rA5blB9Cjs0kadZ36BXhyPPEDG4vhX3NoI3qJ8/Y3nHYz5hdM71VTmwyrHrHMC39
HVAcVx3UKO97UT5a/VTdEw9v78KAtTfCseRREa/Tv8KGpI9F7VJIpscqsu73tMxS
vdvUT9d42OfIBihWDR958DeQBw6EKzazaMxNVRoUD6y1rJQbjDjtrByUu35iGuui
14QpTkWeN71DN9qMptgjBn/C3kb8LNuNYO/Q8KKqMQYgAG1b++p0C0RLCp8MP2ry
XjJQtNPB5/r9S9O9sExOnejMYJ7CzInxfmxy/wZOuqCnlxr+z2GVcCXq1REpU5Kn
uIFVm0/78MdWrvCJrL9nOSy/5DAw/xjnQzwdldKTGLNN8jGQA/xloiIIDZ5DN6BY
FKMJmHOOedFoIRPRNhmUi8RY7RxAZRbdvuuuDgV58ZzvvROrK2C3klQoR7moSt7Y
Q20rNk5/Sdfxk9xWL4QYQFggduLkfRbcwdYCVP0ft9kCJn7GB/6kJGgZgTNoKVtl
oaWotpGgXfZeNUzva+SP
=wyqt
-----END PGP SIGNATURE-----

--=-QpGxEgc8suYoMjFPJEBu--
