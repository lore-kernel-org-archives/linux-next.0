Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAE233927;
	Mon, 13 Jul 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961288; cv=none; b=D69Zf/Hww2BiH+5jgBIG33EWWOYZ9UF1XRCj0LLEhRfOiqkfdojTYBibw94MzNWmfaYRhfeLx47r2u98SYcsnPE+sjBVGYiN1FEMkQAvcwLJ+VJSTRvHF2NNw3z+uVxroqgCv1u7nA0NANHPT3SwglBXiacxzk9PUN/s7RGBhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961288; c=relaxed/simple;
	bh=t6oj2JRS6nnp4BCbhB8U6FDyFnpVukYRCEqE4svjqzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCDdhnGQjyNrLBrJnGHXJzq/bZlZaiqnCxyo02VF92ZNPtPG/Tu7+deF9CFhLI6oW1rHkPme0DMJK24a38IHNbMOLOoqOYUPveOP2dEBB3ry7DroRmMTc62RJ2f1nenjW583Y3N5LGrHGD+8j15sDnIiPBbCmpjxXYmjgZFt7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQ2hGDFo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQ2hGDFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85451F000E9;
	Mon, 13 Jul 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783961286;
	bh=Kso56OrVpWFrbjY8u7eXi6pGjGyyOS9Kzt6p6kkXMmM=;
	h=Date:From:To:Cc:Subject;
	b=EQ2hGDFofbZdRYlOMDk0ulOnqmM79bbE4w531fC6KzfUFGV5M79/zbR5DnayyYMSB
	 GnxRAcpvtecsBw4LnwnlY6PRK8VKY9y78oX/C9TvCEZT0X+/07GZjAJ9c/6x1PSTFH
	 eDgNTai01EKevJ4RV3oZ76xwoAxhKbJey09eLlWFIeU6jWQaj+cTQnRf6J0CpREgde
	 RoDN6vqcqP3xAUwKT01ulYw7cte7PnUHyw2auS7hiNO7m3YEZn+kGheW92/T0ATdo2
	 rXGztxTdWMEqwVXnuEQY7dycPVqnH+N9Etqdw4ec5H+Z30dZI7Mmj0CUa0r14iJNtO
	 d7MVTr+3/zDSA==
Date: Mon, 13 Jul 2026 17:48:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <alUWw0b334Y1AiRa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1NgSqBVyN40JGTiG"
Content-Disposition: inline


--1NgSqBVyN40JGTiG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the kthread tree, today's linux-next build
(powerpc pseries_le_defconfig) failed like this:

ERROR: modpost: "nvme_fc_rescan_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
ERROR: modpost: "nvme_fc_unregister_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
ERROR: modpost: "nvme_fc_unregister_localport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
ERROR: modpost: "nvme_fc_register_remoteport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!
ERROR: modpost: "nvme_fc_register_localport" [drivers/scsi/ibmvscsi/ibmvfc.ko] undefined!

Caused by commit

   ddbcf78e8d230 (scsi: ibmvfc: Process NVMe/FC rports in work thread)

I have used the version from next-20260710 instead (equivalent to
dropping the tree since everything seems to be new today).

--1NgSqBVyN40JGTiG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpVFsIACgkQJNaLcl1U
h9BZTQf/UX7P76dhQRSN3+B5fKW5PEWFbnDYzjJ5U78KtlUNAgv7o+HBTcz9Obbh
XfuNSyUHMyJEuv0Kn7HT9a4YRjJMhVAYhZ6SUo5+ngHV245I0mbChsStNbMI6EhW
8nyEKPgfxABAHoEW9HBJri+sLNOVchYH6GXrhZJ89TajDzbTzSWrMqabDhGkCxCX
tvhg9CQwa0fx+kp4m0f2CE1O6HyEI9L7F4bNu8M0/u+MgyX8vKtCFSjIXZJRbIw0
ZVnOhhh24AZIF9Xxnl7FI0ZE7bNg39ajssvmHZ9rb9qec975uZYyLBxT5uLq6hKj
cipNaWAMU6azFDbnf884kdCVV0vg+w==
=vIG4
-----END PGP SIGNATURE-----

--1NgSqBVyN40JGTiG--
