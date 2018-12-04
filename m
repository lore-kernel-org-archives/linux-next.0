From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 4 Dec 2018 01:52:54 +0000
Message-ID: <20181204015247.GR12288@mellanox.com>
References: <20181204114731.48b18bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204114731.48b18bfc@canb.auug.org.au>
Content-Language: en-US
Content-ID: <3C9D767E85910C4FAE523A23D712CC7D@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Guy Levi(SW)" <guyle@mellanox.com>, Majd Dibbiny <majd@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 04, 2018 at 11:47:31AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: "mlx5_get_send_wqe" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefi=
ned!
>=20
> Caused by commit
>=20
>   34f4c9554d8b ("IB/mlx5: Use fragmented QP's buffer for in-kernel users"=
)
>=20
> mlx5_get_send_wqe() is still used in drivers/infiniband/hw/mlx5/cq.c
> and declared in drivers/infiniband/hw/mlx5/mlx5_ib.h ...
>=20
> I have used the version of the rdma tree from next-20181203 for today.

Huh. So apparently every compiler that tested this patch (0-day, mine,
the submitters) optimized this call away because is_atomic_response()
always returns 0: meaning mlx5_get_atomic_laddr is never callable and
can be deleted entirely, including the call to mlx5_get_send_wqe.

Not sure what compiler setup will hit this, but it is clearly wrong
code..

Guy/Leon, please send a fixup.. Maybe just delete all this
handle_atomics stuff?

Thanks,
Jason
