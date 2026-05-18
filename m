Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503741DB13A;
	Mon, 18 May 2026 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779132253; cv=none; b=rqVfLUeoVOseE0zo8pgLGrMIvpYl6RSUWL8Afcdp4PFF5gwsoAHZOqLLVfqJT1U2qDcL0Nr8FJ44AkRcexlQWvg2tZv4A1tkESsmWe5FEVcJYrP9y34tFeRGU/gFZheQbLoOY5BLktJdQQDquPIFM6f8PEO5zMj/BqfX1DvFAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779132253; c=relaxed/simple;
	bh=XWgRMHVu50tiwleuyXsjTUa8gpGRGhj0hylr8oSHbdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkMt8tw+J5tZPXf2c0CvDd3sz9OTbnvFY/oSvrQ88VcYiGFgw3FQV97X2MUsI7OU7091kRxHrCNOv2AFpQ1zxkn8qX788jB/NaqQl4Gy+w7WU5TDBk+F16XUdQolmKBff+MzPyCIgmKa1GVAAADw35MT+bTM3YONkZRa6wTz2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae0DE+4J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae0DE+4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773C3C2BCB7;
	Mon, 18 May 2026 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779132253;
	bh=XWgRMHVu50tiwleuyXsjTUa8gpGRGhj0hylr8oSHbdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae0DE+4JDauCa5wABAbYR1sXDSDtoPXH7egHgdaZ8GsgClWzy5aDYAsqpsNSPDa0p
	 lFvikG0geCQVuVhDT55WKDH/uewLJZXB0w5Zz3iQpnnIdAENh1qwV9vJUFU5gWuiTC
	 5HJ7nuHIQBdj/idy0Y1s6tMzmHSrDKLiOUNUgEZly4EpQ8rtGxCf565mroi1TrzJah
	 kUSvbxHsp9fP21SUYr0xfuI9uTN/JzB5DneaeDAS8MNodqqAsnkJ8UvXUGAuslhMwi
	 zWy1y6MsZOqxB0ALE1LjVIqwmZQpZS4cUjxWH0rSVFh+5gQGSNR3i4UF1CNZDEjila
	 qK3kfI7CHt1Fg==
Date: Mon, 18 May 2026 12:24:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: torvalds@linux-foundation.org, Benjamin Tissoires <bentiss@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Kosina <jkosina@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <20260518192408.GA2744985@ax162>
References: <ags8osqoMATFBslZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ags8osqoMATFBslZ@sirena.org.uk>

On Mon, May 18, 2026 at 05:21:54PM +0100, Mark Brown wrote:
> Hi all,
> 
> During the final build today's linux-next build (i386 defconfig) failed
> like this:
> 
> In file included from /tmp/next/build/include/linux/device.h:15,
>                  from /tmp/next/build/include/linux/input.h:19,
>                  from /tmp/next/build/drivers/hid/hid-core.c:25:
> /tmp/next/build/drivers/hid/hid-core.c: In function 'hid_report_raw_event':
> /tmp/next/build/drivers/hid/hid-core.c:2053:43: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>  2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
>       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                              ^~~
> /tmp/next/build/include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
>   156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                                                             ^~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
>   215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
>       |                 ^~~~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
>   227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/hid.h:1342:9: note: in expansion of macro 'dev_warn_ratelimited'
>  1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/hid/hid-core.c:2053:17: note: in expansion of macro 'hid_warn_ratelimited'
>  2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
>       |                 ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/hid/hid-core.c:2053:91: note: format string is defined here
>  2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
>       |                                                                                         ~~^
>       |                                                                                           |
>       |                                                                                           long int
>       |                                                                                         %d
> /tmp/next/build/drivers/hid/hid-core.c:2075:43: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>  2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
>       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                              ^~~
> /tmp/next/build/include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
>   156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                                                             ^~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
>   215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
>       |                 ^~~~~~~~~
> /tmp/next/build/include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
>   227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/hid.h:1342:9: note: in expansion of macro 'dev_warn_ratelimited'
>  1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/hid/hid-core.c:2075:17: note: in expansion of macro 'hid_warn_ratelimited'
>  2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
>       |                 ^~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/hid/hid-core.c:2075:92: note: format string is defined here
>  2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
>       |                                                                                          ~~^
>       |                                                                                            |
>       |                                                                                            long int
>       |                                                                                          %d
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>    2c85c61d1332e (HID: pass the buffer size to hid_report_raw_event)
> 
> for which I applied a revert (note that the commit is in Linus' tree),
> also covering 206342541fc88 (HID: core: introduce
> hid_safe_input_report()).

I submitted

  https://lore.kernel.org/20260517-hid-core-fix-size_t-specifier-v1-1-bfdd959ec383@kernel.org/

for this, which you could apply instead of the revert. Given how simple
it is, maybe Linus could just apply it directly to unbreak both trees?

-- 
Cheers,
Nathan
