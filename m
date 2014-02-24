From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the mvebu
 tree
Date: Mon, 24 Feb 2014 14:54:16 +0900
Message-ID: <20140224055416.GB25940@sirena.org.uk>
References: <20140224133752.bc1ffffa4e81edb76a76e555@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8366963546049817882=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140224133752.bc1ffffa4e81edb76a76e555@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, andrew@lunn.ch, Jason Cooper <jason@lakedaemon.net>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============8366963546049817882==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gQmjQz8lQ7hwrZL9"
Content-Disposition: inline


--gQmjQz8lQ7hwrZL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2014 at 01:37:52PM +1100, Stephen Rothwell wrote:

> I fixed it up (Probably incorrectly - see below) and can carry the fix as
> necessary (no action is required).

That looks right (or at least like it won't do any harm or cause
bisection problems), thanks.

--gQmjQz8lQ7hwrZL9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTCt6FAAoJELSic+t+oim9VCcP/37OSHXG5z0AVYA2zAEmSRWx
rx/PBQ/xdnFW+cN3IGPbB9VNeaI5NKAlhLH3XPOCn9IbTuK7M9HsmWDamkLrQD9g
Sma0RjnIjRDA5FpbG3e3k+lavMHPR9Gl2eLZQNP7pJtrvvPatfZxZ4sY5tO3/msf
NOqja2oAq5DrEgdiErZP5Y0Mfo2HqBawMyVokgUZ+ZpH4d4bvl5E2tvuzp8mWmt8
RsBadPX2z2sw32G+MaBqFzZrI+U6l9mUHyG52Y+65i02aQRbaUYNPdjniV8BWqz1
UfPWYyqoQRHZkqYju4gdZuFZSeBZ0MQVPg0XREJ3rEQ6fBGmK6c/pkKqRkv7ng+q
D46rXzLXVo6GWYV9qP/9vrrzLKlLSkROZsFXwJGH00hCaNjxUin6eA/PcavxOV5J
MvMxYwRgC9g4m/BPeH05lIBEtJNSUlSVYEbR3XP8CuiLCXQFI3r9k4AgEIJ5nxm+
v9Lr3jsWmlQoCLE8YmIoyDxv+BraNn+iIlT44HHfMiXLTbc7oKvbMsJYm23678kg
kArOe88FRdap5Sb2JJsPpPjm1hUGtHb0mwypgOqknMBza6iTJw+eUBko6dTvp0Bz
Wp7bP5VKHt7dwjSe1g7ZFGKlIn+AYZ2Z74nq4uCkSBy7uBfIyEoW3xE1DeHQFLFS
QmHoKEbS0bUQb2QumPRu
=o3SL
-----END PGP SIGNATURE-----

--gQmjQz8lQ7hwrZL9--


--===============8366963546049817882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8366963546049817882==--
