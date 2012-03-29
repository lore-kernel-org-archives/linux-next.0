From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Thu, 29 Mar 2012 15:54:37 +0100
Message-ID: <20120329145436.GS3668@opensource.wolfsonmicro.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
 <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
 <4F732C97.2030804@compulab.co.il>
 <20120328152743.GW3232@opensource.wolfsonmicro.com>
 <4F73356D.5080401@windriver.com>
 <20120328161305.GZ3232@opensource.wolfsonmicro.com>
 <4F73437B.6070806@windriver.com>
 <4F7471A0.6070208@compulab.co.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQAi4ZBraoACHIeu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51678 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933039Ab2C2Oyj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Mar 2012 10:54:39 -0400
Content-Disposition: inline
In-Reply-To: <4F7471A0.6070208@compulab.co.il>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--rQAi4ZBraoACHIeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 29, 2012 at 04:28:48PM +0200, Igor Grinberg wrote:
> On 03/28/12 18:59, Paul Gortmaker wrote:

> >>> static struct platform_device em_x270_gps_userspace_consumer = {
> >>>         .name           = "reg-userspace-consumer",
> >>>         .id             = 0,

> >>> static struct platform_device em_x270_gprs_userspace_consumer = {
> >>>         .name           = "reg-userspace-consumer",
> >>>         .id             = 1,

> > -REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer", "vcc gprs");
> > +REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer.1", "vcc gprs");

> Well, I thought of this solution, but I don't like it, as it makes
> the whole thing very fragile and sensitive to the reg-userspace-consumer
> platform device registration order and count, isn't it?
> (That's why I proposed to use NULL...).

No the platform device numbering should be totally stable for a given
board unless someone deliberately sets out to renumber them - the .ids
are explicitly assigned by the board when it registers the device.

> So, Mark, how do you think the above issues can be handled without
> putting NULL into the dev_name?

It shouldn't be a problem I think.

--rQAi4ZBraoACHIeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdHemAAoJEBus8iNuMP3dMIIP/3FXuOAlAxbCSYIU7oENLl1i
z7Xfm6HbWPCm1IhsZUql8PXu/nfDtw8ZKWcc4H4RMTgT8fUn1UV2S3YjAJGlN6MT
HI6wDpBqZ09yqzHr/EVeH5/h+iXuR7HpjCvbE/liRW4+gpQEsYoDJWD4OBM71yCj
dlYSh0tIlP9O5nUy3mL1dJidLM4deL0aZ0FEfc6MeNPy0BBEZPO4JjKAj6rini9u
814G2IxlFyCJEtziLWkoDWhovlhFGidnJ45JSR9OO3KCbV/Egt+TBFEJjwZ7NkHr
0fnAgPLL89EYD8pUiuryTATz8bn6NScKNSjSVlIyhVur7e41H0XQQvdGdNBY4Me/
wMeCXjpVVgqYxLWJQPIF/tPYl9kWoH9Px8BJ4eXsjVUcjNsktlusDts5auowNVkz
uruGwhPJtauv0sfHo4vsDYpS/KiYLQexZq9sQzwWCR4DSp76hRABlbwcQLJWDjg1
tt7NnwgKDLJxaBbNDAqm/XE1F7Kfkfd6rKdTeGcqgHVC5o4Gu+xnDrHFrxtgQ4kW
erWxYUpRlAuDoIgFGYYlnJfg+yXhOOfWa7Mvt1pb+U0kkS4x4n7DUbQPvMZqjNi3
Bt7KmWAqSeRHtZqF9GGlnOsCu5tzPzatgSo54Qku3zwyUAYB6mG1JwU8eL4ZuCHT
yORvS6XDDtmawPtk8HFn
=5+wS
-----END PGP SIGNATURE-----

--rQAi4ZBraoACHIeu--
