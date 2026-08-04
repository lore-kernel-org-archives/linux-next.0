Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EA4746B0;
	Tue,  4 Aug 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860922; cv=none; b=Pqh43sh822z2TkmscSuRjRVaGcUOCtQsHvk+nzQwqbXztFLj9ZWAbyZbk4sGV4MyAoTbr0kY7FybgO5Ej3c2C3KBtWU/Eq0nYvUjm+Aeiw5QrlnFZ3mkRFTRppZrAQTvoBeUJg9zG7cLoPGL3ahQStz6+Je2ADvL3k0dVn8ZZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860922; c=relaxed/simple;
	bh=JYaEyA5QTYxpvE5YYMKgltYD4RqZtULBpWY1wb3gboI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMonM6EbYVzyUtXWMB1CwiA6bE40oYIX7XZIAc/phVJCRSUK2+XPfkObLZMF6KUp+MZqIrSOyrEqfVQ2HW1TLJuRLoLk5jlhhnTw4qUlpz9Y+yUcdl3i/p4gOGLbvVvPp3uE96SZlOP0aqSF841p3iLOn1J4nVmjMVFIMY3/Rx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfJsSEv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfJsSEv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D41C1F000E9;
	Tue,  4 Aug 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860921;
	bh=Kdx7GX4k8VWy3HBExGDyAtAIzWicr30iQzQ7BTOYMx0=;
	h=Date:From:To:Cc:Subject;
	b=RfJsSEv+0WQIiqBqX+7JmXsd3Yao6K9YFuLGoKPMZHayEMm6OPcMpVasJ1roiqS5/
	 rH6vRfL086JTj4gCfzn8Jjo83RdWKQsWUouiRq8i462SqUhipclb1katmLwp97Bc/P
	 zuZ6b6Hqfd3w0ZfbHOddHZKjj0qEApyu6Oqo9V5nSD+xHCcujTxvAlDbKd3k+hsLvT
	 gjkmxpVJZSaYLr/LB0CkweTPoFRqZBtr9C45HucfPhBqxlp33OxzgDr8HmAo7TPt/b
	 voYOypuu6WZX1zVakCN7jF8jxsIDZkX25YA8yharns0KvCxx7ERFntRp5KILs+3Ht5
	 tNOTZrdkWJPTQ==
Date: Tue, 4 Aug 2026 17:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xen-tip tree
Message-ID: <anITNOG1qicdE-TI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rglbo7ou1xcCVJY2"
Content-Disposition: inline


--rglbo7ou1xcCVJY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "init_mm" [drivers/xen/xen-privcmd.ko] undefined!

Caused by commit

  64d26fb2ad1f2 (xen: privcmd: fix ioeventfd crash under PV domain)

I have used the tree from next-20260803 instead.

--rglbo7ou1xcCVJY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyEzQACgkQJNaLcl1U
h9DmEgf9GH3biACmWnmq/yNJJWbRBo9ckKis4YF8r9wWF3cUXlbPpFU/onwdiX1R
8niVRJ6do7WpnIleXDsraBsdZT+5A519dVcvwZQTGPZij3w+H6/8kbtSBvDK0hH8
QXNlGwdUHrC4Dmfnn3b7cSHA0kM1u7lkmGwlNjDnDypmVw/tV9KOVRSrFRDk1yax
mjo6dYuai6eYmZ0RwZlX7R1u0BDDnJq0qwuI0Rz88ZvK8YSrE267CSXwQl9sJhzy
S4Jclf7ASn5mR3RiNeI7ad/S8CmWOE4hFQLD/MaWEOFXB1ZkFpM06cRsD/nuSzld
nTl9c3Va63TUmODp3RhIh3aLzwy7Wg==
=/t8B
-----END PGP SIGNATURE-----

--rglbo7ou1xcCVJY2--
