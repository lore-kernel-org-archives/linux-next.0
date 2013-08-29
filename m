From: Maxim Patlasov <mpatlasov@parallels.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Thu, 29 Aug 2013 15:24:46 +0400
Message-ID: <521F2F7E.8010702@parallels.com>
References: <20130829194741.ff75bb1ce06207d5d3a703de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay.parallels.com ([195.214.232.42]:38539 "EHLO
	relay.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756298Ab3H2LY5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 07:24:57 -0400
In-Reply-To: <20130829194741.ff75bb1ce06207d5d3a703de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

08/29/2013 01:47 PM, Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (sparc64 defcon=
fig
> and others) produced these warnings:
>
> mm/page-writeback.c: In function 'balance_dirty_pages_ratelimited':
> mm/page-writeback.c:1450:13: warning: 'bdi_thresh' may be used uninit=
ialized in this function [-Wuninitialized]
> mm/page-writeback.c:1372:16: note: 'bdi_thresh' was declared here
> mm/page-writeback.c:1226:16: warning: 'bdi_dirty' may be used uniniti=
alized in this function [-Wuninitialized]
> mm/page-writeback.c:1369:16: note: 'bdi_dirty' was declared here
>
> Possibly introduced by commit 34c547af1e23 ("mm/page-writeback.c: add
> strictlimit feature"), but I am not sure anything can be done about t=
hem.
>

This looks as gcc glitch. So far as I didn't observe the warnings, the=20
version of gcc does matter. May be moving the definitions of the two=20
variables into for(;;){...} would help. Could you please give it a try?

Thanks,
Maxim
