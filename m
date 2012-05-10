From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] printk: correctly align __log_buf
Date: Thu, 10 May 2012 15:39:31 -0700
Message-ID: <20120510223931.GA30257@kroah.com>
References: <1336688073-10664-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:61675 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761578Ab2EJWje (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 May 2012 18:39:34 -0400
Received: by dady13 with SMTP id y13so2269914dad.19
        for <linux-next@vger.kernel.org>; Thu, 10 May 2012 15:39:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1336688073-10664-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Kay Sievers <kay@vrfy.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On Thu, May 10, 2012 at 04:14:33PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> __log_buf must be aligned, because a 64-bit value is written directly
> to it as part of struct log. Alignment of the log entries is typically
> handled by log_store(), but this only triggers for subsequent entries,
> not the very first (or wrapped) entries.

Thanks for tracking this down and fixing it, much appreciated.  I've
applied your patch now.

greg k-h
