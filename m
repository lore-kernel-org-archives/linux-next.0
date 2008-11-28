From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] fix build: add missing #ifdef CONFIG_STACKTRACE
Date: Fri, 28 Nov 2008 11:34:00 +0100
Message-ID: <20081128103400.GA11341@elte.hu>
References: <c62985530811280114s50abe288q255a185b6d64c81b@mail.gmail.com> <1227863876-22747-1-git-send-email-edwintorok@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59079 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750739AbYK1KeM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 05:34:12 -0500
Content-Disposition: inline
In-Reply-To: <1227863876-22747-1-git-send-email-edwintorok@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?B?VPZy9ms=?= Edwin <edwintorok@gmail.com>
Cc: adobriyan@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:

>=20
> Signed-off-by: T=F6r=F6k Edwin <edwintorok@gmail.com>
> ---
>  kernel/trace/trace.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

applied to tip/tracing/stack-tracer, and pushed out into ftrace-next, t=
hanks=20
Edwin!

	Ingo
