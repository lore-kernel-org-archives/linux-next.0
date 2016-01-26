From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 26 Jan 2016 18:17:09 +0530
Message-ID: <20160126124709.GL11130@localhost>
References: <s5h4meductq.wl-tiwai@suse.de>
 <s5hmvs0uytw.wl-tiwai@suse.de>
 <20160121073859.3a6c22a3@canb.auug.org.au>
 <20160122112442.75c07aac@canb.auug.org.au>
 <20160122134045.438cd9d9@canb.auug.org.au>
 <s5h60yiatwt.wl-tiwai@suse.de>
 <20160125114150.GK6588@sirena.org.uk>
 <s5hmvrtajoy.wl-tiwai@suse.de>
 <s5hio2hai24.wl-tiwai@suse.de>
 <20160125135546.GS6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160125135546.GS6588@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 01:55:46PM +0000, Mark Brown wrote:
>=20
> though we will need to come up with an alternative solution for the
> affected architectures if anyone ends up caring (MIPS or PowerPC might
> possibly).

Okay I did some rethink on this. So we should be able to make
MAX_NUM_CODEC_DESCRIPTORS to 16. But that will be ABI change :(

Also further down the road if people start hitting this limit add
additional ioctl to get more descriptors, but for Intel devices this is
okay, WM doesn't seem to implement this..

Thanks
--=20
~Vinod

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWp2rNAAoJEHwUBw8lI4NHgx4QAMvlDV+uU9eLCGCJHsDl8H61
T4yh/U2JaJIcCiHknAyr6Ri3BrrUqXd1dpFm+5QUV6laGR57rwyII0jcwYdylk0B
5YQreVkRPfY27LgM2KxpXO+VoOq/mxdDvzOHhRCXgky8FynNLl2ewgEDTAizAPrh
CTKgNtFXQvhenF60WmqK2z+J+ve4rRDsOxHud3lxnR9Z9VyodoELthQNs4LuIvOC
xBWdO4fwsFKKbh/LL6nc9tSWINBnUoCu1LXbtYJ81qdqHnFoneFYBJbKUf8050CJ
+6P8rcHKa1UGbkqcEa6uT2DI2m22hjq90vf7D2erpT+o98+8QCFkvxZNm+jhqYbI
qd1deHdEbitIa0Pp52Kx5V5hs8Nt13TlTduugHuazsVEgi1Z4nRMgIQNiaompKuq
LQCKjCXJinpMK19ds4xDM8zFB9kQQz3TtW3/8b4ban6kM/v54T81Tqsz9Bm2VSQZ
spuBmG62uXb4n72R9P1201/LI6YaHL8AS8V/t2VbekZZWcFai+3X2wULvPWO2QS5
ri4eVrBdioUsQdbycelxb4UFlCJVtGh+GRWKGUui5ujdMPMw9JYzx0vhmO7hLtAn
+Ygit/5ZeisoeprMbWktPofgjePymkxF0Ubf21/1q41pInCzFRKMzjiF6lHhWeCP
Rl7+iepFVHn+efM2DtOE
=xKw5
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
