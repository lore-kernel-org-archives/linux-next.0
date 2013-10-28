From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the staging
 tree
Date: Tue, 29 Oct 2013 00:27:59 +1100
Message-ID: <20131029002759.fb9032e6b249a5945e7caa5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__29_Oct_2013_00_27_59_+1100_YKhmNHlLGLI7GQoF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, Greg KH <greg@kroah.com>, Alexander Holler <holler@ahsoftware.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__29_Oct_2013_00_27_59_+1100_YKhmNHlLGLI7GQoF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
drivers/rtc/rtc-hid-sensor-time.c between commit 476b9547e872 ("HID RTC:
Open sensor hub open close") from the staging tree and commit
356c3c0a98b8 ("drivers/rtc/rtc-hid-sensor-time.c: enable HID input
processing early") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/rtc/rtc-hid-sensor-time.c
index 45560ffb038d,22254f08cea2..000000000000
--- a/drivers/rtc/rtc-hid-sensor-time.c
+++ b/drivers/rtc/rtc-hid-sensor-time.c
@@@ -275,21 -275,22 +275,28 @@@ static int hid_time_probe(struct platfo
  		return ret;
  	}
 =20
 +	ret =3D sensor_hub_device_open(hsdev);
 +	if (ret) {
 +		dev_err(&pdev->dev, "failed to open sensor hub device!\n");
 +		goto err_open;
 +	}
 +
+ 	/*
+ 	 * Enable HID input processing early in order to be able to read the
+ 	 * clock already in devm_rtc_device_register().
+ 	 */
+ 	hid_device_io_start(hsdev->hdev);
+=20
  	time_state->rtc =3D devm_rtc_device_register(&pdev->dev,
  					"hid-sensor-time", &hid_time_rtc_ops,
  					THIS_MODULE);
 =20
  	if (IS_ERR_OR_NULL(time_state->rtc)) {
+ 		hid_device_io_stop(hsdev->hdev);
  		ret =3D time_state->rtc ? PTR_ERR(time_state->rtc) : -ENODEV;
  		time_state->rtc =3D NULL;
 -		sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_TIME);
  		dev_err(&pdev->dev, "rtc device register failed!\n");
 +		goto err_rtc;
  	}
 =20
  	return ret;
@@@ -303,9 -298,8 +310,9 @@@ err_open
 =20
  static int hid_time_remove(struct platform_device *pdev)
  {
- 	struct hid_sensor_hub_device *hsdev =3D pdev->dev.platform_data;
+ 	struct hid_sensor_hub_device *hsdev =3D dev_get_platdata(&pdev->dev);
 =20
 +	sensor_hub_device_close(hsdev);
  	sensor_hub_remove_callback(hsdev, HID_USAGE_SENSOR_TIME);
 =20
  	return 0;

--Signature=_Tue__29_Oct_2013_00_27_59_+1100_YKhmNHlLGLI7GQoF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBCAAGBQJSbmZjAAoJEMDTa8Ir7ZwVAyIP/Rmf4H6nB1fTPRmMDvPvINxO
wh3z4auMDep4f8jl0IcYQaxIHbjZ1x9uQYX9VChIbcBRsVZm+jE12CKK7E74XIxF
mXn3Wexm+sPqzfA9HT0mSE9gRzXiJ9mBS5sz4JdfOmAX+oCwOUiMbNZTB0gDZHNB
ByW4Q2DF0V0MTJT7WbvpwiYmgYZ8ZTNJ3Pye83U7v29SpOJJqBFiDUcpVbjisyTT
+Y7KYc7+ruvnWVU1TglQHDVeeY8hg++oOb+oMfgjGWI7oVMe0kxKCaeB7T3J6rxe
nsx5uFev4Cz3jZ6/1dvcXVRkxM82aCpUEEDMN1SToiCgR1qLUkot2UCpEbZ6rpEE
eW+PT+YEAWtTUXdPymDnkoJB3dDf/EgR7HHifEtVTcDNshB8O6wAAkgSJMhgw4j0
DyAEWqhmmLu40qytc3ql8btBxvcSYxq1kDX2PXM8lgH3qD1hlfNY3RIMY2TgxRWu
D+83hr7kbb/DRsNDk3Sletgm1Hei7ThA8qtW8M0h3Sb92sUSJ5nhS6D/NgFiaJGQ
u9JU35MweTxx04JmMuHcNJgBeIAbMNVnMLwMKYosIovK2VvjBxiE9AyEDYbYUiup
Wn14WR0QaHiEACmtiyyxLzXxFjGc131fhOaFZtyzEIrVcSVPDL+MQqvVkwwwQY9f
kz+D0/BS+q9eimbE5g+2
=nPsQ
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Oct_2013_00_27_59_+1100_YKhmNHlLGLI7GQoF--
