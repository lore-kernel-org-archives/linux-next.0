Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794972;
	b=Y/A4Y3tkIFBL8w/qYMNa6ltlbrTTfu50no5rMFBoAOWiUQSm7fhQTZXV+V2DfKDYkzdj
	 YmwlMSMIMITMvjJPlBkhylzM+KL0wa6TqtTOorvYVCsRwqRohUrlsRQV/9OjREFvCXqtJ
	 XHT2v4Ea60+61kUN0JqWNpD/rQ3q20+BU3kZEFJJuTV2NJFYwp9VrqhIz906m8mTh9riZ
	 kUGWzDQ2q2SEkvrMPlRK0dFHsCvw5PkqAD7N/0JCJ8JAXHzfT1TdDghZWHvU07lBOXlXp
	 O+j09fVoGFzLB5X5I0ppQgSXp6wH8FxVTkjlsF/QyO4PoWT+85ZGTrYU+TCSbkyHVXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794972;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=uFMt57dgI0b7tEErsdqvzNRDZ6jXvxkK6TXtTRipx6c=;
	b=gQ8YSjoCV7xh5ke5VWoLccfC5ahDzV4Wnuhzk2vjEHRtlVMYuEAuMelOvnJJmI9hZ9wb
	 BXD2Z776+RR4NfY6pCM33G3LMdiw2DMKh9NksyiTE4hiqJA/CCmYro/oV8sH99dtjRBm6
	 qdDTRAI92za/vkX13x3YCrHW2Q3C/PiwsFpCcssXnfdrHthciqssCjQgpTTmwnIU53OEK
	 qy5cjmmyGmgE1CLNUWh7lrvcAT6sxPbD0bEOkUHYgJlkTSrmQ36WpCdBA0Nx7sKH2hCj7
	 OX0nQIc6Ck2h+EnqkbgQGbYIuHXVspYnof4lRHpemnHZ8c3RCHmjuK3S7aZXqD2lwxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="l///ArVr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175E606A327;
	Fri, 27 Nov 2026 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l///ArVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C371A1F00897;
	Fri, 27 Nov 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794971;
	bh=uFMt57dgI0b7tEErsdqvzNRDZ6jXvxkK6TXtTRipx6c=;
	h=Date:From:To:Cc:Subject;
	b=l///ArVrO7VLDlYd946LgyRrBQ5kWA376aUgKXJ2cfMyDzQmsbNZyCEd7FLaTS+tD
	 K0Qzls9MdFM71oM8w4PXF/lFr8WSKui7Eji+Q4s58JgR/UBf8p/hORDb8lHXsOG9vI
	 mcxEUik5dbTH/6lGwFZsSlD4ltTiaymuJjwROYLY522CsePDYyjZ5Hf976/SHhqOsK
	 6DVCnxWM1DoduJ1PkRk0OmgvCKu77NygTuwwlFkx2iPSzW1sbbqxDJ7iupRQgC7F+t
	 8EGlf/MIPix5EfFxRxRoom0Q+liNcpAsSskxn8aejUB2CgGhlpOxGvxFPsjojEj7CE
	 WeKr9VrTQHIOw==
Date: Fri, 27 Nov 2026 15:56:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 27
Message-ID: <awmoGBFrT_hKxf8K@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="AgEkFRzFe5UuAtDG"
Content-Disposition: inline


--AgEkFRzFe5UuAtDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261126:

The origin tree lost it's test failure.

The vfs-brauner tree acquired a conflict with the fuse tree.

The mm tree acquired a conflict with the origin tree.

The hwmon tree acquired a conflict with the hwmon-fixes tree.

The bpf-next tree acquired multiple conflicts with the bpf tree.

The leds-lj tree acquired multiple conflicts with the origin tree.

The gpio-brgl tree acquired a conflict with the gpio-brgl-fixes tree.

Non-merge commits (relative to Linus' tree): 11208


----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 438 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--AgEkFRzFe5UuAtDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJqBcACgkQJNaLcl1U
h9AaZAf+M/LRENEn8SRNW71rUgJaIDoOeuhUbs38pSPJzWDINKhyp2IcC7zRafES
L66NJJXuUyMdRVcvYlR2V2HfpnRb9+orOvJxfRhBDFycLIkVRMjp6SE3jqAIWb5b
5QcZMA1xm0dNmEJpaGocT7CTTdxV8+zNLeldOSKx9UafNf+6lDZrUt0kPFz5P9sU
sl9rjNPF/G2P+lcozGf4OlcrQhKRhFAYn2sVBqk/8dqpGbuY+aH/AX+2/B46kVzf
8Wi4819ZbaFGqDeNLgF9VMFkwpBvl4QAz85yQarUipCi/FOdOudUbWjSi261pWNT
QWNF+c7NdRLvBz8Dh8H4fZYBmAcYXA==
=Yx16
-----END PGP SIGNATURE-----

--AgEkFRzFe5UuAtDG--
