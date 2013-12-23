From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] gpio: add GPIO support for SMSC SCH311x
Date: Mon, 23 Dec 2013 18:11:07 +0100
Message-ID: <CACRpkdZ0u5uZ+S0AYTkAnOEm2dxTdBO+SYCagEk6qgPZ3tSkdA@mail.gmail.com>
References: <1387792903-4286-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1387792903-4286-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 23, 2013 at 11:01 AM, Bruno Randolf <br1@einfach.org> wrote:

> This patch adds support for the GPIOs found on the SMSC "Super I/O" chips
> SCH3112, SCH3114 and SCH3116.
>
> The chip detection and I/O functions are copied from sch311x_wdt.
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>
>
> ---
> Notes (v5):
> - #include <linux/io.h> to avoid error "implicit declaration of function 'outb'
>   [-Werror=implicit-function-declaration]"

Please send incremental patches after I have applied the patches
to my tree. Applying this would force me to revert or rebase the
tree, both bad alternatives.

I will go and fix this myself now.

Yours,
Linus Walleij
