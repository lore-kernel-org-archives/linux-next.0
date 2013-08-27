From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: manual merge of the clk tree with Linus' tree
Date: Tue, 27 Aug 2013 11:09:52 +0100
Message-ID: <521C7AF0.1020903@imgtec.com>
References: <20130827190304.c3f2f891f20d078d66b703b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="X09MRfRa7snNnIFpOU1B33IOENhS5vHj3"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130827190304.c3f2f891f20d078d66b703b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
List-Id: linux-next.vger.kernel.org

--X09MRfRa7snNnIFpOU1B33IOENhS5vHj3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 27/08/13 10:03, Stephen Rothwell wrote:
> Hi Mike,
>=20
> Today's linux-next merge of the clk tree got a conflict in
> drivers/clk/zynq/clkc.c between commits 252957cc3a2d ("clk/zynq/clkc: A=
dd
> dedicated spinlock for the SWDT") and 765b7d4c4cb3
> ("clk/zynq/clkc: Add CLK_SET_RATE_PARENT flag to ethernet muxes") from
> Linus' tree and commit 819c1de344c5 ("clk: add CLK_SET_RATE_NO_REPARENT=

> flag") from the clk tree.
>=20
> I fixed it up (see below and in a couple of places I chose
> CLK_SET_RATE_NO_REPARENT over CLK_SET_RATE_PARENT, which may, of course=
,
> be wrong) and can carry the fix as necessary (no action is required).

The case you mentioned looks correct to me.

I can't see todays -next yet, but if by "choose CLK_SET_RATE_NO_REPARENT
over CLK_SET_RATE_PARENT" you mean one branch adds CLK_SET_RATE_PARENT,
clk-next adds CLK_SET_RATE_NO_REPARENT, and the resolution ends up with
only CLK_SET_RATE_NOREPARENT then that sounds wrong, as the two flags
are orthogonal.

Thanks
James


--X09MRfRa7snNnIFpOU1B33IOENhS5vHj3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAEBAgAGBQJSHHr2AAoJEKHZs+irPybfGHgP/j6sDUy2LuGW1itm+H+lXGHf
DTmo6IBsWN1F2nn0LOpY1SnA/qSrmGoWTz9OSGuLq2UCUxDGJ/QYPMjl9E6TWqjI
h7GaByf832kqqKbHvU+MQNadNP7SEhPHopgTBcedvTwLUd1myxkUN+Y1tEs/x9ne
H9vj5faQqZ1xQ6D+6jfUfN3R7iTacXQiaJ5DaQF8UMdcDd8AdQmSSFk6R1XFfydZ
ULGJfoLORCswPzhjQqyvUW3h4M7etGrDZKiQDNHt8K3levC48KPxnBkt6pd2JzgT
Roq8TuBRadI9QQEYdNBjQ+2nYdirl8qUAcVt/wH0NUKp58rgp7R1jiaiCIB9vVEd
10KICgTGkF2nFtyi6iPHkn92Xeehj85A/Vb5C9NV0wNpVfvyWR/59jvuZDLWcCHT
SWNQ+am6OeHZx4q31eToJRYlnRICNImY4TpLfURC/ZrG/if4JNxkr9ttE6RFVhGq
mQZSVw0CzUgZd9X+nl1WagCMi3r04gX4Q+LnfVBAEiYWn0768Pj5j9oaNkD3/kWm
JIVdKSg+0mD2ewAIzuzFD2RhKLT7csZL+Ae/nrMb6wSjjCDcjPgmRRvlvRq+4DpV
0QJ5TaPK4sCxluGDr54ZJ63fF1CkhXHs9iVcHrM8QAt4hTWKMpB/9NStk8PdRUH/
CHyFfXsR31T8gKY9BYSX
=EOm4
-----END PGP SIGNATURE-----

--X09MRfRa7snNnIFpOU1B33IOENhS5vHj3--
