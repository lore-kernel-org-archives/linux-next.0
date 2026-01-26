Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E7284B3E;
	Mon, 26 Jan 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465209; cv=none; b=ZYCY7dAh6e00eZS8B5kh1VfQYB3/WQnRCbbqPWWGUN4iSgBrfA577mFub9AsbJ6wnT8wqx2PeIq//BQNF9SJYlJw927ZCP4wu2I1WVc51LdFVL5OvxSUx9QZ2IYgpLF0DZ/xu9wqHrrWZoCHFGeOzgcgvxDN1F6FborXD46ccpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465209; c=relaxed/simple;
	bh=HWycMOqj2yVIaCc9h7ffLbGxdOsQ3pInOqnSDo7mMZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIdQRGLBjsTkjhK2c82mLTQeU/3gjtcWdFtuzRCZ/IuTB6ok8REDGisVE6LbkWE9mmEXZ0ZienMJRzVallbLLAHCyKZLtU0tYJg93nk3RxMG3fEkiiOTIPOkDqIteSz9mSKHVrAkWuwn3LvL1BKkzckkPZ0OqQU6HFWLlSdXwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwGh5ZHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwGh5ZHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C788C116C6;
	Mon, 26 Jan 2026 22:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465209;
	bh=HWycMOqj2yVIaCc9h7ffLbGxdOsQ3pInOqnSDo7mMZ4=;
	h=Date:From:To:Cc:Subject:From;
	b=FwGh5ZHtlAl7jeW6s1lsujVg3AF0eN2kIwb9CWjpIUFPji/ay+gBAA2Z7SjPv39cL
	 Yqoivu1YnT8DQwMbntE3FEgwMAX97WJMc+Pjd9KOI1eYgn1QXwfA9IhmOc1td3gbR8
	 YkI41FyCGVWYWKue2U8Wtx0+87T/kEf63IfmGtPdzDQfcXxOwTn2qg9SPisVXqMmvD
	 oz/afPPHl5A3E4NlQC4tMZ7wx2eA52n55U0mJmf0u1dycxUhwaHzJYEyi2CceTYhIs
	 uhdShZKA1jY3CDCkA4jnr1elyALdiXfJGAE3h+NahGRs7mtmOcoDOxzUlzVPiYEWoO
	 UL7cc4ILhsUSQ==
Date: Mon, 26 Jan 2026 22:06:44 +0000
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the libata tree
Message-ID: <aXfldIKLh35dGHjN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XXMAHJlkOUhO4yUY"
Content-Disposition: inline


--XXMAHJlkOUhO4yUY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ata/libata.h

between commit:

  0ea84089dbf62 ("ata: libata-scsi: avoid Non-NCQ command starvation")

=66rom the libata tree and commit:

  0db3f51839fe7 ("scsi: Change the return type of the .queuecommand() callb=
ack")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/ata/libata.h
index 9b4e578ad07ec,0e48bd1c0c206..0000000000000
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@@ -165,9 -164,8 +165,10 @@@ extern int ata_scsi_user_scan(struct Sc
  void ata_scsi_sdev_config(struct scsi_device *sdev);
  int ata_scsi_dev_config(struct scsi_device *sdev, struct queue_limits *li=
m,
  		struct ata_device *dev);
- int __ata_scsi_queuecmd(struct scsi_cmnd *scmd, struct ata_device *dev);
+ enum scsi_qc_status __ata_scsi_queuecmd(struct scsi_cmnd *scmd,
+ 					struct ata_device *dev);
 +void ata_scsi_deferred_qc_work(struct work_struct *work);
 +void ata_scsi_requeue_deferred_qc(struct ata_port *ap);
 =20
  /* libata-eh.c */
  extern unsigned int ata_internal_cmd_timeout(struct ata_device *dev, u8 c=
md);

--XXMAHJlkOUhO4yUY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml35XMACgkQJNaLcl1U
h9APpgf+NoG9Z2wBAElK4Nu982RHT0rE7xlLx/ukCeP0I1t9PDEmewCZU6DJZlnO
DyjpoJggJj/t9AJitPnxGSnsAW7kMBAjNn15btwH0L5EA+ZnmojwvFzdfu5xSjdM
Erkjor2nCzvXcKrsVuMrp3YT6CXVlOVa74dLh5JzWfbKa5vPJ1MMvS+SykCL9r4i
f/ZQK7B5r8aFtRkx8UtApKAeFjX/ovQSqObDb6nkewLxSj0vyNUadujpbFx8FYps
na7jvtMvMMtS7eeClpAsiIdZ/A3YXzXu/5MS0h+0LvJ2BX4fPYA64gk4F3hztdgO
6HFCyAbZBZnXXpQWx1C4Ql3aHaDHSw==
=ZvzD
-----END PGP SIGNATURE-----

--XXMAHJlkOUhO4yUY--
