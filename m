From: Petr Machata <petrm@mellanox.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Thu, 20 Dec 2018 10:43:00 +0000
Message-ID: <wihpntw4h2d.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20181220132824.341c10e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181220132824.341c10e9@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 20 Dec 2018 13:28:24 +1100")
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/net/vxlan.c: In function 'vxlan_changelink':
> drivers/net/vxlan.c:3763:10: error: too few arguments to function 'vxlan_=
fdb_update'
>     err =3D vxlan_fdb_update(vxlan, all_zeros_mac,
>           ^~~~~~~~~~~~~~~~
> drivers/net/vxlan.c:830:12: note: declared here
>  static int vxlan_fdb_update(struct vxlan_dev *vxlan,
>             ^~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   ce5e098f7a10 ("vxlan: changelink: Fix handling of default remotes")
>
> from the net tree interacting with commit
>
>   0e6160f3f5a9 ("vxlan: vxlan_fdb_notify(): Make switchdev notification c=
onfigurable")
>
> from the net-next tree.
>
> I added the following merge fix patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 20 Dec 2018 13:24:05 +1100
> Subject: [PATCH] vxlan: fix for vxlan_fdb_update() API change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/vxlan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/vxlan.c b/drivers/net/vxlan.c
> index efd709a5e3a8..5209ee9aac47 100644
> --- a/drivers/net/vxlan.c
> +++ b/drivers/net/vxlan.c
> @@ -3768,7 +3768,7 @@ static int vxlan_changelink(struct net_device *dev,=
 struct nlattr *tb[],
>  					       dst->remote_vni,
>  					       dst->remote_vni,
>  					       dst->remote_ifindex,
> -					       NTF_SELF);
> +					       NTF_SELF, true);
>  			if (err) {
>  				spin_unlock_bh(&vxlan->hash_lock);
>  				return err;
> --=20
> 2.19.1

Yes, that's the correct fix.

Thanks!
