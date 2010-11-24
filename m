From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] quota: Use %pV and __attribute__((format (printf in
 __quota_error and fix fallout
Date: Wed, 24 Nov 2010 07:01:17 -0800
Message-ID: <1290610877.11971.59.camel@Joe-Laptop>
References: <1290566994.11971.26.camel@Joe-Laptop>
	 <20101124125029.GO6113@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1852 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216Ab0KXPBS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Nov 2010 10:01:18 -0500
In-Reply-To: <20101124125029.GO6113@quack.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 2010-11-24 at 13:50 +0100, Jan Kara wrote:
> On Tue 23-11-10 18:49:54, Joe Perches wrote:
> > Use %pV in __quota_error so a single printk can not be
> > interleaved with other logging messages.
> > Add __attribute__((format (printf, 3, 4))) so format
> > and arguments can be verified by compiler.
> > Make sure printk formats and arguments match.
> > 
> > Block # needed a pointer dereference.
>   I already had a similar patch from you in my tree. So I've replaced it.

Perhaps you can get your tree into linux-next.

I believe you only have to send a request to
Stephen Rothwell (cc'd).
