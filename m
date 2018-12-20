From: Petr Machata <petrm@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Dec 2018 10:38:33 +0000
Message-ID: <wihwoo44h5v.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20181220125635.76ae89ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181220125635.76ae89ad@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 20 Dec 2018 12:56:35 +1100")
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> diff --cc drivers/net/vxlan.c
> index 0565f8880199,71c3b7b6b1ab..000000000000
> --- a/drivers/net/vxlan.c
> +++ b/drivers/net/vxlan.c
> @@@ -3297,16 -3483,9 +3484,16 @@@ static int __vxlan_dev_create(struct ne
>  =20
>   	list_add(&vxlan->next, &vn->vxlan_list);
>   	return 0;
>  +
>   errout:
>  +	/* unregister_netdevice() destroys the default FDB entry with deletion
>  +	 * notification. But the addition notification was not sent yet, so
>  +	 * destroy the entry by hand here.
>  +	 */
>   	if (f)
> - 		vxlan_fdb_destroy(vxlan, f, false);
> + 		vxlan_fdb_destroy(vxlan, f, false, false);
>  +	if (unregister)
>  +		unregister_netdevice(dev);
>   	return err;
>   }
>  =20
> @@@ -3540,8 -3719,10 +3727,9 @@@ static int vxlan_changelink(struct net_
>   {
>   	struct vxlan_dev *vxlan =3D netdev_priv(dev);
>   	struct vxlan_rdst *dst =3D &vxlan->default_dst;
> + 	unsigned long old_age_interval;
>   	struct vxlan_rdst old_dst;
>   	struct vxlan_config conf;
>  -	struct vxlan_fdb *f =3D NULL;
>   	int err;
>  =20
>   	err =3D vxlan_nl2conf(tb, data,
> @@@ -3564,13 -3749,13 +3756,14 @@@
>   					   vxlan->cfg.dst_port,
>   					   old_dst.remote_vni,
>   					   old_dst.remote_vni,
> - 					   old_dst.remote_ifindex, 0);
> + 					   old_dst.remote_ifindex,
> + 					   true);
>  =20
>   		if (!vxlan_addr_any(&dst->remote_ip)) {
>  -			err =3D vxlan_fdb_create(vxlan, all_zeros_mac,
>  +			err =3D vxlan_fdb_update(vxlan, all_zeros_mac,
>   					       &dst->remote_ip,
>   					       NUD_REACHABLE | NUD_PERMANENT,
>  +					       NLM_F_APPEND | NLM_F_CREATE,
>   					       vxlan->cfg.dst_port,
>   					       dst->remote_vni,
>   					       dst->remote_vni,

The above looks correct, but the last hunk has one non-conflicting line
that nonetheless needs fixing up:

diff --git a/drivers/net/vxlan.c b/drivers/net/vxlan.c
index efd709a5e3a8..5209ee9aac47 100644
--- a/drivers/net/vxlan.c
+++ b/drivers/net/vxlan.c
@@ -3768,7 +3768,7 @@ static int vxlan_changelink(struct net_device *dev, s=
truct nlattr *tb[],
                                               dst->remote_vni,
                                               dst->remote_vni,
                                               dst->remote_ifindex,
-                                              NTF_SELF);
+                                              NTF_SELF, true);
                        if (err) {
                                spin_unlock_bh(&vxlan->hash_lock);
                                return err;

Thanks!
