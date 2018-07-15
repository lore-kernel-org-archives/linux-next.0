From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Sun, 15 Jul 2018 16:50:25 -0700
Message-ID: <CAOesGMgicOOi0Nr+m_UHEGYL+ryRW65YAPwVsN+CZpo6kc2FLA@mail.gmail.com>
References: <20180716091337.6c1b2a4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716091337.6c1b2a4d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Vinod Koul <vkoul@kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jul 15, 2018 at 4:13 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> sound/arm/pxa2xx-pcm-lib.c: In function '__pxa2xx_pcm_open':
> sound/arm/pxa2xx-pcm-lib.c:129:6: error: 'pxad_filter_fn' undeclared (first use in this function); did you mean 'dma_filter_fn'?
>       pxad_filter_fn,
>       ^~~~~~~~~~~~~~
>       dma_filter_fn
>
> Caused by commit
>
>   0d0b16b8e008 ("dmaengine: pxa: make the filter function internal")
>
> I have used the arm-soc tree from next-20180713 for today.

It's a known issue due to dependencies with a driver tree. :(

Robert, this is unfortunate. What's the dependent patches? We can pick
them up in our tree as duplicates if needed.


-Olof
