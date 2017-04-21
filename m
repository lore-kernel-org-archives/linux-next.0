From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] dmaengine: sun4i: fix invalid argument
Date: Fri, 21 Apr 2017 16:40:27 +0200
Message-ID: <20170421144027.oll2x3tbb3lwiyfo@lukather>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <584a2c53-100b-945b-d665-cef3fa856526@free.fr>
 <20170421082417.7cqtevwuhjvfgjcx@lukather>
 <3e98596a-0322-e4f1-7cc2-9b0eaceb4465@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0046146830294275883=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3e98596a-0322-e4f1-7cc2-9b0eaceb4465@free.fr>
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


--===============0046146830294275883==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wh3nu4uyye4qxkb4"
Content-Disposition: inline


--wh3nu4uyye4qxkb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2017 at 10:43:20AM +0200, Mason wrote:
> From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
>=20
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
>=20
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wh3nu4uyye4qxkb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+hnbAAoJEBx+YmzsjxAgDNMQALzQOnvjvBol+6e1t19FA0yd
QqthbDqX474193r0JlHe33c6XQr72vGn+jSW3JevPOOTSXyqWQVgTATpqLu5CkWf
7ZseNxo0cBp/sFUxY0VtVZ5vLBg1XmD+5kZefFUUyDCuzoa1FWIIWwKkEc9jzm9L
eryaDzvBc5QdekxN1C/u1218GK5Bz4+TeeDelv7iryrOisfzLB3qPZXuItgbg6q1
A7X5a3B2jZPfyGiwYh7hI1HQ8xmqp+BYbk+eAPYVbkC9D3clNOx5pu7Z/ZPGlull
5M70JIwhpaYSCV3qO6Cd0jCBFyeCn1D721evHJwEIqZn3CJuKuzVGiByF6E11eAK
ZmZQS6ay+ApPX46Zzsi6ey1yzGWeVks6oIuHupHzT0iuRa4tFOYP2mbrXSsOVWAI
/ffbq/lHCi9ZxBt6gtUTEDgUkKJM4oZCSGpHzN9i4zelF5eef75Gc/QsRgSUeT2d
fin5szqsM8amW7NLY66M8EAFhsSSE5JMvkwTahlkIvjsadFvJFxlAn7Y9s/OOFXC
IjhTXN/pPRq1mQwJ2RRznFlGFVg45dNlrRbCtLbDF6jZy46xDVxHJlCbxYfWpoYx
6eOybwYnhTrIfiuDwN8WhPkuhw4ua1HQye3d1EE+cGa/tAKuRg85bDkSwHWYEZ20
7zpGzgkS75Ya+p5Cfwz/
=uN6x
-----END PGP SIGNATURE-----

--wh3nu4uyye4qxkb4--


--===============0046146830294275883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0046146830294275883==--
