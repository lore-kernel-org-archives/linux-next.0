From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] dmaengine: sun4i: fix invalid argument
Date: Fri, 21 Apr 2017 10:24:17 +0200
Message-ID: <20170421082417.7cqtevwuhjvfgjcx@lukather>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <584a2c53-100b-945b-d665-cef3fa856526@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8833986041572076391=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <584a2c53-100b-945b-d665-cef3fa856526@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mason <slash.tmp@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@armlinux.org.uk>, arm-soc <arm@kernel.org>, Vinod Koul <vinod.koul@intel.com>, LKML <linux-kernel@vger.kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, linux-next <linux-next@vger.kernel.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org


--===============8833986041572076391==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3oicjigeiy3ix5hm"
Content-Disposition: inline


--3oicjigeiy3ix5hm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 10:06:10AM +0200, Mason wrote:
> The "pchans_used" field is an unsigned long array.
>=20
> for_each_clear_bit_from() expects an unsigned long pointer,
> not an array address.
>=20
> $ make C=3D2 drivers/dma/sun4i-dma.o
>   CHECK   drivers/dma/sun4i-dma.c
> drivers/dma/sun4i-dma.c:241:9: warning: incorrect type in argument 1 (dif=
ferent base types)
> drivers/dma/sun4i-dma.c:241:9:    expected unsigned long const *p
> drivers/dma/sun4i-dma.c:241:9:    got unsigned long ( *<noident> )[1]

The patch looks good...

> Signed-off-by: Mason <slash.tmp@free.fr>

However this doesn't.

See https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
developer-s-certificate-of-origin-1-1

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3oicjigeiy3ix5hm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+cGtAAoJEBx+YmzsjxAgW88QAJvCau3/3nU5m0jgeX1Bss37
pp+SDtRE6+Y9zf980DT3CvRyv9BpwVy8kPU53N0tppZRK0KDh6Q3eAHReBRNZvD0
ROgsekmqr4zai+vHxbySj9aNIl04D6lPVhznw5lAlDIekX90h11acszbqeeRnBqI
z/ny46k/QP3QZq35ls3s3tqTZH5dS46OQ9JRd8qy8U0j6a9h0OQBQhIqEDe7lN9a
QFGZuBSHxpsXZOOJepjlqrXxa06uNoLIGeGv+6OTQ/6nw+VmUXTr5qyPzdvvdCxw
573M0UFso6rAfu4vQPQmLuPPujJ0u3zYqKhxsB2NlSdoDjvMJxAjDu7lJmY77npY
nHq0mhIqIYF3yZWWQlXQVHozIWPx8ixtU6zMMrOFMBOPwPAG6XFXoCtIMJ79KNCu
ao6Gv3amnMzYnkwqWgwHfZhdPXWbonmV2lPu3JJ3L6dq2RnCJCI0uPOsK650VdCW
vcB2/Dtqov7mitY1Cq2Oe2qusMYYEj2JU2PJOYaJ5bM0sBLNngh7d9CNAMh5A4tC
WE3+zN1RMpLpPO3FFfoB+hjC7Uh+WyF816YrJFTrftyM6Xj2wHWtb4ewFmHQLKwx
rgdsK88GyRfwyLygPLkWcxSibtMlbW+nAVntcxXh5i9cxfNaJlS0jU+Y4YuKYRDB
mi3sxe5tdEHoIrCpO0E6
=B8t2
-----END PGP SIGNATURE-----

--3oicjigeiy3ix5hm--


--===============8833986041572076391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8833986041572076391==--
