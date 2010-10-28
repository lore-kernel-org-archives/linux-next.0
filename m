From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Thu, 28 Oct 2010 04:04:54 +0100
Message-ID: <20101028030454.GB15103@sirena.org.uk>
References: <20101028112739.0f400818.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53919 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932829Ab0J1DFI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2010 23:05:08 -0400
Content-Disposition: inline
In-Reply-To: <20101028112739.0f400818.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sweta Bhatt <sweta.bhatt@einfochips.com>, Roland Dreier <rolandd@cisco.com>, Davide Rizzo <elpa.rizzo@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Mike Frysinger <vapier@gentoo.org>, Richard Purdie <rpurdie@linux.intel.com>, Joseph Chan <JosephChan@via.com.tw>

On Thu, Oct 28, 2010 at 11:27:39AM +1100, Stephen Rothwell wrote:

> While building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:

> sound/soc/soc-core.c: In function 'pmdown_time_set':
> sound/soc/soc-core.c:169: warning: ignoring return value of 'strict_strtol', declared with attribute warn_unused_result

Just cooked up a patch for this but due to timezone/travel on the part
of both myself and Liam it may not make get reviewed and into -next for
a little while.
