From: Daniel Jurgens <danielj@mellanox.com>
Subject: Re: linux-next: manual merge of the selinux tree with Linus' tree
Date: Mon, 22 May 2017 21:13:03 +0000
Message-ID: <VI1PR05MB1678C5BAA8C3566AE7B022F6C4F80@VI1PR05MB1678.eurprd05.prod.outlook.com>
References: <20170522123825.14d0a033@canb.auug.org.au>
 <CAHC9VhQ1y1x3AarvfJYF0eMsJjqL3ofzixCxJyHs_xrr-P9s4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-he1eur01on0087.outbound.protection.outlook.com ([104.47.0.87]:19989
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935790AbdEVVNH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 17:13:07 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>, Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On 5/22/2017 4:08 PM, Paul Moore wrote:=0A=
> On Sun, May 21, 2017 at 10:38 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:=0A=
>> Hi Paul,=0A=
>>=0A=
>> Today's linux-next merge of the selinux tree got a conflict in:=0A=
>>=0A=
>>   include/rdma/ib_verbs.h=0A=
>>=0A=
>> between commit:=0A=
>>=0A=
>>   2fc775726491 ("IB/opa-vnic: RDMA NETDEV interface")=0A=
>>=0A=
>> from Linus' tree and commit:=0A=
>>=0A=
>>   89b54b4d09bd ("IB/core: Enforce PKey security on QPs")=0A=
>>=0A=
>> from the selinux tree.=0A=
>>=0A=
>> I fixed it up (see below) and can carry the fix as necessary. This=0A=
>> is now fixed as far as linux-next is concerned, but any non trivial=0A=
>> conflicts should be mentioned to your upstream maintainer when your tree=
=0A=
>> is submitted for merging.  You may also want to consider cooperating=0A=
>> with the maintainer of the conflicting tree to minimise any particularly=
=0A=
>> complex conflicts.=0A=
> Thanks Stephen.=0A=
>=0A=
> Daniel and Doug, does Stephen's patch look right to you?=0A=
=0A=
Looks good to me.=0A=
=0A=
>=0A=
>> diff --cc include/rdma/ib_verbs.h=0A=
>> index ba8314ec5768,c9e903fc824b..000000000000=0A=
>> --- a/include/rdma/ib_verbs.h=0A=
>> +++ b/include/rdma/ib_verbs.h=0A=
>> @@@ -1890,7 -1878,10 +1930,8 @@@ enum ib_mad_result=0A=
>>         IB_MAD_RESULT_CONSUMED =3D 1 << 2  /* Packet consumed: stop proc=
essing */=0A=
>>   };=0A=
>>=0A=
>>  -#define IB_DEVICE_NAME_MAX 64=0A=
>>  -=0A=
>>   struct ib_port_cache {=0A=
>> +       u64                   subnet_prefix;=0A=
>>         struct ib_pkey_cache  *pkey;=0A=
>>         struct ib_gid_table   *gid;=0A=
>>         u8                     lmc;=0A=
>> @@@ -1912,34 -1903,12 +1953,40 @@@ struct ib_port_immutable=0A=
>>         u32                           max_mad_size;=0A=
>>   };=0A=
>>=0A=
>>  +/* rdma netdev type - specifies protocol type */=0A=
>>  +enum rdma_netdev_t {=0A=
>>  +      RDMA_NETDEV_OPA_VNIC,=0A=
>>  +      RDMA_NETDEV_IPOIB,=0A=
>>  +};=0A=
>>  +=0A=
>>  +/**=0A=
>>  + * struct rdma_netdev - rdma netdev=0A=
>>  + * For cases where netstack interfacing is required.=0A=
>>  + */=0A=
>>  +struct rdma_netdev {=0A=
>>  +      void              *clnt_priv;=0A=
>>  +      struct ib_device  *hca;=0A=
>>  +      u8                 port_num;=0A=
>>  +=0A=
>>  +      /* control functions */=0A=
>>  +      void (*set_id)(struct net_device *netdev, int id);=0A=
>>  +      /* send packet */=0A=
>>  +      int (*send)(struct net_device *dev, struct sk_buff *skb,=0A=
>>  +                  struct ib_ah *address, u32 dqpn);=0A=
>>  +      /* multicast */=0A=
>>  +      int (*attach_mcast)(struct net_device *dev, struct ib_device *hc=
a,=0A=
>>  +                          union ib_gid *gid, u16 mlid,=0A=
>>  +                          int set_qkey, u32 qkey);=0A=
>>  +      int (*detach_mcast)(struct net_device *dev, struct ib_device *hc=
a,=0A=
>>  +                          union ib_gid *gid, u16 mlid);=0A=
>>  +};=0A=
>>  +=0A=
>> + struct ib_port_pkey_list {=0A=
>> +       /* Lock to hold while modifying the list. */=0A=
>> +       spinlock_t                    list_lock;=0A=
>> +       struct list_head              pkey_list;=0A=
>> + };=0A=
>> +=0A=
>>   struct ib_device {=0A=
>>         /* Do not access @dma_device directly from ULP nor from HW drive=
rs. */=0A=
>>         struct device                *dma_device;=0A=
>=0A=
>=0A=
=0A=
