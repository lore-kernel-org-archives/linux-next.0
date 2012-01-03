From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ARM context switch changes for -next
Date: Wed, 4 Jan 2012 09:56:34 +1100
Message-ID: <20120104095634.8f39a78b3ca6c85bd045bb97@canb.auug.org.au>
References: <20120103181418.GH22876@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__4_Jan_2012_09_56_34_+1100_E0qE67NwbRgpFwNN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:51537 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755674Ab2ACW4s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 17:56:48 -0500
In-Reply-To: <20120103181418.GH22876@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org

--Signature=_Wed__4_Jan_2012_09_56_34_+1100_E0qE67NwbRgpFwNN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On Tue, 3 Jan 2012 18:14:18 +0000 Catalin Marinas <catalin.marinas@arm.com>=
 wrote:
>
> Could you please pull the branch below into -next? I'd like to give it a
> few weeks of exposure before sending an official pull request to
> Russell. One of the patches introduces a scheduler hook and Peter Z
> agreed with it. You may get a conflict in -next since some scheduler
> files have been renamed.

Do you expect this to be merged by Linus during the 3.3 merge window?  If
so, it s a bit late (I expect Linus to do the 3.2 release any time).  If
not, I would like not to add it to -next until after v3.3-rc1 is released
so that it doesn't complicate things for the merge window.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jan_2012_09_56_34_+1100_E0qE67NwbRgpFwNN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPA4eiAAoJEECxmPOUX5FEqGEP/iAMStv7QRh2xYlT2hNY/7cp
zhrIgSxHYMJQoi/iVfScKvPMu0AjD4QYFvFhaZLzfZkNe2cho21J6D1YGSpFvCcr
Kn26XFa2x/qFo6Wu/ZbN7f+AHMT1bwARXQpsTIzokcNA2zEffd0AVYcPB2+MZamg
qyQ+j0vlQE8Y7T24u4EOKXrDhnfY4RZ75yFDcnt5nXMN77d7OH4k5eTztD7WE6Hn
1N6uiwlAZIGY88dwXE26lMQjw1VVfOW/9ZqHIXZk1bv/dVXAbFmlTnGWmf8BI/Kc
Bgd/dCt0aIvY5IE3/nb0ZpsIsqnyWDN6acnIbpicWqfrLVV6Bb8kxHeves/yOWfQ
Y7LBododqRifEnzrIG7/NI7ixsWcoNj84aLtEKRSJZsXASY3/LXZz/tkeip0SHHs
QGdfvPNDysFXmI7whTxcBfEynijb1OIaCaglIDQWOEsmUzYgqF+xupDRZBwBE9Mc
rnzr2Lc6i4jzHo1jLR/a3t1WR9KK/9FoET2usWRtb6STyDtAociojDiPognbZDWy
h2kEixCTpZf9tL2ysfMLXctVsTs7T1Zle9lb9adRsdbySV9yGfLWyOmdXULN/mE6
TKIdjxKuYikrzZi77y01KuPWTsFmJp361qdIUQX3+hfMloIhPXx1mJHFy0aq6On6
lNubAhE4F9uSyKJY8RLv
=JISE
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jan_2012_09_56_34_+1100_E0qE67NwbRgpFwNN--
