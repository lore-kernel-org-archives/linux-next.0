From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] [media] gp8psk-fe: add missing MODULE_foo() macros
Date: Mon, 14 Nov 2016 14:37:28 +0100
Message-ID: <1479130648.32178.3.camel@tiscali.nl>
References: <20161114111437.29317cdb@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:42932 "EHLO
        lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752374AbcKNNhf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 08:37:35 -0500
In-Reply-To: <20161114111437.29317cdb@vento.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2016-11-14 at 11:14 -0200, Mauro Carvalho Chehab wrote:

> --- a/drivers/media/dvb-frontends/gp8psk-fe.c
> +++ b/drivers/media/dvb-frontends/gp8psk-fe.c

> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the Free
> + * Software Foundation, version 2.

> +MODULE_LICENSE("GPL");

Nit: according to the comments in include/linux/module.h the "ident" that
matches the license described at the top of this file is "GPL v2".


Paul Bolle
