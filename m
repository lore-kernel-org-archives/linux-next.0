From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 28 Feb 2012 14:08:10 -0800
Message-ID: <20120228140810.4cf9d477.akpm@linux-foundation.org>
References: <20120228165857.5abb225e1748d40f9c5d61e8@canb.auug.org.au>
	<20120228120037.GD3683@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57958 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753734Ab2B1WIM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Feb 2012 17:08:12 -0500
In-Reply-To: <20120228120037.GD3683@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>

On Tue, 28 Feb 2012 12:00:37 +0000
Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:

> > -	for_each_set_bit_cont(i, lzo_blocks[0]->sync_bmp,
> > +	for_each_set_bit_from(i, lzo_blocks[0]->sync_bmp,
> 
> That looks about right, yes.  Not sure what the best way to handle this
> is, perhaps maintain _cont() for a while?

I don't think that will be needed - for_each_set_bit_cont() only had
two callers, both in arch/x86/kernel/cpu/perf_event.c.
