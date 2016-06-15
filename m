From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 15 Jun 2016 23:12:38 +0200
Message-ID: <1466025158.28441.16.camel@tiscali.nl>
References: <20160506145810.04a319d3@canb.auug.org.au>
	 <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
	 <1465983212.9515.35.camel@tiscali.nl>
	 <20160615140311.l2s7pkxuvybskcbc@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lb2-smtp-cloud6.xs4all.net ([194.109.24.28]:42122 "EHLO
	lb2-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932235AbcFOVMo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jun 2016 17:12:44 -0400
In-Reply-To: <20160615140311.l2s7pkxuvybskcbc@treble>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Josh,

On wo, 2016-06-15 at 09:03 -0500, Josh Poimboeuf wrote:
> I agree it looks like a false positive, though the code is a bit
> convoluted, so I'm not surprised that gcc might get confused.

Agree.

> How about initializing opt to 0?

I'm unconvinced. Especially since this only shows up in 64 bits builds.

> --- a/net/netfilter/ipvs/ip_vs_sync.c
> +++ b/net/netfilter/ipvs/ip_vs_sync.c

>  static inline int ip_vs_proc_sync_conn(struct netns_ipvs *ipvs, __u8

> -	struct ip_vs_sync_conn_options opt;
> +	struct ip_vs_sync_conn_options opt = {0};

You forgot to append
                                                  /* I give up */

here. More common would be to use
                                                  /* silence GCC */
Thanks,


Paul Bolle
