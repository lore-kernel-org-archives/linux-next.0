From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hid tree with Linus' tree
Date: Tue, 24 Feb 2015 11:00:48 +1100
Message-ID: <20150224110048.209cacba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=LXglObxhfL4FaOid4bB/bY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50428 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751848AbbBXABB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 19:01:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@jikos.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

--Sig_/=LXglObxhfL4FaOid4bB/bY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the hid tree got a conflict in
drivers/iio/common/hid-sensors/hid-sensor-trigger.c between commit
2b89635e9a9e ("iio: hid_sensor_hub: Common PM functions") from Linus'
tree and commit 6adc83fca74a ("HID: hid-sensor-hub: Enhance get feature
report API") from the hid tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/iio/common/hid-sensors/hid-sensor-trigger.c
index 2f1d535b94c4,910e82a7d06e..000000000000
--- a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
@@@ -80,11 -77,8 +81,11 @@@ static int _hid_sensor_power_state(stru
  	}
 =20
  	sensor_hub_get_feature(st->hsdev, st->power_state.report_id,
- 					st->power_state.index,
- 					&state_val);
+ 			       st->power_state.index,
+ 			       sizeof(state_val), &state_val);
 +	if (state && poll_value)
 +		msleep_interruptible(poll_value * 2);
 +
  	return 0;
  }
  EXPORT_SYMBOL(hid_sensor_power_state);

--Sig_/=LXglObxhfL4FaOid4bB/bY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6787AAoJEMDTa8Ir7ZwV5asP/iBWg/85iVvjApEnBpO5N50C
dpyDL/JWDLLQWQwrnjqlFSOaHDz1WEtQcFL2A2+ZbKwM8719uVn1EtJIGllbCe4L
KQ4f+bE8sDlEPxc1Y0TQZJt4Gpotn9lrRd9VWAnY0tPugfBg/rUFbs30bKUaW1YC
CJbCHwqv/+9TRfuu9gAJqWHU7oW4hD4VgnnTTH9Z3IvLHXo9+UG9LjGBv/Mj+SLh
iJFWdz6W9XuDXcv4X7uQqcy+HHeVPUWVFheJADU4+FRSp74TB1Ama364V75u0H8t
Qe5QFkON23NvO+4hNSHthNe6IE2opHsGf329/No6lv9AavCq+WcgVJ3L+D8AuEjr
FjKX+TiZrIMuDdcwPnQKxBlXlWyvbms8Ui90afZmKi8JGy/5hx4bsQs5rn8tAep8
DWt6Gv1qJG/M4qAx+nvxFUKIZpwShs0GSAGct1ueMzzFukS/zzBoa0N8V4lafgz6
sgdunMsJVuTLhhkvSEq6KHTh4lUs/HUmNdSLGeXo6FEO5o9nOt3EyfwYaJn0i+OG
wy97WPqFAFMYgNA0aK+gJ48nPoD6Mxojrl84hhka1pz9aQCmUbO9jK6TiBpDzIP6
6FzCnql5N2A4Nc9F+GhF9klZlUbRbzfwrkJzrTXZgRL7jddui7cP386QNwx+oDLB
SEk/tb/P6Q4KboJkkylQ
=gC/J
-----END PGP SIGNATURE-----

--Sig_/=LXglObxhfL4FaOid4bB/bY--
