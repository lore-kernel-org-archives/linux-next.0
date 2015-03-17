From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree with the input-current
 tree
Date: Tue, 17 Mar 2015 13:27:00 +1100
Message-ID: <20150317132700.1bada5b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CTcEITQUSACeMJLAcu_cE9V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/CTcEITQUSACeMJLAcu_cE9V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Today's linux-next merge of the input tree got a conflict in
drivers/input/mouse/synaptics.c between commit dc5465dc8a6d ("Input:
synaptics - fix middle button on Lenovo 2015 products") from the
input-current tree and commit de4e374b401a ("Input: synaptics - switch
ForcePad detection to PNP IDs") from the input tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/input/mouse/synaptics.c
index dda605836546,4c69e3304011..000000000000
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@@ -670,20 -612,6 +677,18 @@@ static void synaptics_parse_agm(const u
  	}
  }
 =20
 +static void synaptics_parse_ext_buttons(const unsigned char buf[],
 +					struct synaptics_data *priv,
 +					struct synaptics_hw_state *hw)
 +{
 +	unsigned int ext_bits =3D
 +		(SYN_CAP_MULTI_BUTTON_NO(priv->ext_cap) + 1) >> 1;
 +	unsigned int ext_mask =3D GENMASK(ext_bits - 1, 0);
 +
 +	hw->ext_buttons =3D buf[4] & ext_mask;
 +	hw->ext_buttons |=3D (buf[5] & ext_mask) << ext_bits;
 +}
 +
- static bool is_forcepad;
-=20
  static int synaptics_parse_hw_state(const unsigned char buf[],
  				    struct synaptics_data *priv,
  				    struct synaptics_hw_state *hw)

--Sig_/CTcEITQUSACeMJLAcu_cE9V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVB5D5AAoJEMDTa8Ir7ZwV7/oP/2HntgQ2glAdNisvlnaaxbh4
RuR6h+nSLUVskqqbUi0MwcjOE7nT4ww6rTQklEnQepE3ayC5WAo05PzorOHaGj30
FHkS20yBU7uYAOh89eKm7JTq5LESR+6hCbrF79C0tWZNWswTKzL7WRTfrH50d/V2
PTTHYRdkbg/LaAtOgf0VPi1RWq6YrgLbKj0UsSVE/vVnKpd/RUjPyGn4TNzLTFTL
MA0nKo2BQAGb6qMlRQA1FvF+a0L/B0/dpbdtV/aEL2RbwlNwd1uciXUApmyQwaLP
aL4CZGg/YpYIA1ctMTd0QSfm0ZnZeVkElgU86KUdQSA18qoV3YpRNPTJFNv3Nvxu
6Q8jrXTxNZrr4nH/8QovGKeL/jCrufJ935Yh/xgGI7bLHSQ9ubTHohmJEDl9ObwA
6ZocpCXb3+EPqhOPDkrCEgsng2KAa5th+BuvzoRMylvpJxvUv+8ykOWZNGEaQnrn
ukVZY3Y6hoUOx3TYAiQXzaHPcFn/HvoYQm4muij8x/a5VT8T1PjpyTj+7d9+n7+m
K65Z4UpWIWAxvyOPUuEDVnxdfkscLusj/OLjqB/SRLtDsiT1umG6sCJzgs1uOZej
shk3yTdD5HsZ83gU7AJudgvXNDtojRpsMsPMdiUgbmO31xyW1OcU2EkFnv5yypki
G9LeXIVDLvKGv+fYje1R
=gOfi
-----END PGP SIGNATURE-----

--Sig_/CTcEITQUSACeMJLAcu_cE9V--
