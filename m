From: Eric Dumazet <edumazet@google.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 17 Dec 2018 02:12:47 -0800
Message-ID: <CANn89iJAED9AxeX6BjwvEo204-rHOr0QFFk6v7r3nCHb3_0OYA@mail.gmail.com>
References: <20181217113106.32d98f30@canb.auug.org.au> <20181217100314.GA12765@splinter>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181217100314.GA12765@splinter>
Sender: netdev-owner@vger.kernel.org
To: Ido Schimmel <idosch@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 17, 2018 at 2:03 AM Ido Schimmel <idosch@mellanox.com> wrote:
>
> On Mon, Dec 17, 2018 at 11:31:06AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the net-next tree got a conflict in:
> >
> >   net/ipv6/ip6_output.c
> >
> > between commit:
> >
> >   8203e2d844d3 ("net: clear skb->tstamp in forwarding paths")
> >
> > from the net tree and commit:
> >
> >   f839a6c92504 ("net: Do not route unicast IP packets twice")
> >
> > from the net-next tree.
> >
> > I fixed it up (I was not quite sure of the correct ordering - see below)
> > and can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
>
> Looks good to me. Eric?
>
> Thank you!


Yes, SGTM,  thanks.
