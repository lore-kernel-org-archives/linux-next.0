From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warnings in Linus' tree
Date: Mon, 13 Nov 2017 14:03:28 -0800
Message-ID: <CA+55aFxBOnUUH5tXhf-MaVLG3oGAdXY27oqsACBeYgGKwEfVNw@mail.gmail.com>
References: <20171114085235.70e99fb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:39306 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752241AbdKMWD3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2017 17:03:29 -0500
In-Reply-To: <20171114085235.70e99fb6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Mon, Nov 13, 2017 at 1:52 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
>
> WARNING: modpost: missing MODULE_LICENSE() in net/9p/9pnet_xen.o
...

Yes. Very much expected. Hopefully the involved modules will get fixed
thanks to the warning.

At worst, we'll just match up the files in the SPDX database and just
add them before rc1. But I'd much rather see the actual maintainers
react to this.

               Linus
