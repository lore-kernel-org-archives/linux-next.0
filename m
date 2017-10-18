From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Wed, 18 Oct 2017 08:40:26 -0700
Message-ID: <CAGXu5j+zORWwifQ7DPg6LkNNsKm0uPSR=pkGaF=GQ5kGOtURsg@mail.gmail.com>
References: <20171018144235.onumhg5fqmboodo6@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171018144235.onumhg5fqmboodo6@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allen Pais <allen.lkml@gmail.com>, linux-usb@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 18, 2017 at 7:42 AM, Mark Brown <broonie@kernel.org> wrote:
> Hi Felipe,
>
> Today's linux-next merge of the usb-gadget tree got a conflict in:
>
>   drivers/usb/gadget/udc/snps_udc_core.c
>
> between commit:
>
>   29bce57723351f63d ("usb/gadget/snps_udc_core: Convert timers to use timer_setup()")
>
> from the usb tree and commit:
>
>   46b614affda8667f9 ("usb: gadget: udc: snps_udc_core: use setup_timer() helper.")
>
> from the usb-gadget tree.
>
> I fixed it up by taking the USB version and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

FWIW, timer_setup() should be preferred over setup_timer().

-Kees

-- 
Kees Cook
Pixel Security
