From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: linux-next: build warning after merge of the l2-mtd tree
Date: Fri, 23 Jun 2017 10:59:46 -0700
Message-ID: <20170623175946.GA56401@google.com>
References: <20170623113206.29042011@canb.auug.org.au>
 <c9987333f5d8485043e42c17947c59de@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:33471 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754645AbdFWR7t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jun 2017 13:59:49 -0400
Content-Disposition: inline
In-Reply-To: <c9987333f5d8485043e42c17947c59de@milecki.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 23, 2017 at 06:56:53AM +0200, Rafał Miłecki wrote:
> On 2017-06-23 03:32, Stephen Rothwell wrote:
> >After merging the l2-mtd tree, today's linux-next build (x86_64
> >allmodconfig) produced this warning:
> 
> This code has been just moved, so the warning was already there before.
> 
> But it's of course a good opportunity to fix it :)

We now allow it to build with COMPILE_TEST, which means it can show up
on 64-bit architectures, where sizeof(size_t) != sizeof(int). I failed
to add it to my local 64-bit build tests, so I didn't notice this.

But fixed now.

Brian
