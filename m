From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: linux-next: build warning after merge of the bpf-next tree
Date: Sun, 24 Mar 2019 18:39:26 -0400
Message-ID: <CAF=yD-JnqrLrnkF+iqQ6JGhVj-8Z5q=pDRb5aKiVeYoxUaOgAw@mail.gmail.com>
References: <20190325092804.650ebdb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190325092804.650ebdb0@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Willem de Bruijn <willemb@google.com>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Sun, Mar 24, 2019 at 6:30 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the bpf-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> net/core/filter.c: In function 'bpf_skb_adjust_room':
> net/core/filter.c:3022:31: warning: 'inner_trans' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    skb->inner_transport_header = inner_trans;
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> net/core/filter.c:2979:26: note: 'inner_trans' was declared here
>   u16 mac_len, inner_net, inner_trans;
>                           ^~~~~~~~~~~
> net/core/filter.c:3021:29: warning: 'inner_net' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    skb->inner_network_header = inner_net;
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
> net/core/filter.c:2979:15: note: 'inner_net' was declared here
>   u16 mac_len, inner_net, inner_trans;
>                ^~~~~~~~~
> net/core/filter.c:3026:3: warning: 'mac_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    skb_set_network_header(skb, mac_len);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> net/core/filter.c:2979:6: note: 'mac_len' was declared here
>   u16 mac_len, inner_net, inner_trans;
>       ^~~~~~~
>
> Introduced by commit
>
>   868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
>
>
> This looks like a false positive, it seems that they are only set and
> used when encap is true.

Indeed. Sorry about that.

The fix for this is now in bpf-next, commit 62b31b42cff9 ("bpf:
silence uninitialized var warning in bpf_skb_net_grow").
