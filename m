From: Emmanuel Grumbach <egrumbach@gmail.com>
Subject: pull request: iwlwifi 2014-03-19
Date: Wed, 19 Mar 2014 08:30:56 +0200
Message-ID: <532939A0.9000901@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="akECqil6ulS61mWo0cQVX5iPiaPgaGCCL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Linville <linville@tuxdriver.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--akECqil6ulS61mWo0cQVX5iPiaPgaGCCL
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi John,

This fixes the build failure faced by Stephen:

drivers/net/wireless/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_fw_err=
or_dump_release':
drivers/net/wireless/iwlwifi/mvm/debugfs.c:161:2: error: implicit declara=
tion of function 'vfree' [-Werror=3Dimplicit-function-declaration]
  vfree(file->private_data);
  ^

Please pull.


The following changes since commit a82dda6cd492b8c88952be6f6527f3656f7ac5=
85:

  iwlwifi: mvm: disable uAPSD due to bugs in the firmware (2014-03-18 21:=
15:42 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git =
for-john

for you to fetch changes up to 192c80a2499cf2571924081c646262036d841484:

  iwlwifi: mvm: add missing include (2014-03-19 08:25:05 +0200)

----------------------------------------------------------------
Emmanuel Grumbach (1):
      iwlwifi: mvm: add missing include

 drivers/net/wireless/iwlwifi/mvm/debugfs.c | 2 ++
 1 file changed, 2 insertions(+)


--akECqil6ulS61mWo0cQVX5iPiaPgaGCCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTKTmyAAoJEC0Llv5uNjIBlyoP/A3+ZDd3tgEjB8QtX5LeXOn6
Y9/1NvNMxiVQdctBbGooDiq73ORNH1K2oEzSMOrGTemWK9vI6vZQt0EyAC1O+5Ub
eLdGs42tZMekCYaWog8GV9huyBoKqYEkDB1Fc/zQjogXGtKQl5TRTFX5vGuUslZs
tC+/zwGrJoViZLKjhfy9lBchNOzF4R+KRNJTTjfE4SZqp2Y3WFTk/kRkC1eiS2gj
sTK+ROIJfZ2L1VNwJXjjDUrpTMLwoKYRBemv0pfYsDwySb/RbDg93AxyG9Eq0+9O
w8G64LtMtTk70PW3J6vJUf+rT4MPw2qpWCz8imygdEtSfCIRA2L5qriMvzY1VXyx
3+fXj3IIhHw8vQ2ymVkgMUUvcnsgzfyYrFPQlvcrJJZetqWcVaN6879UBpGn+/r/
hid4HEJ60/oCsiFcCLeJLd2Sg5FdDwizf7vSQtgQRdyfXzmi8hW9x1oxaIm6ME8F
Pt3ZtrXrHi+ZxIhO0UDaEayQTtN/E+sC+/VsKzaT4zfNMrYe7sfGupKNjxCbHuKE
lEI91qOar9HSGxDYfFZzztAYk6xKL31mcf9SpEDrDYRQQjdRgnuWV/qVNNdDcCJh
AaAJJBAoB/3MA3p1u0Ep2yLeN0ngYYO2/U/Q9GOL6aS4h2tRgpVcUj3JKLoOvd1T
he1soIv6cyVxVKTqJZSm
=eGku
-----END PGP SIGNATURE-----

--akECqil6ulS61mWo0cQVX5iPiaPgaGCCL--
