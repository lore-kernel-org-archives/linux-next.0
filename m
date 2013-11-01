From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: Properly initialize reference count
Date: Fri, 1 Nov 2013 10:23:28 +0100
Message-ID: <20131101092327.GD27864@ulmo.nvidia.com>
References: <1383220962-26836-1-git-send-email-treding@nvidia.com>
 <5272AAD7.9050305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:53632 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754652Ab3KAJXc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 05:23:32 -0400
Received: by mail-bk0-f41.google.com with SMTP id na10so1713299bkb.0
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2013 02:23:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5272AAD7.9050305@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 01:09:11PM -0600, Stephen Warren wrote:
> On 10/31/2013 06:02 AM, Thierry Reding wrote:
> > Commit a336ed7 (clk: Implement clk_unregister()) initializes the kref in
> > clk_set_parent(), which is obviously the wrong place. Further research
> > shows that the original patches initialized it correctly, so it probably
> > ended up in clk_set_parent() by mistake during manual application of the
> > patch.
>=20
> Tested-by: Stephen Warren <swarren@nvidia.com>
>=20
> BTW, it'd be nice to Cc fixes like this to linux-next@vger.kernel.org;

Yes, perhaps that would've been a good idea.

> I /might/ have avoided doing a bisect if I'd seen this patch first!

I get that bisect is a really nice tool. But I don't understand why
people seem to rely on it to track down *everything* nowadays. In this
particular case there was a fairly obvious warning that pretty clearly
pointed at something wrong with the reference counting and some simple
code inspection revealed the issue at hand. No need to rebuild and boot
the kernel dozens of times to find this out.

But perhaps other people have much faster machines and bisection is
actually faster...

> I see the benefit of that "linux-next plus today's accumulated
> bug-fixes" tree that I think you proposed:-)

Yeah, this is precisely the situation where this would be good to have.
Both of these issues together took about 45-60 minutes to track down and
fix. I suppose it took Olof and you a similar amount of time. Yet if the
fixes were already collected in some standard location it would free you
up to do something more productive instead of wasting your time on
duplicate work.

I'll ask Stephen (Rothwell) if he'd be willing to set up shared access
to linux-next so that I can push collected fixes. Alternatively I could
do that in a separate repository.

Thierry

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc3MPAAoJEN0jrNd/PrOhoTwQAJzDwlVENTgQLgjib/jvzHWV
Dr2hkQfTjE3jD0umZcwe13bOCPF0QH+3LhGcQRC6sh5tzgsa7ZxicDorJN9NTkY3
YRHYWCwRb0I5NJleX+hOITRKYxwfCSi3KUDKx7FY0In/JO/XYDB+xI01uO8n+Ls+
J6JuRxQvzHvsrRud8DaEjBkVXCwjm09tpFo/G6GOtU/8lfsu7FKre1jotneoUhuK
Oyzf3eDVAcMCQKAnin57juTRn3wlWPbZxEk1Q0sd/plKjlZKw52GsQq/mNMQLlaL
9d2WS3fchapOslvMmWcITvw86NB61YfVJZv7K13YmsyGn53BVcq9mO6LPcBnMd5R
zI2h02eT9XPJhGq+dYL14xdYHei2SRPpQGreVOH62fil61UKCL1i7XM0egbBLc52
1iYBGXnDhysS0fe834R7HtVz/rIehOUJLqJpitXoe4FFJV7MQVGqMzx+cCWSXyW5
zRGBVoYCute0NTVawMsd2Sf+buYYS/Qhj/lHqpT/2aqbYZk7zFX9oY3kBZYYBpat
8SdfWTLCsqRjSIlq02tDNE0eHTYNNgUaLg7JtyM5o6gdHJV27me8DTfBs53DDwKD
txkAc/T4nhu2nmePAh0yFXzzdwuV2qnE83LA3BtwA56rOJ5ZBCGAxeV+3NMT2K8m
jL1XkDDOBBecx9t8y6Iq
=82ma
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
