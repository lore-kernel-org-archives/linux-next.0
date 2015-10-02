From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: at91-pio4: use irq_set_handler_locked
Date: Fri, 2 Oct 2015 14:51:27 -0700
Message-ID: <CACRpkdYF3UCX4ME-ANUjhcXZhCwZGVUvCP5iv5oH1a9e-uZkfw@mail.gmail.com>
References: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
	<1443433273-17417-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35149 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295AbbJBVv2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2015 17:51:28 -0400
Received: by oiww128 with SMTP id w128so64988612oiw.2
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2015 14:51:27 -0700 (PDT)
In-Reply-To: <1443433273-17417-2-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>

On Mon, Sep 28, 2015 at 2:41 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> Use irq_set_handler_locked() as it avoids a redundant lookup of the
> irq descriptor.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Patch applied.

Yours,
Linus Walleij
