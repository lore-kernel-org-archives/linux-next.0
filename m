From: Fabio Estevam <festevam@gmail.com>
Subject: Re: linux-next: Tree for Jun 5 (staging/media/imx/)
Date: Wed, 5 Jun 2019 17:41:07 -0300
Message-ID: <CAOMZO5Db6Lh1L9Fw8QXfuQVLHq_c6Y8YBqy9_1=wjs=vSHTMjA@mail.gmail.com>
References: <20190605161436.3ac174f3@canb.auug.org.au> <4857750b-a4f4-8539-218c-7e9ac1a6006e@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4857750b-a4f4-8539-218c-7e9ac1a6006e@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Randy,

On Wed, Jun 5, 2019 at 4:37 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> on x86_64:
>
> ld: drivers/staging/media/imx/imx-media-internal-sd.o: in function `imx_media_register_ipu_internal_subdevs':
> imx-media-internal-sd.c:(.text+0xd1): undefined reference to `ipu_get_num'

Thanks for reporting this problem.

I will submit a fix.
