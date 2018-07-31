From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next: manual merge of the crypto tree with the net-next tree
Date: Tue, 31 Jul 2018 08:24:58 +0200
Message-ID: <CAJKOXPdhzbKeu57CqbVaHWKDy1-UunewJg6NtrmQPVY5fdSxWw@mail.gmail.com>
References: <20180730132253.33633f56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180730132253.33633f56@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi All,

The resolution looks correct. The other way would be to amend the
commit 5d258b48efbd ("net: ethernet: Use existing define with
polynomial") in crypto tree and remove changes to freescale drivers.

Best regards,
Krzysztof

On 30 July 2018 at 05:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Herbert,
>
> Today's linux-next merge of the crypto tree got conflicts in:
>
>   drivers/net/ethernet/freescale/fec_main.c
>   drivers/net/ethernet/freescale/fs_enet/mac-fec.c
>
> between commits:
>
>   16f6e9835bcd ("net: ethernet: freescale: Use generic CRC32 implementation")
>   d805f6a86829 ("net: ethernet: fs-enet: Use generic CRC32 implementation")
>
> from the net-next tree and commit:
>
>   5d258b48efbd ("net: ethernet: Use existing define with polynomial")
>
> from the crypto tree.
>
> I fixed it up (I used the net-next tree versions (but kept the rmeoval
> of the CRC32_POLY and FEC_CRC_POLY defines) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
