From: John Hurley <john.hurley@netronome.com>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Tue, 23 Apr 2019 13:19:10 +0100
Message-ID: <CAK+XE=k_qv4DDku8HBKRuqWKsze5z0W_pZuqa+jRaJKXZq8SOQ@mail.gmail.com>
References: <20190423072634.57cdf8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423072634.57cdf8b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 22, 2019 at 10:26 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   7d26c96052cd ("nfp: flower: fix size_t compile warning")
>
> Fixes tag
>
>   Fixes: a6156a6ab0f9 ("nfp: flower: handle merge hint messages")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: dbc2d68edc98 ("nfp: flower: handle merge hint messages")
>

Hi Stephen,
Yes, the fixes SHA1 tag you have is correct.
I have no idea how the incorrect one went in!
Thanks,
John

> --
> Cheers,
> Stephen Rothwell
