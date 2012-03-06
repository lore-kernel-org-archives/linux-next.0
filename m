From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Tue, 6 Mar 2012 20:01:57 +0000
Message-ID: <20120306200156.GA19635@opensource.wolfsonmicro.com>
References: <1331063203-21188-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFM6r0jQWo48NPCK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55860 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965199Ab2CFUB6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 15:01:58 -0500
Content-Disposition: inline
In-Reply-To: <1331063203-21188-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--mFM6r0jQWo48NPCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 06, 2012 at 02:46:43PM -0500, Paul Gortmaker wrote:

>  static struct regulator_consumer_supply bq24022_consumers[] = {
>  	{
> -		.dev = &gpio_vbus.dev,
>  		.supply = "vbus_draw",

No, this isn't a good fix - it will break the user.  You need to replace
dev with the equivalent dev_name.

--mFM6r0jQWo48NPCK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPVm0tAAoJEBus8iNuMP3dbZ8P/13ICZmy0FV8/Cv14DZyOvhg
A6yZtZWXsyhO73AFC3+rajr2vYen4lx1mCd8S96AWANd8N7LZFd7e85QPFuIx6z5
yevuxfwyvcvlF5K+DsfnD/FNj3TeXU+Qb4xkcrgo0JGvPwncULPBigXfJkRoIMZf
8Afn7pjvMWJtmXmX5jXZbVxhL7H0kZYQy0UQtU7YNj7qoDT9Uwn7fD0TzlwHl3En
AKF/pL7yg2mcvV1Zowuc7//4uXoEG1I5wGgmUNcx5uLTenHcHpbFDH7MX9e4MVmv
mpEBkC4RbSqY/X5pySzYWnGut8hxKmixy5YfMHUtmGelxmMvrk6ERmNfIbG+xCk7
/8mJe3WZrh20VfkfUgdxmwGuJ9gLgnSMeErES1vmHO2iF6rhHoDrF2JTC1N0yYsZ
/SkJfVgOcXP5J0pTUaXw1dYoSskSTWteZ8tlLor9Ku/y0tUX+hjjjR6FH8sQYuRA
xAvTetKc+2IV5qvNOqf30XyH43r1BdJWVj1/aUL7JABMKy4ZVF1AqyvTHlTVU6Gl
m/3nuYXWRLuH3j6kd4l+kw6xb2AyziZGoR4uteVisuuGgpQDSD0iYVeCwWKXQLts
/Av7LQ+aQuHtzYHHvoerWWUHeK+hemDSqyc5oLz+cJn6ZCry41iQyIvhSzfKAnZp
S2ejQO3Agi6CXJfXLlAL
=mTHg
-----END PGP SIGNATURE-----

--mFM6r0jQWo48NPCK--
