From: "Guy Levi(SW)" <guyle@mellanox.com>
Subject: RE: linux-next: build failure after merge of the rdma tree
Date: Wed, 5 Dec 2018 12:25:57 +0000
Message-ID: <AM0PR05MB533192C82AA04E89004251A1C7A80@AM0PR05MB5331.eurprd05.prod.outlook.com>
References: <20181204114731.48b18bfc@canb.auug.org.au>
 <20181204015247.GR12288@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204015247.GR12288@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Majd Dibbiny <majd@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

>=20
> Huh. So apparently every compiler that tested this patch (0-day, mine,
> the submitters) optimized this call away because is_atomic_response()
> always returns 0: meaning mlx5_get_atomic_laddr is never callable and
> can be deleted entirely, including the call to mlx5_get_send_wqe.
>=20
> Not sure what compiler setup will hit this, but it is clearly wrong
> code..

Flag -o0  ?


>=20
> Guy/Leon, please send a fixup.. Maybe just delete all this
> handle_atomics stuff?
>=20
> Thanks,
> Jason
