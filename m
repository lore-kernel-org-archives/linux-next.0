From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the rdma tree
Date: Mon, 15 Jun 2015 21:48:51 -0700
Message-ID: <20150616044851.GA24536@kroah.com>
References: <1434355931.19706.5.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44056 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750873AbbFPEsx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 00:48:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 02CC320878
	for <linux-next@vger.kernel.org>; Tue, 16 Jun 2015 00:48:52 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1434355931.19706.5.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Mike Shuey <shuey@purdue.edu>

On Mon, Jun 15, 2015 at 06:12:11PM +1000, Michael Ellerman wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c between commit 8e37210b38fb
> "IB/core: Change ib_create_cq to use struct ib_cq_init_attr" from the rdma tree
> and commit ec3d17c0ed2e "staging: lustre: lnet: o2iblnd: code cleanup - align
> whitespace" from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> cheers
> 
> 
> diff --cc drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> index c41b5575df05,48454a576b7a..000000000000
> --- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> +++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> @@@ -642,18 -643,17 +643,18 @@@ kib_conn_t *kiblnd_create_conn(kib_peer
>   	 * she must dispose of 'cmid'.  (Actually I'd block forever if I tried
>   	 * to destroy 'cmid' here since I'm called from the CM which still has
>   	 * its ref on 'cmid'). */
> - 	rwlock_t		*glock = &kiblnd_data.kib_global_lock;
> - 	kib_net_t	      *net = peer->ibp_ni->ni_data;
> - 	kib_dev_t	      *dev;
> + 	rwlock_t *glock = &kiblnd_data.kib_global_lock;
> + 	kib_net_t *net = peer->ibp_ni->ni_data;
> + 	kib_dev_t *dev;
>   	struct ib_qp_init_attr *init_qp_attr;
> - 	struct kib_sched_info	*sched;
> - 	struct ib_cq_init_attr  cq_attr = {};
> - 	kib_conn_t		*conn;
> - 	struct ib_cq		*cq;
> - 	unsigned long		flags;
> - 	int			cpt;
> - 	int			rc;
> - 	int			i;
> + 	struct kib_sched_info *sched;
> ++	struct ib_cq_init_attr cq_attr = {};
> + 	kib_conn_t *conn;
> + 	struct ib_cq *cq;
> + 	unsigned long flags;
> + 	int cpt;
> + 	int rc;
> + 	int i;

Looks good to me, thanks.

greg k-h
