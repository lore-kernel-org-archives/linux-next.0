From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 15 Dec 2011 14:38:32 +1100
Message-ID: <20111215143832.3d1f01c73e78804c479f4340@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__15_Dec_2011_14_38_32_+1100_Y2g8P/wt027DdFVI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__15_Dec_2011_14_38_32_+1100_Y2g8P/wt027DdFVI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/wm8993.c: In function 'wm8993_i2c_probe':
sound/soc/codecs/wm8993.c:1594:29: error: 'dev' undeclared (first use in th=
is function)

Caused by commit f6a9336879ca ("ASoC: Convert wm8993 to devm_kzalloc
()").  I really should not be seeing this sort of build problem ...

I have used the sound-asoc tree from next-20111214 for today,

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_Dec_2011_14_38_32_+1100_Y2g8P/wt027DdFVI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO6Wu4AAoJEECxmPOUX5FEqssQAJoyxcplm/2c0iLxMKvtWdHX
I5QvlokYY2IJZEM0B1btvfIt2sbrwHuFE/dmF4gvM7fK1WOWLjpkHR0J15yAn07R
YLGVqYmRGtnDRFnYLUz51m1bDCJoBEjWzvUMnvabuweY26A95LUAL4SCbrrRu9y+
AYKXhOAZGcN82e4INbRmSCOBO3PjrigJmSMS3smxcfJyGwIQyupcEBdJDHUsn6J2
S7vDrdY1IMwid0qT2esxEiLYpjynopdSVEddLVB77HHctczGqef5Z89dxbY+qbbD
rDOyd3hjUydISoHgUir56SFcOcWGYcax4q2em4B3HD5BCGa9hqVPIvKiUVaiga8E
38We8wRDWvSWtsWWpuC8qIszcNzNPFc0Pp9ZUy01KGCrRWOAY9/DPVkDR3ApxT18
xrRZvnQzKIY9H8/2xHXBFQ8nUM9YNHfMe/whyi9IAAy7KCi3FWDKgP91PF5+8MIo
QhIL86WvqYQMlLIkIURFj2FUrlfiuCqqOvJfmNX5pDR0OexN6+vPUOU5BP1yi3iR
zY15osY2K/ZKSYpPpT3kYKmF4YS8pYpAwcMyCT2RJBm4thkR+Iiw6JDSyP7tAQDZ
i61Ia1Xz5BWgRIs3B69RCOC2/5epuysCD1HvEjyCToaCcS1bHvIf4OlQqQl5RncC
FcNwq9JCMUPuXR8ZVbpm
=0lJW
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Dec_2011_14_38_32_+1100_Y2g8P/wt027DdFVI--
