From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: error when fething the git.secretlab.ca trees
Date: Thu, 17 Jan 2013 00:16:12 +0000
Message-ID: <CACxGe6udrYHtVwf50YsPCcrQ-3fCFEXP7pr2AGeVL=ja5VmZDA@mail.gmail.com>
References: <20130117092536.f1a4e0ed60610845cc919b15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f49.google.com ([209.85.216.49]:42310 "EHLO
	mail-qa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754758Ab3AQAQd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jan 2013 19:16:33 -0500
Received: by mail-qa0-f49.google.com with SMTP id r4so1677208qaq.15
        for <linux-next@vger.kernel.org>; Wed, 16 Jan 2013 16:16:32 -0800 (PST)
In-Reply-To: <20130117092536.f1a4e0ed60610845cc919b15@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 16, 2013 at 10:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> Fetching the trees from git.secretlab.ca over the past few days has
> produced this error:
>
> fatal: The remote end hung up unexpectedly

Thanks for letting me know. I was mucking about with my server to
enable gitolite. I probably messed it up. I've just tried to fix it.
Let me know if it is working now.

g.
