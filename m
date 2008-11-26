From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 12:23:51 +0100
Message-ID: <20081126112351.GA23386@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126110631.GD14826@Krystal> <20081126112208.GB20601@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:56214 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752168AbYKZLYM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:24:12 -0500
Content-Disposition: inline
In-Reply-To: <20081126112208.GB20601@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>


* Ingo Molnar <mingo@elte.hu> wrote:

> Moving the tracepoint definitions into blktrace.c consolidates it 
> nicely without cluttering the various block/* files and ties their 
> presence to CONFIG_BLK_DEV_IO_TRACE as well.

hm, the latter is not a good idea: the tracepoints will be undefined 
when the io tracer is disabled - not good. I'll spread them out like 
you did.

	Ingo
