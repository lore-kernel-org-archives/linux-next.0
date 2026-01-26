Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2079B349AE3;
	Mon, 26 Jan 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448807; cv=none; b=Z7hWtvCth4LJTp/ENzGjEEDNekbpF/1ejxbDpc4E3STUz+s7xf+kusHpxoMdoMjV7P+5LnxAZCqmILYseMEVe6UMh+v2Bp2mWs2GnPxEQUvANHy0FjZOuEvF9M2sSBIks77yUW/Awtu+1g6HnhAp09L4mQJojKUhFR8yDTCVTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448807; c=relaxed/simple;
	bh=RTnQAThxZQ4mGDr0FVtCNU1odvU8zVd00HzieRYHjMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/g0XNDXrkYBLwxzaWps6io0zwc1Vslai6rnt/FtLUSN9fve5pKkRw4oQTe+O59CPCSUJYlfmSpHBSqIi+bpMDjTbEAzTIMVRl26VTgsjb/UT/i6RdoWEcomL7AaNk7Jjzs13Q2n5pdd9kNDxb/u9WW7vQLdI7XzuXp7D3/zkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFpCwAwy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFpCwAwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A92C116C6;
	Mon, 26 Jan 2026 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769448806;
	bh=RTnQAThxZQ4mGDr0FVtCNU1odvU8zVd00HzieRYHjMs=;
	h=Date:From:To:Cc:Subject:From;
	b=uFpCwAwymg82JGRuNsh9iJqlqWaGs9VusJ1j9WNdfR1eO3rSh3/UvQ1c1L9E//lib
	 CyvxN5DmzInDUpn/9WV5CB/2tzHv+0EprktLjFOMpxrwsK7Q2RnLTRV7RscvBvUx1d
	 ddJ/u3qZnWQZ/UvjrQ3le9pVAAkk4YqYT8LXAmz+4kLbdy/fUynm4q17A705TTL+kQ
	 2Q2gkHhz2ydCUK3RaW7eN4CidmIeiUZkOVjsh+mqhPkjyeDEH9WbKRnrJ5ySWsnmqZ
	 QuT+0veb2dmZsUThBn4RrezYjpgHDKeE1lIO7PXKc2rWmcIEacfFOnKuI5TwN19Cv1
	 887HoVh4xK7nA==
Date: Mon, 26 Jan 2026 17:33:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ipsec-next tree
Message-ID: <aXelYpP4MFOuc4vY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZba/mD07nBR9scq"
Content-Disposition: inline


--BZba/mD07nBR9scq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ipsec-next tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/net/core/sysctl_net_core.c: In function 'proc_do_rss_key':
/tmp/next/build/net/core/sysctl_net_core.c:333:23: error: implicit declaration of function 'hex_byte_pack' [-Wimplicit-function-declaration]
  333 |                 pos = hex_byte_pack(pos, netdev_rss_key[i]);
      |                       ^~~~~~~~~~~~~
/tmp/next/build/net/core/sysctl_net_core.c:333:21: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  333 |                 pos = hex_byte_pack(pos, netdev_rss_key[i]);
      |                     ^

Caused by commit

   37b0ea8fef56c (net: expand NETDEV_RSS_KEY_LEN to 256 bytes)

I have used the tree from 20260123 instead.

--BZba/mD07nBR9scq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3pWEACgkQJNaLcl1U
h9CXvQf/ZvmrvGtqc+I2r3nNtsBQnE/KrW2v5gJi5ML+iNQyYo0k5N4XjGh08baX
V96If216kWEJFu/kLhxfpeJxbYKjifuu2hZ55imH5fydMKP4VfnU+mlzrnCatfmi
Hb8UWAg5CzIKo+2sl9UmWzlMPm0l4M2mWwfsG5li9Xrj8lUnhHkDK58I6bxTtv8k
9NaGRPJHvz/LeNNJGxt+fLY2e3HPPmVk1ZvUgHNn1id4NpXUtquZWIaex0BQpW6T
+qLJKzB9rtAxBzPcW9NXeEPpqzJV29YM5buqFWo8k7ImqXkxMG8AcG0jDMNtGcTv
70EYriAut6ndHED8B8r7wwH/sQCMBw==
=WKbk
-----END PGP SIGNATURE-----

--BZba/mD07nBR9scq--
