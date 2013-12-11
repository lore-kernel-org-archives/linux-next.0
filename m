From: Ingo Molnar <mingo@kernel.org>
Subject: Re: getting fixmap patches in linux-next
Date: Wed, 11 Dec 2013 16:40:21 +0100
Message-ID: <20131211154021.GA11208@gmail.com>
References: <1386775505.1979.105.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:46581 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab3LKPkZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 10:40:25 -0500
Received: by mail-ea0-f173.google.com with SMTP id o10so3017262eaj.4
        for <linux-next@vger.kernel.org>; Wed, 11 Dec 2013 07:40:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1386775505.1979.105.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, mingo <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>


* Mark Salter <msalter@redhat.com> wrote:

> Hi, I have cleanup of fixmap.h here:
> 
>  http://lkml.org/lkml/2013/11/25/474
> 
> Most of the series has been ack'd with the notable exception
> of the arch/x86 part. [...]

It didn't look controversial to me:

  Acked-by: Ingo Molnar <mingo@kernel.org>

> [...] I'd like to get this series into linux-next but I'm not sure 
> of the best way. I could put it in the c6x tree but it doesn't 
> belong there and I don't want to put the x86 patch in there without 
> any acks. I've cc'd Ingo thinking the tip tree may be the place it 
> should go.

I think akpm is usually collecting such generic arch and kmap patches 
- mind pinging him whether he'd like to take it into -mm?

Thanks,

	Ingo
