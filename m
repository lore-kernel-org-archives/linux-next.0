From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core tree build wanings
Date: Mon, 15 Sep 2008 04:10:59 +1000
Message-ID: <20080915041059.86de784c.sfr@canb.auug.org.au>
References: <20080912150753.1ce5002c.sfr@canb.auug.org.au>
	<20080914150523.GJ12522@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Sep_2008_04_10_59_+1000_yb_tk.laWZKmUhqu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36676 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754475AbYINSLL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 14:11:11 -0400
In-Reply-To: <20080914150523.GJ12522@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Mon__15_Sep_2008_04_10_59_+1000_yb_tk.laWZKmUhqu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Sun, 14 Sep 2008 17:05:23 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> ah, both of these patches were reverted in tip/master 4 days ago:
>=20
> 49937ca: Revert "debug: fix BUILD_BUG_ON() for non-constant expressions"
> c3d4a3c: Revert "debug, x86: move BUILD_BUG_ON() and __FUNCTION__"
>=20
> i've cherry-picked them over into tip/auto-core-next. Thanks,

Thanks for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Sep_2008_04_10_59_+1000_yb_tk.laWZKmUhqu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjNU7MACgkQjjKRsyhoI8ybbACgqMW/cFgooo1IxJnCvwq96LVM
d4UAnA53oJmIqYgQx1HMcBvbteO7+Up1
=5hs+
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Sep_2008_04_10_59_+1000_yb_tk.laWZKmUhqu--
