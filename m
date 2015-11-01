From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the rdma tree
Date: Mon, 2 Nov 2015 00:48:15 +1100
Message-ID: <20151102004815.033fe1c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43074 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752287AbbKANsS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 08:48:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jeff Becker <Jeffrey.C.Becker@nasa.gov>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h

between commit:

  e622f2f4ad21 ("IB: split struct ib_send_wr")

from the rdma tree and commit:

  d0bed03524f3 ("staging/lustre: fix block comment formatting")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
index 993d1ff9ba21,5f78b42b427a..000000000000
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
@@@ -511,30 -490,28 +492,28 @@@ typedef struct kib_r
  
  typedef struct kib_tx                         /* transmit message */
  {
- 	struct list_head       tx_list;       /* queue on idle_txs ibc_tx_queue
- 					       * etc. */
- 	kib_tx_pool_t          *tx_pool;      /* pool I'm from */
- 	struct kib_conn        *tx_conn;      /* owning conn */
- 	short                  tx_sending;    /* # tx callbacks outstanding */
- 	short                  tx_queued;     /* queued for sending */
- 	short                  tx_waiting;    /* waiting for peer */
- 	int                    tx_status;     /* LNET completion status */
- 	unsigned long          tx_deadline;   /* completion deadline */
- 	__u64                  tx_cookie;     /* completion cookie */
- 	lnet_msg_t             *tx_lntmsg[2]; /* lnet msgs to finalize on
- 					       * completion */
- 	kib_msg_t              *tx_msg;       /* message buffer (host vaddr) */
- 	__u64                  tx_msgaddr;    /* message buffer (I/O addr) */
+ 	struct list_head      tx_list; /* queue on idle_txs ibc_tx_queue etc. */
+ 	kib_tx_pool_t         *tx_pool;       /* pool I'm from */
+ 	struct kib_conn       *tx_conn;       /* owning conn */
+ 	short                 tx_sending;     /* # tx callbacks outstanding */
+ 	short                 tx_queued;      /* queued for sending */
+ 	short                 tx_waiting;     /* waiting for peer */
+ 	int                   tx_status;      /* LNET completion status */
+ 	unsigned long         tx_deadline;    /* completion deadline */
+ 	__u64                 tx_cookie;      /* completion cookie */
+ 	lnet_msg_t *tx_lntmsg[2]; /* lnet msgs to finalize on completion */
+ 	kib_msg_t             *tx_msg;        /* message buffer (host vaddr) */
+ 	__u64                 tx_msgaddr;     /* message buffer (I/O addr) */
  	DECLARE_PCI_UNMAP_ADDR(tx_msgunmap);  /* for dma_unmap_single() */
- 	int                    tx_nwrq;       /* # send work items */
- 	struct ib_rdma_wr      *tx_wrq;       /* send work items... */
- 	struct ib_sge          *tx_sge;       /* ...and their memory */
- 	kib_rdma_desc_t        *tx_rd;        /* rdma descriptor */
- 	int                    tx_nfrags;     /* # entries in... */
- 	struct scatterlist     *tx_frags;     /* dma_map_sg descriptor */
- 	__u64                  *tx_pages;     /* rdma phys page addrs */
- 	kib_fmr_t		fmr;	      /* FMR */
- 	int                    tx_dmadir;     /* dma direction */
+ 	int                   tx_nwrq;        /* # send work items */
 -	struct ib_send_wr     *tx_wrq;        /* send work items... */
++	struct ib_rdma_wr     *tx_wrq;        /* send work items... */
+ 	struct ib_sge         *tx_sge;        /* ...and their memory */
+ 	kib_rdma_desc_t       *tx_rd;         /* rdma descriptor */
+ 	int                   tx_nfrags;      /* # entries in... */
+ 	struct scatterlist    *tx_frags;      /* dma_map_sg descriptor */
+ 	__u64                 *tx_pages;      /* rdma phys page addrs */
+ 	kib_fmr_t             fmr;	      /* FMR */
+ 	int                   tx_dmadir;      /* dma direction */
  } kib_tx_t;
  
  typedef struct kib_connvars {
