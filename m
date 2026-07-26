Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29BE17A303;
	Sun, 26 Jul 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096998; cv=none; b=t+lJTH5LRa+2UDMEvizp7N7uopkQ3Ad8eBovkOts81vNjo91atEUPBABiDgujrXXFi4yayjmXxtPwi6MSZasx92enijTeSVrm6Nw8LXVNCoLMXSk3kDOg3TmS30Q6wzVLqV4pp0Q7zs0C3Ho2/iSVqDUnnzuHuLCkBB7+5vBoV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096998; c=relaxed/simple;
	bh=tb2w96rL36J6JF8+SQGqnl937k9oRLpQbNymP1Edz1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cc7DZPwiv8CXFRPpiCQwiuUkxkzjBdcCpcsraK6yYzqUm3nTfbaDP974hC2N71XOxaIyLMXg2nB5D0/TQ9oKkme6tlJspH4xIqPuXtF/yNb+pvKS/6C7cKlHFl0vefhOyDtr+hbYvg7nI27OdJ1icDyhnatJWLStrAccPE5Yl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lr7TOjVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lr7TOjVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A636D1F000E9;
	Sun, 26 Jul 2026 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096997;
	bh=nrzb6AaKAcQo+7poo9kzODvZ6K2c3M3KSsBcsd3ses8=;
	h=Date:From:To:Cc:Subject;
	b=Lr7TOjVpfac2AOx9xqTJ2wvNKq2AMKn6E2v35WQI+o8gj27AwmD35TveBLjEI3fwT
	 JxvrQm896howHA0uXQSK+vhINFWCk7EKv+fTr3kpcI3UtpMbG9aQzRyIuUm2E79JCn
	 da4FI+t9kD7ZYT7Kzi9oUhghPd+WXLTYPaVJ1WWNnmGHeLiZe4F/JloNnrRvoLOBJi
	 BtAlKpSMgDRYl3SFEb/E9rOGJEOgGpUx+ujCwkmGkZsPAAszeTwA62jtit0xzkoC6c
	 TS/LfWKS1PjHikdqoyXR8Q/flsNTiWxYKAzgeHUgjqlu9BMo4b0jU6Z9k0fj91+gQ8
	 DKtBrUpNsFuhw==
Date: Sun, 26 Jul 2026 21:16:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <amZrITMIlBrnI47Q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VaRGOxspEO0MwK6+"
Content-Disposition: inline


--VaRGOxspEO0MwK6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/bfs/inode.c:180:43: error: no member named 'ino' in 'struct inode'
  180 |         di = find_inode(inode->i_sb, (u16)inode->ino, &bh);
      |                                           ~~~~~  ^
1 error generated.

Caused by commit

  763d78b5dbba6 (bfs: Fix data integrity writeout issues)

I have used the tree from next-20260723 instead.

--VaRGOxspEO0MwK6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmayAACgkQJNaLcl1U
h9Ayqwf/cAhvAiGZ7cWOU+mgA3joTxn1aeE763LmrJ0gywSxiDiT/F1dv9LMQ31b
n0ozwcu+QXG6a04fELjRTBYdbGsmbI/ddA8pSeqyJgjIsKb+2ickhMd03ltFr9DA
YwZcMOoa6rxcZtfxcHaVj0KmrPnIduCkrL9VCFRvwj73dTflVbycdWyAYZtuiv24
3MYdRTnHlTqumGk9seIDU1h8ZpL1ov9vx/P99lD+kD3MNFz50UUPEXoDVrWA9RBj
Y/oyyc7aws+Zrxh0TwCuyymiqpgLXrEFFqIb/lrLHLK9bi1VHfEgxwV0t4eKfLY4
E20qeMse9odLvD8XeKbSHmZUk563eQ==
=DRCu
-----END PGP SIGNATURE-----

--VaRGOxspEO0MwK6+--
