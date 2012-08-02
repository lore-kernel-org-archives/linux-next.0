From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: unable to fetch the moduleh tree
Date: Thu, 2 Aug 2012 17:05:19 -0400
Message-ID: <501AEB8F.10908@windriver.com>
References: <20120802085448.5fb877ce7747128ba354f605@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:48911 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452Ab2HBVFY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Aug 2012 17:05:24 -0400
In-Reply-To: <20120802085448.5fb877ce7747128ba354f605@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On 12-08-01 06:54 PM, Stephen Rothwell wrote:
> Hi Paul,
> 
> For the last few days, I have been getting this error when trying to
> fetch the moduleh tree:
> 
> fatal: unable to connect to openlinux.windriver.com:
> openlinux.windriver.com[0: 192.124.127.100]: errno=Connection timed out
> 
> Is this tree still in use?  Or should I just remove it from linux-next?

Hi Stephen,

Go ahead and remove it.  If/when I've something else that I can't
push via a maintainer tree, I'll get you to add one with a more
appropriate name, and serve it from kernel.org instead.

Thanks,
Paul.

> 
