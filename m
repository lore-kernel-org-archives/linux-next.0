From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 14:31:37 +1100
Message-ID: <20081014143137.007fe44c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_31_37_+1100_oyQiJUkKmjvZhLsU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59321 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752638AbYJNElz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:41:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

--Signature=_Tue__14_Oct_2008_14_31_37_+1100_oyQiJUkKmjvZhLsU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/media/radio/dsbr100.c between commit
90b698dd47f3929f20746f828e2cd648bc6539dd ("V4L/DVB (9151): dsbr100: Add
returns and fix codingstyle for vidioc_s_ctrl") from Linus' tree and
commit 58e43f3f48c28cc35be7502b5aa81ce53de51815 ("USB: remove warn()
macro from usb media drivers") from the usb tree.

Just trivial overlaps.  I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/radio/dsbr100.c
index 66783ff,bbd237d..0000000
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@@ -360,15 -360,13 +360,17 @@@ static int vidioc_s_ctrl(struct file *f
  	switch (ctrl->id) {
  	case V4L2_CID_AUDIO_MUTE:
  		if (ctrl->value) {
 -			if (dsbr100_stop(radio)=3D=3D-1)
 +			if (dsbr100_stop(radio) =3D=3D -1) {
- 				warn("Radio did not respond properly");
+ 				dev_warn(&radio->usbdev->dev,
+ 					 "Radio did not respond properly\n");
 +				return -EBUSY;
 +			}
  		} else {
 -			if (dsbr100_start(radio)=3D=3D-1)
 +			if (dsbr100_start(radio) =3D=3D -1) {
- 				warn("Radio did not respond properly");
+ 				dev_warn(&radio->usbdev->dev,
+ 					 "Radio did not respond properly\n");
 +				return -EBUSY;
 +			}
  		}
  		return 0;
  	}
@@@ -416,9 -413,9 +418,10 @@@ static int usb_dsbr100_open(struct inod
  	radio->muted =3D 1;
 =20
  	if (dsbr100_start(radio)<0) {
- 		warn("Radio did not start up properly");
+ 		dev_warn(&radio->usbdev->dev,
+ 			 "Radio did not start up properly\n");
  		radio->users =3D 0;
 +		unlock_kernel();
  		return -EIO;
  	}
  	dsbr100_setfreq(radio, radio->curfreq);

--Signature=_Tue__14_Oct_2008_14_31_37_+1100_oyQiJUkKmjvZhLsU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0EpkACgkQjjKRsyhoI8xsdACfVeyD4FP/IFVBpuIMiXQYUqbn
WtsAnjhJ3NGTQqrwDwGWAr3HEkEIe/YZ
=PMRc
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_31_37_+1100_oyQiJUkKmjvZhLsU--
