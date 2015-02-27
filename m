From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Fri, 27 Feb 2015 11:06:48 +1100
Message-ID: <20150227110648.543f1e3e@canb.auug.org.au>
References: <20150226131413.2aceaf7e@canb.auug.org.au>
	<1424941761.27971.2.camel@AMDC1943>
	<CAPtuhTgR-T-45QUuUfU_rCqR_yExbuQF-YQDCpVKeB4vyh9h7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L4EJkN/cfshnEa3/EMvF3+n"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59354 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752483AbbB0AG4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2015 19:06:56 -0500
In-Reply-To: <CAPtuhTgR-T-45QUuUfU_rCqR_yExbuQF-YQDCpVKeB4vyh9h7Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/L4EJkN/cfshnEa3/EMvF3+n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 26 Feb 2015 16:01:24 -0800 Mike Turquette <mturquette@linaro.org> w=
rote:
>
> It's OK. I fixed it up locally the same day that I applied it but
> didn't push the change out to my mirror in time to catch -next. It
> will be fixed the next time Stephen pulls the clk tree.

Which I have just done.  Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/L4EJkN/cfshnEa3/EMvF3+n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU77UdAAoJEMDTa8Ir7ZwVN+QP/34ovTPq8uYuRqzlFC9GnTqn
E4MW7PYbCVIB+tRSTrlC1E40dyvY9osmqDGceRjNc0csZPlStUJcc80V4bZUtMTK
0QEAsA0Mpyl/szwkXjV45O+qaOlVI7XNbW010pbORhWGgzklePYtZRlaUhsrNJzg
AfjJS7WdnfjEfwxRWZZpywHhTSSdwyytn0ssB4UlbD3Xxy7FkJckG0i/Au3rNXKm
mAZHZ/6V3IiEzBiM3GikAU6z/t1mHdk9weQwqmaNW3vuXEDRtiZpKSfSmoZF/Yw0
pDD9Zqm2vgyduhbz2PAH04BRbILdiqckeKNTECH6Ltz30myAn5k3p/l2xAoBLrJm
1yyQOP4tgd4vKOZSp/jHUqdEmbZXx5XDStshur0R3DW1Pc+9U9z7KmBc4Id7WFBy
FtIc04XZ/s/vWOJ0r0zoETcR/JEjXynaBwCsZJsmwAN0lbVmR3LPPxwuVh0kJ5QG
ilniErcYP6Fx/2xLwkoNvGc+Hn0WR33F5Z1fSE9u7Pmu+6KQXHMZxLVE5LbhtBQu
KxMoHdno4rJbrkAmCuag5eQSfV85VYqi+y6dOGcF93y9wboEbpANv+oqFXB57dQd
QG1qdwG/yTBjRe1+EUsA8+jl8JEO7MqXKvUW8RDBQ2qCVz8ySN0YgI9presvsDgG
cFgtkI4XL1OpXXq5veAd
=iDkX
-----END PGP SIGNATURE-----

--Sig_/L4EJkN/cfshnEa3/EMvF3+n--
