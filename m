Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB473345CA1;
	Tue, 27 Jan 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514348; cv=none; b=J2TVvqG7ErecdnTrwOIHES5s9Ta/v8WcDc21/qTRahgOaGAJPZXy/fQegHhpzrDJW51sZztvSiiKPtSfPjBjS+k1JJAayXcO7SiNWDcA1g380knzdoHEVv+MgugnswikLORn9ubJCpc/7bxUzBNH9cOTRYme3EredsSUBgwYQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514348; c=relaxed/simple;
	bh=wYwwow16rZTKVxR4oyTGHcTxYJRAO/Rgju4wiCbnEgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUlxsk8A6zL/CD8GyxA9P+cU7YKCW6srQxwY/aynOPujWbPfUDbOLfb55f09Hi6OVGnJAFtH0pTQ/U+r0rGS9lDXy5TQbUVJ3AQkeKWkgz/BH4Xv64gFbiwpop2/BaXhop6ZQr4FXKa4WDV6/8cM+rB/EDSu4QQZMweVOplNSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYIwAbt3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYIwAbt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D04C116C6;
	Tue, 27 Jan 2026 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769514348;
	bh=wYwwow16rZTKVxR4oyTGHcTxYJRAO/Rgju4wiCbnEgo=;
	h=Date:From:To:Cc:Subject:From;
	b=AYIwAbt3SqtUi1G9ZsEQonBwF9bAXsBOPqEpKbXcRtqn3DkfTsn2Zj/LclDODrol1
	 hGWL4I0xcKWKAjqLYxlsd+1W/bGqUTKDjlM/wJeQHPlOOAGtLflep/pS89/gJES0I8
	 ENwoefvyCPy9lMCc+5QG2QGyIEYrN3eCaoA0BHU607SX+NpdWms+pwjyAMhlGJG8J4
	 xkoM9WN4odaD25wCMYFWHMmLr/qWOayEFSDnovDOjs/TXwsPNgNgU+vjjuMy30Kf2C
	 DciaOOGMlKOZs3V4N2iBm68aWWaFL0qUeY9VJYy4fwvLndrVQcB9fI6+P2HC/4e8uA
	 M0WqgwTFl1ATw==
Date: Tue, 27 Jan 2026 11:45:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aXilaLSzB1xsGWCb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e31cMrslLLEBr8v+"
Content-Disposition: inline


--e31cMrslLLEBr8v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm64 kselftest) failed like this:

statmount_test.c:36:26: error: conflicting types for 'statmount_alloc'; have 'struct statmount *(uint64_t,  int,  uint64_t,  unsigned int)' {aka 'struct statmount *(long unsigned int,  int,  long unsigned int,  unsigned int)'}
   36 | static struct statmount *statmount_alloc(uint64_t mnt_id, int fd, uint64_t mask, unsigned int flags)
      |                          ^~~~~~~~~~~~~~~
In file included from statmount_test.c:15:
statmount.h:91:33: note: previous definition of 'statmount_alloc' with type 'struct statmount *(uint64_t,  uint64_t,  uint64_t)' {aka 'struct statmount *(long unsigned int,  long unsigned int,  long unsigned int)'}
   91 | static inline struct statmount *statmount_alloc(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask)
      |                                 ^~~~~~~~~~~~~~~


Caused by commit

   c76a572bb04ed (selftests/statmount: add statmount_alloc() helper)

I have used the tree from 20260626 instead.

--e31cMrslLLEBr8v+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4pWgACgkQJNaLcl1U
h9BkfQf/ZXXoZtEe3vBL+wH0Rhh+6Ewh/6YCfe9LNn278uG6CWg0/FYvyM2/iNZc
qMvGuxAay2fzM3egyw/xDCuQrGjgj1n8dyzkmSh1LMOBaAx0ow6Sa3EJ+694JdSy
EeNK6AnKkPHoQdlecntVm+LGUEMetgnGFdV7zj7hdo4nHbubxDCQs1O/79T0xmLx
rCiIla6GXeGoKkFGxU1OOW7GXwiicEH3IG6G/EnpG14Q8gOPUNT9oINuwz5Xyqfc
jcymRpEQQTTzuSGd5IuLkgkZBorjC6ZlSGVaE29geaQFoHuJo2B4glEpb/trGHW9
1EHCfzODBn2tgg/16fpByxMLIst1Yg==
=HWPM
-----END PGP SIGNATURE-----

--e31cMrslLLEBr8v+--
