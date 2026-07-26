Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785337BE78;
	Sun, 26 Jul 2026 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785105765; cv=none; b=RhU5bshc+5AAsu6dbz77w/bQeqT8rvRKLWj02NnwrdlUot/XBx+SxDq+YNlL/29vacdyyS+L1urtyH0MBO3muKiUGAucM4yQ6KASYdhRzTPUSc8vugrDWDg/9m7c83jZQDiQuqEqsIe7nxPKH7eh6Xl8vR+q6yadjumAijcdDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785105765; c=relaxed/simple;
	bh=8O+XO97p4Bw1TKEn6kvcf4prWXisXvlEZQn/lBS4OUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MM6sf40ui16yYcfPE2B8VOofJ7ku8AqFxDMSwoalO86jqTEFYTv5HzgDI0sf6a/VsVeAOTIGoBGaCdD7EVFxYzQrq0jsVAexgCt2DfRaKXYabog6Zrt6U3DwSiNRLJZoNgytDkCF/fHqP2ih00aDliUdaS7iqnOw3adYAwzfEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vcc4NAwX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vcc4NAwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07851F000E9;
	Sun, 26 Jul 2026 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785105763;
	bh=talowVEQBqThp+BUVw//lS6JE+ef2XwcS7But1pFWb4=;
	h=Date:From:To:Cc:Subject;
	b=Vcc4NAwX32vEceWlldGZ2kC+zmuIld0qO0YVIoImIavXz49A1x280qFnmQM4UV3MR
	 OqGE++xLrIu70FapDnh8wnvaLoukaGG7pQoqsSfWjf36guwr/vHRaRJaMXmB3M6NBA
	 SgKiDt49Yp/DHrB2/agWEBF2qmgIV+7DKgCG5bTQugu8A17GejhNFSPBREmrHHklb9
	 mgKVv9moXZ76Xp9JXFtEPzubxYfVswjuJKdY27v4ppTX1rT1uPNxib02RTu6PVlNiK
	 gsrkGASNYWQIVY9Ae4bUItvsOzvItfrap9e0jMOj3b7oEZH2FNwPUn+MmTCtZtrdP0
	 g3strH34svOoA==
Date: Sun, 26 Jul 2026 23:42:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fastrpc tree
Message-ID: <amaNYEchEvJAcnQT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdUtbq+1zlL79nUH"
Content-Disposition: inline


--xdUtbq+1zlL79nUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the fastrpc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/misc/fastrpc.c:599:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  599 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
      |                                    ^
/tmp/next/build/drivers/misc/fastrpc.c:737:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  737 |         ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret) |
      |                      ^
/tmp/next/build/drivers/misc/fastrpc.c:2711:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 2711 |         ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
      |                 ^
/tmp/next/build/drivers/misc/fastrpc.c:2735:4: error: format specifies type 'unsigned long long' but the argument has type 'int' [-Werror,-Wformat]
 2733 |                         "Stale glink response ctx 0x%llx (expected seq 0x%llx), dropping\n",
      |                                                                          ~~~~
      |                                                                          %x
 2734 |                         rsp->ctx,
 2735 |                         FIELD_GET(FASTRPC_CTXID_SEQ_MASK, ctx->ctxid));
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
  165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                      ~~~     ^~~~~~~~~~~
/tmp/next/build/include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
  285 |                            dev, fmt, ##__VA_ARGS__)
      |                                 ~~~    ^~~~~~~~~~~
/tmp/next/build/include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
  261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
      |                                                                  ^~~~~~~~~~~
/tmp/next/build/include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
  259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
      |                                                                        ^~~~~~~~~~~
/tmp/next/build/include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
  231 |                 func(&id, ##__VA_ARGS__);                       \
      |                             ^~~~~~~~~~~
4 errors generated.


Caused by commit

  10555ba6126ed (misc: fastrpc: Replace hardcoded ctxid mask with GENMASK)

(and one of the subsequent ones that also uses those macros).  I have
use the tree from next-20260723 instead.

--xdUtbq+1zlL79nUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmjV8ACgkQJNaLcl1U
h9BdhQgAhenC/0MtU9yPOCuGcIy/sr8ebJ59z+GTrtpU5p5aGXDnzLZaHKQDuGPd
x23yf3tKwbRgPOe60amQywolf+zQqUcBAHF6ychyghY41gBN1XbXkZzsXVVhqDcl
uD0Xtbmwamei2wkOR+PFl39vwzkeyzZ1AJNG3bvRZtzAYyPlUeRHXRXhVKTepd/o
H2rfekQNnqFCKdCurWS+OrJYrVANo9iMq8680XLwRosmnc6PxXjQgKrmQ/tqXCJ6
bvdLeVj3P6cH3aOztmT2af0tRz6uXOc9UPMHW6kk2Ixub/9GOpdyEZmEsTEyR9ep
0ln1PqAGEk5bMhoo2hUCxQNnHaXeLA==
=fWOZ
-----END PGP SIGNATURE-----

--xdUtbq+1zlL79nUH--
