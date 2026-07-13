Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A0372EEE;
	Mon, 13 Jul 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955609; cv=none; b=cSSfXy44DVKYOyWRPQXFpy3Eint5b1S/8bRS/UuV3vFRuo9gU/GIyCaL9mIPDbJUziDSMo11CvvV6jdGYGKVz4IpwZQi09jDlwBJXeMY3zwIq5CAupHcFVIhzEAYSSUvcdqZEzWsyUUWLDDAaAAHVRWS7RI0Ot+lzmBTpWeWbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955609; c=relaxed/simple;
	bh=QSdxH+JShDA0AXw/SQVSGaGMn1uKaWk1nx6V2YDidck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSXtkma2yuxOB/fGwn2EEB1exg3PZ8ymcYf1SQmqsI/w+F2liOCeHOJP2D54712wOiNdajQSveh97N6bZFt30W61l8fRSuIVlicSbtiKweulsYOVErLXL/P1UKcv7XHu4WAbqRjLP1raJgEsd24s0UJJscDiJOFMJQ/ho5Ztf8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTHyHpU5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTHyHpU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C4A1F000E9;
	Mon, 13 Jul 2026 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955608;
	bh=W7i1SCp2qfIwTwaLQo6nkooaZSMyIJXb2uvisaNXFtw=;
	h=Date:From:To:Cc:Subject;
	b=DTHyHpU5XnJljfbRO0uBSsvhjlVc4zmUpd/X/JF/kxgIeqR7CQDqPSR30ecHQRfz9
	 p2zuom46oFFabEyqExGMJYMZsZCOjoMTPZmSQ1zHlynb+idUk8POKKmUrkHPFAXZG0
	 QioNf20MEGDcyaHlcJO0X3RgidsfXaCwRW6yNgz7K4BQ4koQ9o1Rr43sMYihlA4Ul+
	 ktnW4ZqR6CkG8IwaADDkh63M9QsjgY9FvxGEPieayPDBiy4eXTWGntCdyOQ6TRq9xy
	 XAQDGC35VR8mjJ0vHvim5zQd6hnfyapRsW9XIHCmEhcLiR9jHuH8xHn8kuAyRx0MIM
	 p0fxM++/UQU3w==
Date: Mon, 13 Jul 2026 16:13:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the origin tree
Message-ID: <alUAlBfA42zAOZ3c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuFh3rKrXU+zeSqb"
Content-Disposition: inline


--iuFh3rKrXU+zeSqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  include/linux/mod_devicetable.h

between commit:

  ad428f5811bd7 ("mod_devicetable.h: Split into per subsystem headers")

=66rom the origin tree and commit:

  e73ba3d6ed03b ("scsi: zorro: Simplify storing pointers in device id struc=
t")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/mod_devicetable.h
index a397213bedace,2673a1bd82c45..0000000000000
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
diff --git a/include/linux/device-id/zorro.h b/include/linux/device-id/zorr=
o.h
index 5fdac81689839..26827b9b90b67 100644
--- a/include/linux/device-id/zorro.h
+++ b/include/linux/device-id/zorro.h
@@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
=20
 struct zorro_device_id {
 	__u32 id;			/* Device ID or ZORRO_WILDCARD */
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	union {
+		/* Data private to the driver */
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };
=20
 #endif /* ifndef LINUX_DEVICE_ID_ZORRO_H */

--iuFh3rKrXU+zeSqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVAJMACgkQJNaLcl1U
h9DGHAf/RQox4Co5bbw3jgN9wJ9n3G9WeuEyPBf50ezo4ISbZiid1foLmD5EoPqx
BeAKPGtflfT4S+9WBsSwQybYofXrpnTvbq1/SbrR0F49lFRbV1Dfx7DPsMEVZntx
vwZhJDQmc79oaRQUHDTvBjvLI5y+w7ndcxY9qXYW67l63cz3EOc6HppoUTu2R+2O
fw4RqY9WLAZuXXSlaxanR2p9PyRw+PucABoWdeqLKjv5+RUF6IYT8m+5pyX6KZon
PSs5ULqHJfLajy/ApdbBtm/6cUspa8gGcPt+x8+HR8ZnDtgmUDDYCPHKXowVcoSG
zISq1vGjPf5iA3rIU6npYCd5f+MiqA==
=eNmf
-----END PGP SIGNATURE-----

--iuFh3rKrXU+zeSqb--
