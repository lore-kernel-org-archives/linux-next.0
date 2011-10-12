From: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Oct 2011 17:37:12 +0900
Message-ID: <4E9551B8.4060601@dsn.lapis-semi.com>
References: <20111006144826.a69a5ea59d4ca94f8f7414cf@canb.auug.org.au> <20111011173714.d54bbcee6c0676ddcc37a1f3@canb.auug.org.au> <4E93EA10.4030405@dsn.lapis-semi.com> <20111012152451.66ce5ddffb4c5b3a4f6a31cf@canb.auug.org.au> <4E9525AC.9080909@dsn.lapis-semi.com> <CABMQnV+S2WbW0YZBiMXfs81b2dyLzj9wBxPmNuFrYErKfXsWtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sm-d311v.smileserver.ne.jp ([203.211.202.206]:46920 "EHLO
	sm-d311v.smileserver.ne.jp" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750864Ab1JLIhR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Oct 2011 04:37:17 -0400
In-Reply-To: <CABMQnV+S2WbW0YZBiMXfs81b2dyLzj9wBxPmNuFrYErKfXsWtg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

(2011/10/12 16:21), Nobuhiro Iwamatsu wrote:
> This is a problem of generic-chip.
> I created the patch and contributed the point to LKML.
> He forgot to put you into CC, sorry.
>
> Please check LKML for subject of "[PATCH] irq: Add EXPORT_SYMBOL to
> function of irq generic-chip".
>

OK,
We will be able to use our GPIO driver with module soon.
Good information.

thanks,
------
tomoya
ROHM Co., Ltd.
