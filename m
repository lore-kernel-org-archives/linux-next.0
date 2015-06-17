From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the rdma tree with the net-next tree
Date: Wed, 17 Jun 2015 13:20:43 +1000
Message-ID: <1434511243.24642.5.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33615 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752453AbbFQDUo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:20:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, Eran Ben Elisha <eranbe@mellanox.com>, Hadar Hen Zion <hadarh@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx4/mad.c

between commit:

  7193a141eb74 "IB/mlx4: Set VF to read from QP counters"

from the net-next tree and commit:

  4cd7c9479aff "IB/mad: Add support for additional MAD info to/from drivers"

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/infiniband/hw/mlx4/mad.c
index bc09b4e1f57c,3e2dee46caa2..000000000000
--- a/drivers/infiniband/hw/mlx4/mad.c
+++ b/drivers/infiniband/hw/mlx4/mad.c
@@@ -817,12 -827,14 +819,12 @@@ static void edit_counter(struct mlx4_co
  }
  
  static int iboe_process_mad(struct ib_device *ibdev, int mad_flags, u8 port_num,
- 			struct ib_wc *in_wc, struct ib_grh *in_grh,
- 			struct ib_mad *in_mad, struct ib_mad *out_mad)
+ 			const struct ib_wc *in_wc, const struct ib_grh *in_grh,
+ 			const struct ib_mad *in_mad, struct ib_mad *out_mad)
  {
 -	struct mlx4_cmd_mailbox *mailbox;
 +	struct mlx4_counter counter_stats;
  	struct mlx4_ib_dev *dev = to_mdev(ibdev);
  	int err;
 -	u32 inmod = dev->counters[port_num - 1] & 0xffff;
 -	u8 mode;
  
  	if (in_mad->mad_hdr.mgmt_class != IB_MGMT_CLASS_PERF_MGMT)
  		return -EINVAL;
@@@ -850,15 -868,21 +852,23 @@@
  }
  
  int mlx4_ib_process_mad(struct ib_device *ibdev, int mad_flags, u8 port_num,
- 			struct ib_wc *in_wc, struct ib_grh *in_grh,
- 			struct ib_mad *in_mad, struct ib_mad *out_mad)
+ 			const struct ib_wc *in_wc, const struct ib_grh *in_grh,
+ 			const struct ib_mad_hdr *in, size_t in_mad_size,
+ 			struct ib_mad_hdr *out, size_t *out_mad_size,
+ 			u16 *out_mad_pkey_index)
  {
 +	struct mlx4_ib_dev *dev = to_mdev(ibdev);
+ 	const struct ib_mad *in_mad = (const struct ib_mad *)in;
+ 	struct ib_mad *out_mad = (struct ib_mad *)out;
+ 
+ 	BUG_ON(in_mad_size != sizeof(*in_mad) ||
+ 	       *out_mad_size != sizeof(*out_mad));
+ 
  	switch (rdma_port_get_link_layer(ibdev, port_num)) {
  	case IB_LINK_LAYER_INFINIBAND:
 -		return ib_process_mad(ibdev, mad_flags, port_num, in_wc,
 -				      in_grh, in_mad, out_mad);
 +		if (!mlx4_is_slave(dev->dev))
 +			return ib_process_mad(ibdev, mad_flags, port_num, in_wc,
 +					      in_grh, in_mad, out_mad);
  	case IB_LINK_LAYER_ETHERNET:
  		return iboe_process_mad(ibdev, mad_flags, port_num, in_wc,
  					  in_grh, in_mad, out_mad);
