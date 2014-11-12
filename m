From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the
 hwmon-staging tree
Date: Wed, 12 Nov 2014 15:05:19 +1100
Message-ID: <20141112150519.06cb7c34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8iK5DvFqw2LFKEvjuDVHFJp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Neelesh Gupta <neelegup@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8iK5DvFqw2LFKEvjuDVHFJp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/hwmon/ibmpowernv.c between commit e349d9d5b3f9 ("hwmon:
(ibmpowernv) Use platform 'id_table' to probe the device") from the
hwmon-staging tree and commit 2a1ed077189a ("hwmon: drop owner
assignment from platform_drivers") from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/hwmon/ibmpowernv.c
index c7577b8f17a8,58ea44ec6c77..000000000000
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@@ -301,20 -309,9 +301,19 @@@ static int ibmpowernv_probe(struct plat
  	return PTR_ERR_OR_ZERO(hwmon_dev);
  }
 =20
 +static const struct platform_device_id opal_sensor_driver_ids[] =3D {
 +	{
 +		.name =3D "opal-sensor",
 +	},
 +	{ }
 +};
 +MODULE_DEVICE_TABLE(platform, opal_sensor_driver_ids);
 +
  static struct platform_driver ibmpowernv_driver =3D {
 -	.driver =3D {
 -		.name =3D DRVNAME,
 +	.probe		=3D ibmpowernv_probe,
 +	.id_table	=3D opal_sensor_driver_ids,
 +	.driver		=3D {
- 		.owner	=3D THIS_MODULE,
 +		.name	=3D DRVNAME,
  	},
  };
 =20

--Sig_/8iK5DvFqw2LFKEvjuDVHFJp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUYtyEAAoJEMDTa8Ir7ZwVFpsP/iWoJvj1XhcnjQYZmTopkbaE
JUC9pWMXKS+c7vEmsSK8ttVx51nxH2vKiU62ygkNlGhhS7UlwJEkINI612cVyPRy
NJiuzqHFWou8guSrEkMGoFRolZ2xEAvPkcGdW766Yx5X47TjfXD5XEZ0MKUGG6n+
OyF35ON6iScP2ryT2lKnJ/+PdQNPGkmp3GdShkd/dB5KWXHAo3HiIlsO6wKVC315
6iADsyHM80WXTq/EJqxMkaDOJrM8vEpEWzCGUY/BBT7uoXBUnmEE/CS4U7r439G3
KSSsfMhk8rgevlafEaElDyC53tFaLiyG51K6u6T9PI7X/ZQKwznimgHmTzCj9stN
Nrb/0mZ8Ec3hCy7TGeEft25DI0ct3mMk3uSihv0y5GKMKsP4ag+GHd6BCI4FWhyo
BJnj9zekbFkEq3AIcxY/GoD1oxFcQzXLdL7EcsXMsLI9yu/Mj+NE/IR0gu4QmNxv
V1hJorhpRbw5BKFruNKOf0+5eTgOodc5Y/FInUluWu0iYZ0q5kJSuxIVbAVXt9bt
1C8NrgY0ATPT6mX6tmud/tx69S6zkrm7j42b+OV0YYCohYaeOmFZx7Kzn+X56nRb
jPrgSg3uQ/ntYTxloCAgnr5pBEjELLzSFhQxPSKgFM9oEptyovxZHUzySOhq2Aih
OzJJo3cuc23rUnZflXlV
=Uzap
-----END PGP SIGNATURE-----

--Sig_/8iK5DvFqw2LFKEvjuDVHFJp--
