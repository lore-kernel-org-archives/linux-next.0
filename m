From: Jim Davis <jim.epost@gmail.com>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Thu, 8 May 2014 10:40:42 -0700
Message-ID: <CA+r1Zhhi30bsRVYqhVgCa6khKW2W5YXsedtx90z=pMZp-M+iow@mail.gmail.com>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
	<536A9CF2.90906@infradead.org>
	<CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
	<20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
	<CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com>
	<20140508011030.GT19657@tassilo.jf.intel.com>
	<CA+r1ZhjErMWqVY5kSfMqLUAeQNMQhLXdwRMY2ro-OQMzbgEX9g@mail.gmail.com>
	<20140508170851.GU19657@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:38261 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754840AbaEHRkm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 May 2014 13:40:42 -0400
Received: by mail-ie0-f177.google.com with SMTP id rp18so2921388iec.36
        for <linux-next@vger.kernel.org>; Thu, 08 May 2014 10:40:42 -0700 (PDT)
In-Reply-To: <20140508170851.GU19657@tassilo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>

On 5/8/14, Andi Kleen <ak@linux.intel.com> wrote:

>
> Ok so LTO is not active, and you still get errors.

> Please send a full build log / config

>From a quick look at the failed buildlogs from next-20140508, those
problems may be due to a Makefile problem that Nishanth Menon just
identified (http://marc.info/?l=linux-next&m=139956566006889&w=2).
