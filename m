From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 27 Apr 2016 07:39:13 +1000
Message-ID: <20160427073913.0a34400d@canb.auug.org.au>
References: <20160426133812.366dc031@canb.auug.org.au>
	<571F6D59.8040402@suse.cz>
	<v3THaCMkCzylcv3TJavAje@videotron.ca>
	<alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
	<20160427011825.06c64502@canb.auug.org.au>
	<alpine.LFD.2.20.1604261603310.5091@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39772 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752664AbcDZVjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 17:39:17 -0400
In-Reply-To: <alpine.LFD.2.20.1604261603310.5091@knanqh.ubzr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

Hi Nicolas,

On Tue, 26 Apr 2016 16:48:44 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>
> OK!  After digging and diffing through 750 megabytes of make debug logs 
> I finally found the explanation.  The if_changed directive is useless 
> against phony targets.

Thanks for working this out.

> @Stephen: could you replace the revert with the patch below in your tree?

Will do, unless Michal beats me to it.

-- 
Cheers,
Stephen Rothwell
