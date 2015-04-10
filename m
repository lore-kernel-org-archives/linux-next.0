From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Fri, 10 Apr 2015 13:53:12 +1000
Message-ID: <20150410135312.61626ea5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4BBBj2s9xcyQmprkNQ6t9RL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4BBBj2s9xcyQmprkNQ6t9RL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
Documentation/devicetree/bindings/vendor-prefixes.txt between commit
f71b10be4c8a ("of: Add vendor prefix for Arasan") from Linus' tree and
commit 5888f9df0dcd ("[media] of: Add vendor prefix for Aptina
Imaging") from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
index 3e8bd6d34c96,4326f52eba73..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@@ -21,7 -20,7 +21,8 @@@ amlogic	Amlogic, Inc
  ams	AMS AG
  amstaos	AMS-Taos Inc.
  apm	Applied Micro Circuits Corporation (APM)
+ aptina	Aptina Imaging
 +arasan	Arasan Chip Systems
  arm	ARM Ltd.
  armadeus	ARMadeus Systems SARL
  asahi-kasei	Asahi Kasei Corp.

--Sig_/4BBBj2s9xcyQmprkNQ6t9RL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ0kzAAoJEMDTa8Ir7ZwVnAgP+gKbFXsE/RQyuL13uZ5O1r6J
qSq5uv0uxpagwqTIWP8RxhX9crJKBO0n77JgRqrrjeyEeeETC5DM525ikqKZTi0R
KPkBMVtp6Ni3Vfo/1x5AFABMzVzwn6AGc5h3ZyrqKr3lXZQKnLKdmkL5IqO6pr6g
HwJqnPy0xzY3sPm/F8LmH6Ah8/Y4HF3g8ipPuSnZNdVHp/hoSOIOr32nEJ7FZTO9
Qh6X8koeIPustheOI4c/rFrhqGWcYtH/TfDYsutmrI6VePG1sBq2nwmb1GuugbCs
hzj2/zsnQilIQQcFEKZovl9CF119BJRJ+5+dtKpDZePcIBjV0h2M0mJ4JukWM+2i
+CRxlKWU3I5EWvFfdMVG8MyCDqV5u7YmZgwFYFaWlVXYzKe9Hm+fm7P7tSGB+6Hn
OcVWZ80U7Lxg9OkXiJSIMgK8TuQJnKEGsMwYG36ljCejJTe2ao9yUNtMfVTDOtJ+
ety6937W03u32f1UTKViNkKq5rtNS9DUn8dYefwGaqIhTisTDAnkBDlRDIGnT/Bq
whb/x3uaocqbHeLnS4tfbSh7e+b2g3fZw2fInl/jckqiIqgJRPfFJbn4rCDajslu
NLYFAQKYk9Vct4FT5Vu0Id+sV+kQS2rSDUY0bu384OmV2keC9EOJJatWUDj+pB3i
nOWnpEClXnIuz7bdWbfw
=ZwTr
-----END PGP SIGNATURE-----

--Sig_/4BBBj2s9xcyQmprkNQ6t9RL--
