Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455924;
	b=WMvVdjcJYdRnjGjmntnrqoYfILtC5czMNv9IpryJX8rn9TXkOUTgH82HMpiqQDGShjwj
	 kWBw5E9O2X162m3X3fWWmgQvsaCANZD+ly9j9uQGevXNb2jfpULCLTkcQxpVi9GdtTZq3
	 JfF7FtV/4eT8S7cAyVslBDCFxhFi/Z60GxiW/a5FVPY1IImvTaRuSr5q0EZCI6u457gOW
	 bAEuFJNKKF6VJoyYYluUkeUeGIRBH8FylryUgGpm4IQzCThTCo8oSssXdQMSqhEg67Wmr
	 7BqmBvMkOvv1r0hC8y4/xnHT9j94z9dQqq/NoDxnvXxg5XcA7y7lySV40GGpps2wiYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455924;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=IKSlySScv1/FLO6FYrFecjofDZSXTakkY7/4hkyveT0=;
	b=dw624xWv+yyMRFzcBD3qDfxPV60eJuBMgmDZdLJoCYl2u2DPiQhTSAStGy6fqHvOB+vA
	 WXOq0cVa/+ChlGxLgA0Q/Sz8a2JMRvlw8cy5Bt8Hf7xipWh/NNnsRXTIoq8mW67nLvf3L
	 Ev81I1my8A1o4tnHdJHapNBxXXY1dxYQ5hHDNvfNGisT2eCrq22p5i8e6G/GqldPahyhM
	 aWQC33snoZqj2kQwHWvM2qx9kQXtT8Y/+PeX84KONSdKzSSLsILS93f2mOCmuM92luomF
	 O+X2JsKZbQGrEmL8/6jhsKf7IPhIX6P7BK/2iWvM7icC/29yYeSX7iq4hOwb1SuqUmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xp68NHs3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE628606A321;
	Mon, 23 Nov 2026 17:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xp68NHs3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325951F000C6;
	Mon, 23 Nov 2026 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455924;
	bh=IKSlySScv1/FLO6FYrFecjofDZSXTakkY7/4hkyveT0=;
	h=Date:From:To:Cc:Subject;
	b=Xp68NHs3NuzLN8PbZ8K93eWGQ4B+WdHRcQUVftP+p8Fs3jMEyWTQtdtbY9HZpIzxr
	 9DFchNlzT0hbvtXr32RmD9JaAAUrfFas+bcXcg9raT+S1Myvw1VRJ1EVzCfYJ9l8gL
	 NhyiwPTho+czAhD0/1zhMzP1A1GfPy3MY52yrSBwVzqLhfk1yzAIOvZWxx7fCoZb9E
	 cgtR5kmylT3O0J7LqpnkqIR5XNC9LekdbDZolGuKz8qNn3MafAq4/n3FAfcyprORjh
	 ByCmK1HV+1TrNrxBCcanzon//X3ffDJGdouTagTYHYwNOOsQsaU8tECEuK5TivgYB8
	 /5repmi84B80Q==
Date: Mon, 23 Nov 2026 17:45:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shunbo Shi <shishunbo@cmss.chinamobile.com>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <awR7sFLQtxE1tbu9@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="px+xhq2Kr8k734Cc"
Content-Disposition: inline


--px+xhq2Kr8k734Cc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/gadget/function/f_hid.c

between commit:

  07ec204e8aecb ("usb: gadget: f_hid: fix race between userspace report upd=
ate and GET_REPORT response")

=66rom the usb.current tree and commit:

  d034e353e3ef5 ("usb: gadget: fix a few spelling mistakes in comments")

=66rom the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/usb/gadget/function/f_hid.c
index 428635e580bb7,4befb3d0f58c9..0000000000000
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@@ -637,9 -622,10 +643,9 @@@ static void get_report_workqueue_handle
  			 * Either get an updated response just serviced by userspace
  			 * or send the latest response in the list
  			 */
 -			req->buf =3D ptr->report_data.data;
 +			memcpy(req->buf, ptr->report_data.data, req->length);
  		} else {
- 			/* If there are no prevoiusly sent reports send empty report */
+ 			/* If there are no previously sent reports send empty report */
 -			req->buf =3D hidg->get_report.data;
  			memset(req->buf, 0x0, req->length);
  		}
 =20

--px+xhq2Kr8k734Cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEe68ACgkQJNaLcl1U
h9B89wf/YQJYFdWwLhntZeu4gCIZmGodHxJT1c/IiInq+MtjjKHKJ/vxvL0vOmPk
G7r7IM0XHTnY8vwlSA7H7Za3+y0ZQkRtcQ8yobKUUDapDUDKW7b+L9oIwA1VjLZA
94mDf0pckWBW7Jyd8Z0u9iQKi0Qaze6r9HH/CD+edmrus4RGFBum2BiIcTSmFOaW
OjNOpHKpG9UL2TgV+IZroFx95fzbukMLK+Fs7LmrbyNrZPpUs3VSKJTU/Gk2IcZQ
EOXB9f57Idg1xK7CrjkVSI3Blohj8X5yHvUyKhmd2uqkdPm+nE+/BUefZfXVYQYS
8pE30Yyg14VG/c0JDanzH+aCwdcXrw==
=yXTd
-----END PGP SIGNATURE-----

--px+xhq2Kr8k734Cc--
