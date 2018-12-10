From: Changbin Du <changbin.du@gmail.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Mon, 10 Dec 2018 00:43:50 +0000
Message-ID: <20181210004349.ba2ujbontjaw4pdx@mail.google.com>
References: <20181204114731.48b18bfc@canb.auug.org.au>
 <20181204015247.GR12288@mellanox.com>
 <AM0PR05MB533192C82AA04E89004251A1C7A80@AM0PR05MB5331.eurprd05.prod.outlook.com>
 <20181206095815.6e814057@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206095815.6e814057@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Guy Levi(SW)" <guyle@mellanox.com>, Jason Gunthorpe <jgg@mellanox.com>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Majd Dibbiny <majd@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 06, 2018 at 09:58:15AM +1100, Stephen Rothwell wrote:
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
Let me turn it off to pass allmodconfig build. it is a pure debug
option.

> Masahiro, should CONFIG_NO_AUTO_INLINE maybe need to be off unless
> explicitly enabled (like CONFIG_DEBUG_INFO and others)?
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Thanks,
Changbin Du
