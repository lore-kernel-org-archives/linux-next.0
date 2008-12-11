From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Thu, 11 Dec 2008 13:07:54 +1100
Message-ID: <20081211130754.54839489.sfr@canb.auug.org.au>
References: <20081211114154.5d420ff5.sfr@canb.auug.org.au>
	<c62985530812101723u66dd1662x279ff15fa741e8e5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_13_07_54_+1100_h.53UzV3twGZmZOa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60048 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754048AbYLKCIF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 21:08:05 -0500
In-Reply-To: <c62985530812101723u66dd1662x279ff15fa741e8e5@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Thu__11_Dec_2008_13_07_54_+1100_h.53UzV3twGZmZOa
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

On Thu, 11 Dec 2008 02:23:57 +0100 "Fr=C3=A9d=C3=A9ric Weisbecker" <fweisbe=
c@gmail.com> wrote:
>
> Yes that's the right fix. The headers for the boot tracer have moved
> for 2.6.29 merge window and the fix
> should follow this move. If you agree, I will submit your patch to
> latest -tip with the right "from " and
> "signed-off-by" tags....

Thanks, that would save me carrying it.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_13_07_54_+1100_h.53UzV3twGZmZOa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAdfoACgkQjjKRsyhoI8w1fQCeOYLQYCGrzjdbsE3Sns5zOmVW
2YMAn3HsImXhHLYozYo5eY+CHtDP4Jgd
=fPaD
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_13_07_54_+1100_h.53UzV3twGZmZOa--
