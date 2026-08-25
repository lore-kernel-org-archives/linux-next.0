Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707A481A8B;
	Tue, 25 Aug 2026 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664922; cv=none; b=fH9QdT7MxfqITnRmoZOmoYWly/9QLgYSgKDCdqQRsGmw9qyHeKDv1rWZhNOaG9G7cDJ7tKJWrzZOg8WLOXXkpWEEQ0m9LJ8W95FpZ8z0+DMkjw1zYdFQrpgzRhXTpR0Xw8l88IduLF5Ns+YFB8v2mJg/utb8HhcWD93PXLyLiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664922; c=relaxed/simple;
	bh=Zz/X/sBZLD2VRTwqvQvD5PBE8gasTvVgkR0Oq2Jk1tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7kfZGH90A4d3Or8oQZx4HZbfiSwlMkrs1He7mOIeJKTVgaFVbeayqz0AiYKD7Ksqwt7dtqsqSInHb1rnfVkp7esOmt+xdlEmhrRkAjVbuO6naszo7+uOJyN1a495IPVmVAB0fLXdOEweHflbsl7xDmc5X9tCmgq5tVXmxv1zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjVBj8wR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjVBj8wR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E9D1F00A3A;
	Tue, 25 Aug 2026 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664920;
	bh=6tykn1cS5xSApR4WT08R9CpkGww+NSHQKiq1ZsE3TyY=;
	h=Date:From:To:Cc:Subject;
	b=kjVBj8wRPT3H3hfjQWgophp9mTp183/0gBNs1E14bdRgACIaHHbu2OkxlcErlrsmT
	 RH+fWun+8s8LaxEhq0cLdaglT2gw2lhbf0D5pqqEBHhYUtDWtLFnNC5zovn3V0xL6v
	 gVXsWy/fjHFCxaMufAXsP/sApBEMI4AHKvKutlo8aD39POQjfkrUntNgqM3fWN06Yn
	 ISYps7EbXYW9+Kc4qiDaAIna1Qd2bmUXXI2CWWxAqesy/O+KMzEcvkfuvIYQP1bFb8
	 lCSpErTA4jajCrxldXwG4lqbs/uT9w3Skhf0OV7IGRZevB6b47ZnZH6rwIxqetF8sG
	 S8Z1e9WcEqFpQ==
Date: Tue, 25 Aug 2026 14:35:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pagemap-headers tree
Message-ID: <ao2aFX-4nXH8x-7Y@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BC86nfnpKxEvOija"
Content-Disposition: inline


--BC86nfnpKxEvOija
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pagemap-headers tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

/tmp/next/build/drivers/dma/ste_dma40.c:492:42: error: field 'tasklet' has incomplete type
  492 |         struct tasklet_struct            tasklet;
      |                                          ^~~~~~~
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'dma_tc_handle':
/tmp/next/build/drivers/dma/ste_dma40.c:1590:9: error: implicit declaration of function 'tasklet_schedule' [-Wimplicit-function-declaration]
 1590 |         tasklet_schedule(&d40c->tasklet);
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'dma_tasklet':
/tmp/next/build/drivers/dma/ste_dma40.c:1596:33: error: implicit declaration of function 'from_tasklet'; did you mean 'dma_tasklet'? [-Wimplicit-function-declaration]
 1596 |         struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
      |                                 ^~~~~~~~~~~~
      |                                 dma_tasklet
/tmp/next/build/drivers/dma/ste_dma40.c:1596:55: error: 'tasklet' undeclared (first use in this function)
 1596 |         struct d40_chan *d40c = from_tasklet(d40c, t, tasklet);
      |                                                       ^~~~~~~
/tmp/next/build/drivers/dma/ste_dma40.c:1596:55: note: each undeclared identifier is reported only once for each function it appears in
/tmp/next/build/drivers/dma/ste_dma40.c: At top level:
/tmp/next/build/drivers/dma/ste_dma40.c:1659:8: error: unknown type name 'irqreturn_t'
 1659 | static irqreturn_t d40_handle_interrupt(int irq, void *data)
      |        ^~~~~~~~~~~
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'd40_handle_interrupt':
/tmp/next/build/drivers/dma/ste_dma40.c:1718:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
 1718 |         return IRQ_HANDLED;
      |                ^~~~~~~~~~~
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'd40_chan_init':
/tmp/next/build/drivers/dma/ste_dma40.c:2818:17: error: implicit declaration of function 'tasklet_setup'; did you mean 'timer_setup'? [-Wimplicit-function-declaration]
 2818 |                 tasklet_setup(&d40c->tasklet, dma_tasklet);
      |                 ^~~~~~~~~~~~~
      |                 timer_setup
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'd40_probe':
/tmp/next/build/drivers/dma/ste_dma40.c:3588:15: error: implicit declaration of function 'request_irq'; did you mean 'request_key'? [-Wimplicit-function-declaration]
 3588 |         ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
      |               ^~~~~~~~~~~
      |               request_key
/tmp/next/build/drivers/dma/ste_dma40.c: In function 'd40_handle_interrupt':
/tmp/next/build/drivers/dma/ste_dma40.c:1719:1: error: control reaches end of non-void function [-Werror=return-type]
 1719 | }
      | ^

Doubtless caused by the pagemap-headers tree.  I will not merge the tree
today.

--BC86nfnpKxEvOija
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNmhQACgkQJNaLcl1U
h9Anzgf+LF6IYQCyem+3bDWWw4UAQaV6nBwfe5t9iMZEFU8+oDU7p7wBmY0tQnFC
nHuOMIDFECpQsgtRsrF7j6ohni2Tu8TmMlw0thbMbjBguq6rorpXgCtf/qlOy1TL
7394EjrYZj98G5V3m8Z92fNJSDh9pQPxbduKsONrtKbtmp9YO1QB01+Hh+VRHAhB
jjeFu80Ke6pKVehK3bC0k1mfMCookT7i63/RcH4EOw7bZGKIHiN7a7KpCBQ/k5rh
U8V2FXOerUnehQSQcXAdBAnX64IqEm3v/URQGNil/HY/LbNo7xrqEjClUVum3VJC
8pZe6wscAgkaYe8kTaC7iL8Ndw35GA==
=J7Nt
-----END PGP SIGNATURE-----

--BC86nfnpKxEvOija--
