From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] mfd: fix stmpe.c build when OF is not enabled
Date: Tue, 13 Nov 2012 14:35:26 +0100
Message-ID: <CACRpkdZj5iuyXAfynF-5r65dnakxxm2A1O602P4Lc6it8=fU9g@mail.gmail.com>
References: <20121112164431.8bcfe78d2a2ec73271733db4@canb.auug.org.au>
	<50A12FF1.4000800@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A12FF1.4000800@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 12, 2012 at 6:20 PM, Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build errors when CONFIG_OF is not enabled by including
> <linux/of.h> (needs to be added in any case).
> An alternative fix could be to make the driver depend on OF.
>
> drivers/mfd/stmpe.c:1025:2: error: implicit declaration of function 'of_property_read_u32'
> drivers/mfd/stmpe.c:1030:2: error: implicit declaration of function 'for_each_child_of_node'
> drivers/mfd/stmpe.c:1030:36: error: expected ';' before '{' token
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rabin Vincent <rabin.vincent@stericsson.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
