From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Section mismatch in drivers/usb/gadget/fotg210-udc.c
Date: Wed, 3 Jul 2013 13:00:39 -0400
Message-ID: <CAP=VYLpsF7bmF2HZ84_WV0YtbGqHoPDMaE=a9p9UhovHeckkRg@mail.gmail.com>
References: <51C20F3D.1060700@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:58658 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932471Ab3GCRBL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2013 13:01:11 -0400
In-Reply-To: <51C20F3D.1060700@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: Felipe Balbi <balbi@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-usb@vger.kernel.org

On Wed, Jun 19, 2013 at 4:06 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi guys,
>
> This was seen on a linux-next (Jun18th tree) allmodconfig build:
>
> WARNING: drivers/usb/gadget/fotg210-udc.o(.data+0x0): Section mismatch in reference from the variable fotg210_driver to the function .init.text:fotg210_udc_probe()
> The variable fotg210_driver references
> the function __init fotg210_udc_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Hi,

Wondering if this fell through the cracks?   I recall the fix being discussed,
but yet I'm still seeing the problem when I build today's linux-next, and the
merge window has already opened on Monday.

Paul.
--


>
> Paul.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
