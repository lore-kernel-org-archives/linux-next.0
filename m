From: John Hurley <john.hurley@netronome.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 16 Apr 2019 11:03:21 +0100
Message-ID: <CAK+XE=m+0NMxbRSTa05n0wJU3EuF=oVwA9aCirs2Dq3AcO7bjw@mail.gmail.com>
References: <20190416112039.25136d0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416112039.25136d0b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Simon Horman <simon.horman@netronome.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 16, 2019 at 2:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/net/ethernet/netronome/nfp/flower/offload.c: In function 'nfp_flower_copy_pre_actions':
> drivers/net/ethernet/netronome/nfp/flower/offload.c:630:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     if (tunnel_act)
>        ^
> drivers/net/ethernet/netronome/nfp/flower/offload.c:632:3: note: here
>    case NFP_FL_ACTION_OPCODE_PRE_LAG:
>    ^~~~
>
> Introduced by commit
>
>   1c6952ca587d ("nfp: flower: generate merge flow rule")
>
> I get this warning because I am building with -Wimplicit-fallthrough
> in attempt to catch new additions early.  The gcc warning can be turned
> off by adding a /* fall through */ comment at the point the fall through
> happens (assuming that the fall through is intentional).
>

Hi Stephen,
Thanks for flagging this.
The fall through is intentional.
I'll submit a fix for the warning.
John

> --
> Cheers,
> Stephen Rothwell
