Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB635A38C;
	Wed,  3 Jun 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475052; cv=none; b=NpLWXQURsB4pn96UMRZEpSfnBFUODCbVKFq/khkpwSM4UZcT2ZiTppVnKO/flOMcLWCjYm+3otHzJ5ueKUJas6S8na7Q7Qt7EpHcn/XlgxnnHUKyQK1eLmiFCQN5h09/V0qty7z5eTdAnNPwmPEy89ObtccbLnyr+6OEs2kdZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475052; c=relaxed/simple;
	bh=gmlstbE7npUIMAosnQOrYCbTmPRDuGcBh6BfqiqlpDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lN1PGTbYCo32nY9OkLLZMnOD9r2WnbzwuV5VO8q4yOCkyYkqgKyXouewqt51pAISUicV/tAjUjb2zL37KUcgIwt95wSmC83mrfexgYHmVXJDdfsoNuUgcof/9Ta10dsoZyNqWS4ehtMMFOgYQqcCwzxiyAJfuI/hYMVhw85L6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVUU2MKm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVUU2MKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70B11F00893;
	Wed,  3 Jun 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780475051;
	bh=HeJ3p1bYB2gldIUfqUx7rlmNUR4ApQBSjo4IWBpov0w=;
	h=Date:From:To:Cc:Subject;
	b=kVUU2MKmfAD+B2cj7pxE2AFyvpNfwiF2qM+m4mkY/bQZbymCsAJRnsTMAYGbo67Jt
	 Wt8wVF8MxB7IWCOy+kGDy2ahqqqzHijc0aDvuMIPPm7woRlANeuqyqRvyd2GStSPZq
	 +2lklkVhbTriaQqK5w/gRcWW1/FHvY7jVRKYSKlnquzAUCg5e0/CLRdHspU2NYmSVr
	 lQEnE3JBPpr2hUB3ny6iGi/lU3xgiSrv/If2TLZkVtOgd8MTO9BcRrij940gY4zwGo
	 2oTnhTklSmULF2opFRdbef1AoFxGfHWGOaEOG3mzp50E2qC+fxErO80bVwKigX4Er6
	 Mytq+E7LJebaw==
Date: Wed, 3 Jun 2026 09:24:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	Steve French <stfrench@microsoft.com>, tanze <tanze@kylinos.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nfsd tree
Message-ID: <ah_kp-LWg7pndPkq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FaGuI6va5XPg/PYE"
Content-Disposition: inline


--FaGuI6va5XPg/PYE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ld.lld: error: duplicate symbol: cifs_fileattr_get
>>> defined at cifsfs.c
>>>            fs/smb/client/cifsfs.o:(cifs_fileattr_get)
>>> defined at inode.c
>>>            fs/smb/client/inode.o:(.text+0x14780)

Caused by commit

  e50bc12f5a365 (cifs: Implement fileattr_get for case sensitivity)

interacting with=20

  4adb7181f4d80 (smb: client: implement fileattr_get to support FS_IOC_GETF=
LAGS)

=66rom the cifs tree.  I have applied a revert of the latter purely
because it is the most recent of the two commits and doing so fixes the
build but I do not think this is the best fix, it looks like we need a
merge of the two (eg, adding cifs_revalidate_dentry_attr() to the nfsd
version).

--FaGuI6va5XPg/PYE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof5KYACgkQJNaLcl1U
h9D/Ogf/UPsCxNWemNtZoi9NmsW+NTIMHYPqo2PwM8IXyBD6/XzO7wYUYUdRaeam
IpuekAIUc+BVbj5dd7k1vExmjixOTRlQ+88OI/J5TO8zZm+G9CfOSR7sVd5j3MPW
vOVKMO8aQ/ipITdNlxGeyCjG7r/m/HBjM/u/I+113crMJQVmSltkwlQDOyIE+DAZ
XrpnLBYO2AE4S7FaLAV4xZOZsyZMXStZi9sMszF4u6OJTw2xZt749OyAHoqmpiIs
nRihHVx4WC0VwEJueeX9VDjtgr/3ZJUnFuvKpiSkewjhhAsAPWcOUTmtHfrgMv6E
l5mvH2XR2idAg5T7eCoQ7r5N96zyOQ==
=Iev9
-----END PGP SIGNATURE-----

--FaGuI6va5XPg/PYE--
