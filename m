From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Wed, 01 Apr 2015 00:23:25 +0200
Message-ID: <4148869.eKf0UVcdTT@vostro.rjw.lan>
References: <20150331185844.69a6703d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5451214.QusuLeikrY"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:63347 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752393AbbCaV7Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2015 17:59:25 -0400
In-Reply-To: <20150331185844.69a6703d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>


--nextPart5451214.QusuLeikrY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, March 31, 2015 06:58:44 PM Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got conflicts in
> include/linux/clockchips.h, kernel/time/tick-broadcast.c,
> kernel/time/tick-common.c and kernel/time/tick-internal.h between
> commit 01b9fdf7e540 ("tick: Move core only declarations and functions
> to core") (and others) from the pm tree and commit 77e32c89a711
> ("clockevents: Manage device's state separately for the core") (and
> others) from the tip tree.
> 
> I fixed it up (I *think* I may have figured it all out, but please
> check - see below and teh final tree later) and can carry the fix as
> necessary (no action is required).

The resolution looks good from the PM tree perspective, thanks!

Rafael

--nextPart5451214.QusuLeikrY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJVGx5hAAoJEILEb/54YlRx++EP/A2bBW8mJ1h0IDr3M0FB4f21
5GIpKKl/hchodDpPAuCv/HELAzp+4JpE8jXYL+0lkcvTVVAAAlFOdYHk5TaCeuV1
mJCliHKDEc8bHxroVM95WtwpVi35d03Wq6He4fdSOy538Cfkts8mjNzKQIZtRPR7
0wbewunbMx9iIakWC8RmTCeabmfAKjWi1AvJYtUKB6Aa36HbRXpEvA4HFOF4ep0T
vawbvWt3u3ORSdsFELJ3kC0ng5V9w4dUd8dT9hu4a3aTIr5Y8540OiewAXvNxa/u
extoBfrrtqxiajqazaUiSs1bhKmnhopJQDyACyQkKZEcv7OvvUfdEP49hHrkxsgm
Hzu4mvQ7OLifkQzcC4GvNED4mndeAln1rqnYcl03vw2PdvDySopaS1JEd4dq0WYD
VznoiwNALdD1LXTp6e2LUxPDLCb/cOYda9RrQhgo4ELxFvuO8n1g+J+mJLrD8I7C
KLB1/YfMuQFVFBlp4ReIyBSlwfwe+IP/XvKksKweNadE9t/hEktM6R73xQG6I4pG
dpugPxybQKygeqoPDzuRgiuPSgMd+KgDxiZTcW1d1Gzr/GLqK3j1MTevjg8wKG2u
IAfjeTOyh5UM+hiCJi2mAZ7X9aNCJpbKJ+SoN9quANCAFCYBTo9RJY3srIb8OGyx
w1pXl7iDpfXsmdvuUiUo
=sApr
-----END PGP SIGNATURE-----

--nextPart5451214.QusuLeikrY--
