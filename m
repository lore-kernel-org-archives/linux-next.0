From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: async_tx tree build failure
Date: Wed, 22 Jul 2009 21:33:40 -0700
Message-ID: <1248323620.24951.2.camel@dwillia2-linux.ch.intel.com>
References: <20090723120004.fac867eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:45884 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751040AbZGWEdl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2009 00:33:41 -0400
In-Reply-To: <20090723120004.fac867eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 2009-07-22 at 19:00 -0700, Stephen Rothwell wrote:
> Hi Dan,
>=20
> Since next-20090623, the linux-next build (i386 allmodconfig) has fai=
led
> like this:
>=20
> crypto/async_tx/async_xor.c: In function =E2=80=98async_xor_init=E2=80=
=99:
> crypto/async_tx/async_xor.c:310: error: size of array =E2=80=98type n=
ame=E2=80=99 is negative
>=20
> The failing line is this:
>=20
> 	BUILD_BUG_ON(sizeof(dma_addr_t) > sizeof(struct page *));
>=20
> in async_xor_init() introduced by commit
> 0036731c88fdb5bf4f04a796a30b5e445fc57f54 ("async_tx: kill tx_set_src =
and
> tx_set_dest methods") in Feb, 2008.
>=20
> Bisecting in the next-20090623 tree pointed to commit
> 3c30a9ca1fb95214e60e3bf43957971df6668033 ("dmaengine: move HIGHMEM64G
> restriction to ASYNC_TX_DMA") from the async_tx tree.  This is now co=
mmit
> f3c56e57f66a73a241299dbec1ad55491aa0e403.

Gah, yes that commit was half baked.  I have pushed out an updated tree
with the following fix:

diff --git a/crypto/async_tx/async_xor.c b/crypto/async_tx/async_xor.c
index 95fe2c8..90dd3f8 100644
--- a/crypto/async_tx/async_xor.c
+++ b/crypto/async_tx/async_xor.c
@@ -300,7 +300,7 @@ EXPORT_SYMBOL_GPL(async_xor_zero_sum);
=20
 static int __init async_xor_init(void)
 {
-	#ifdef CONFIG_DMA_ENGINE
+	#ifdef CONFIG_ASYNC_TX_DMA
 	/* To conserve stack space the input src_list (array of page pointers=
)
 	 * is reused to hold the array of dma addresses passed to the driver.
 	 * This conversion is only possible when dma_addr_t is less than the

Thanks,
Dan
