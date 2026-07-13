Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C52F362133;
	Mon, 13 Jul 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955602; cv=none; b=YWtuzuHh63DjGPfnUqrkM/Ok2l2A2pZNUiV7Bwm9YvSKeZgcvtz2oKthrKf3m2ZvcQnBqVXSSrKyUNFbqUU05F//oJu2bCGU1krScD8P/iaBbgJdUBFnnM6kLydTfVUiLK54reP5KgduQBf4fT2PyMaKOtu4mAvzlg8K9OsIVYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955602; c=relaxed/simple;
	bh=zIcLlVaFGpV7U1LfhJ+m4bYWBIDasiimu5OKV6tx85o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgiWBnLN6WMAtKgBKI5gIzDl9swKdzZYw3zy6NRdICFosLx0CcbzRVXVn7xflS9VFJbfzr6Jtcs0pAC8+OgEVy/yxIWHY0sIZ4LYjxlB1YQgfXrxcAs2tKvmbGt2+AGPovsGTaaA0SYpOh+nAnRoQhMj2d9D8/mG7lrkNW1XVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWkfly36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWkfly36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301681F000E9;
	Mon, 13 Jul 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955599;
	bh=lJQzGfxVgJiuUpbBkdrrUOFr+kax5/ewvEEoAXXj9+s=;
	h=Date:From:To:Cc:Subject;
	b=SWkfly36FKlVceZtIiWN/L+5V8Lp92CspRoKQOGQsnkMePrkNd7tQaJA/icWD3Zs3
	 2r/xVNy6UdpHenCXQieMwLcPzIZX2NHMhnjpG5AwYlNQ4xwv5ICFryzx8mS9ufAKHU
	 ZFDWBXj56avWY1BIFr2dUHQNl5YPNCVl1iKN2cFG4b4wawBFXcW0Zp2ofseO8J9Bo0
	 5U7OtfVgY6aqbNaZdBBF2W5jRciZZxiqIk9k6xRQvEZNtKjfdo7xgOXb8d2POmZxS2
	 +uhc4ThsOgzk+O6WxtGU7ujyu5HCPSXnj4AQ8NiUwwkwu6Tp9/RvD2pc0mSuKWe4xS
	 37hBrTzccj9kg==
Date: Mon, 13 Jul 2026 16:13:15 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Brian Bunker <brian@purestorage.com>,
	Catalin Iacob <iacobcatalin@gmail.com>,
	Krishna Kant <krishna.kant@purestorage.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 tree
Message-ID: <alUAiyS3tTHDcbPc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdH5gmxkBOW4pJEv"
Content-Disposition: inline


--bdH5gmxkBOW4pJEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  include/scsi/scsi_device.h

between commit:

  e81f1079f9000 ("scsi: core: Remove export for scsi_device_from_queue()")

=66rom the scsi-fixes tree and commit:

  ddd0eb9bcebeb ("scsi: core: Add scsi_update_inquiry_data() for updating I=
NQUIRY data")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/scsi/scsi_device.h
index 8694eeadd753e,7c8c06e60a911..0000000000000
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@@ -408,6 -408,20 +408,19 @@@ void scsi_attach_vpd(struct scsi_devic
  void scsi_cdl_check(struct scsi_device *sdev);
  int scsi_cdl_enable(struct scsi_device *sdev, bool enable);
 =20
+ /**
+  * enum scsi_inq_update_result - Return values for scsi_update_inquiry_da=
ta()
+  * @SCSI_INQ_UNCHANGED: INQUIRY data updated, no reprobe needed
+  * @SCSI_INQ_REPROBE_NEEDED: INQUIRY data updated, standard INQUIRY data =
changed
+  */
+ enum scsi_inq_update_result {
+ 	SCSI_INQ_UNCHANGED =3D 0,
+ 	SCSI_INQ_REPROBE_NEEDED =3D 1,
+ };
+=20
+ int scsi_update_inquiry_data(struct scsi_device *sdev,
+ 			     unsigned char *inq_result, size_t inq_len);
+=20
 -extern struct scsi_device *scsi_device_from_queue(struct request_queue *q=
);
  extern int __must_check scsi_device_get(struct scsi_device *);
  extern void scsi_device_put(struct scsi_device *);
  extern struct scsi_device *scsi_device_lookup(struct Scsi_Host *,

--bdH5gmxkBOW4pJEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVAIoACgkQJNaLcl1U
h9CPFwf/ZKpM0yd2o8U9Dvkc0+NgXmBXxdxNvrs5fpCbfeTQdRbwdEhZU/V4KgRn
/HSv2nsb0e9b4/ZE7Y2xGzjr0iE6j9+L2/TTjc3iKVe804EOblZ3epWDCDlJ2mHi
7kn0KYwW+YhKMQ53xI3zGVfDZR6ZNTSvWa2qcf/T4B/VDP2L4Y1ZRwuXO9jC+koa
hL71X/ovZ+pf/9iA0xrBeEHVwvc2hIlV9vBjRn4f7G+Lgxzx+O/VBHTav7TTHaJK
JOtDLM4D0EgJfdxj9Wci/NVX/weKO+RnrwzbC2ZxG+Nq5iwIg0ew1whK//fWV/G+
5gh+uk3HNtMSo4sFY8W3KC5L5fJKJA==
=XrOx
-----END PGP SIGNATURE-----

--bdH5gmxkBOW4pJEv--
