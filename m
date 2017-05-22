From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with Linus' tree
Date: Mon, 22 May 2017 17:08:54 -0400
Message-ID: <CAHC9VhQ1y1x3AarvfJYF0eMsJjqL3ofzixCxJyHs_xrr-P9s4w@mail.gmail.com>
References: <20170522123825.14d0a033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36546 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933017AbdEVVI4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 May 2017 17:08:56 -0400
Received: by mail-lf0-f49.google.com with SMTP id h4so38101937lfj.3
        for <linux-next@vger.kernel.org>; Mon, 22 May 2017 14:08:56 -0700 (PDT)
In-Reply-To: <20170522123825.14d0a033@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Jurgens <danielj@mellanox.com>, Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, May 21, 2017 at 10:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   include/rdma/ib_verbs.h
>
> between commit:
>
>   2fc775726491 ("IB/opa-vnic: RDMA NETDEV interface")
>
> from Linus' tree and commit:
>
>   89b54b4d09bd ("IB/core: Enforce PKey security on QPs")
>
> from the selinux tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen.

Daniel and Doug, does Stephen's patch look right to you?

> diff --cc include/rdma/ib_verbs.h
> index ba8314ec5768,c9e903fc824b..000000000000
> --- a/include/rdma/ib_verbs.h
> +++ b/include/rdma/ib_verbs.h
> @@@ -1890,7 -1878,10 +1930,8 @@@ enum ib_mad_result
>         IB_MAD_RESULT_CONSUMED = 1 << 2  /* Packet consumed: stop processing */
>   };
>
>  -#define IB_DEVICE_NAME_MAX 64
>  -
>   struct ib_port_cache {
> +       u64                   subnet_prefix;
>         struct ib_pkey_cache  *pkey;
>         struct ib_gid_table   *gid;
>         u8                     lmc;
> @@@ -1912,34 -1903,12 +1953,40 @@@ struct ib_port_immutable
>         u32                           max_mad_size;
>   };
>
>  +/* rdma netdev type - specifies protocol type */
>  +enum rdma_netdev_t {
>  +      RDMA_NETDEV_OPA_VNIC,
>  +      RDMA_NETDEV_IPOIB,
>  +};
>  +
>  +/**
>  + * struct rdma_netdev - rdma netdev
>  + * For cases where netstack interfacing is required.
>  + */
>  +struct rdma_netdev {
>  +      void              *clnt_priv;
>  +      struct ib_device  *hca;
>  +      u8                 port_num;
>  +
>  +      /* control functions */
>  +      void (*set_id)(struct net_device *netdev, int id);
>  +      /* send packet */
>  +      int (*send)(struct net_device *dev, struct sk_buff *skb,
>  +                  struct ib_ah *address, u32 dqpn);
>  +      /* multicast */
>  +      int (*attach_mcast)(struct net_device *dev, struct ib_device *hca,
>  +                          union ib_gid *gid, u16 mlid,
>  +                          int set_qkey, u32 qkey);
>  +      int (*detach_mcast)(struct net_device *dev, struct ib_device *hca,
>  +                          union ib_gid *gid, u16 mlid);
>  +};
>  +
> + struct ib_port_pkey_list {
> +       /* Lock to hold while modifying the list. */
> +       spinlock_t                    list_lock;
> +       struct list_head              pkey_list;
> + };
> +
>   struct ib_device {
>         /* Do not access @dma_device directly from ULP nor from HW drivers. */
>         struct device                *dma_device;



-- 
paul moore
www.paul-moore.com
