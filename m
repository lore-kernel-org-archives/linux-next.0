From: Jason Baron <jbaron@redhat.com>
Subject: Re: linux-next: Tree for October 20
Date: Mon, 20 Oct 2008 13:35:45 -0400
Message-ID: <20081020173545.GB3161@redhat.com>
References: <20081020235904.2f9a8db4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:60928 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752837AbYJTRgv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 13:36:51 -0400
Content-Disposition: inline
In-Reply-To: <20081020235904.2f9a8db4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 20, 2008 at 11:59:04PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's tree will not build for powerpc allyesconfig (libc aborts the
> link due to a free() problem), sparc(32) defconfig and probably some
> other configurations.
> 

hmmm...yeah, on x86_64 i've hit:

  CC [M]  net/9p/protocol.o
  LD [M]  net/9p/9pnet.o
  LD [M]  net/9p/9pnet_virtio.o
  Building modules, stage 2.
  MODPOST 1616 modules
ERROR: "p9_debug_level" [net/9p/9pnet.ko] undefined!


seems to be resolved by this simple patch:


Signed-off-by: Jason Baron <jbaron@redhat.com>


diff --git a/net/9p/protocol.c b/net/9p/protocol.c
index 29be524..ebf819e 100644
--- a/net/9p/protocol.c
+++ b/net/9p/protocol.c
@@ -542,8 +542,10 @@ int p9pdu_finalize(struct p9_fcall *pdu)
 	err = p9pdu_writef(pdu, 0, "d", size);
 	pdu->size = size;
 
+#ifdef CONFIG_NET_9P_DEBUG
 	if ((p9_debug_level & P9_DEBUG_PKT) == P9_DEBUG_PKT)
 		p9pdu_dump(0, pdu);
+#endif
 
 	P9_DPRINTK(P9_DEBUG_9P, ">>> size=%d type: %d tag: %d\n", pdu->size,
 							pdu->id, pdu->tag);
