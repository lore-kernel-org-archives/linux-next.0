From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 11 Dec 2018 00:52:17 +0900
Message-ID: <CAK7LNAQXEq3xaaZLKeJiSRAvM30vQGZyTbnj=BjXZMsMzyo02Q@mail.gmail.com>
References: <20181204114731.48b18bfc@canb.auug.org.au> <20181204015247.GR12288@mellanox.com>
 <AM0PR05MB533192C82AA04E89004251A1C7A80@AM0PR05MB5331.eurprd05.prod.outlook.com>
 <20181206095815.6e814057@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206095815.6e814057@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: guyle@mellanox.com, Jason Gunthorpe <jgg@mellanox.com>, dledford@redhat.com, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, majd@mellanox.com, Leon Romanovsky <leonro@mellanox.com>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 6, 2018 at 7:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Guy,
>
> On Wed, 5 Dec 2018 12:25:57 +0000 "Guy Levi(SW)" <guyle@mellanox.com> wrote:
> >
> > >
> > > Huh. So apparently every compiler that tested this patch (0-day, mine,
> > > the submitters) optimized this call away because is_atomic_response()
> > > always returns 0: meaning mlx5_get_atomic_laddr is never callable and
> > > can be deleted entirely, including the call to mlx5_get_send_wqe.
> > >
> > > Not sure what compiler setup will hit this, but it is clearly wrong
> > > code..
> >
> > Flag -o0  ?
>
> No, but the kbuild tree contains a change that allows turning off of
> gcc's autoinlining and the CONFIG option guarding that gets turned on
> for allmodconfig builds among others.
>
> Masahiro, should CONFIG_NO_AUTO_INLINE maybe need to be off unless
> explicitly enabled (like CONFIG_DEBUG_INFO and others)?


No.

If CONFIG_NO_AUTO_INLINE is turned off for compile-testing,
people will not even notice a breakage,
then the code will get broken here and there.

You will not be able to enable it
when you really want to use it.





In this case, the reason is obvious.

If you expect the compiler to optimize the code out,
you must use 'static inline' instead of 'static'.


static int is_atomic_response(struct mlx5_ib_qp *qp, uint16_t idx)
{
       /* TBD: waiting decision
        */
       return 0;
}





-- 
Best Regards
Masahiro Yamada
