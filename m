From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 12:37:27 +0100
Message-ID: <20081126113727.GA25861@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126110631.GD14826@Krystal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55920 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751255AbYKZLhq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:37:46 -0500
Content-Disposition: inline
In-Reply-To: <20081126110631.GD14826@Krystal>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>


* Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> wrote:

> +DECLARE_TRACE(block_rq_abort,

btw., you forgot to define this one.

it should all be fine in tip/tracing/blktrace.

	Ingo
