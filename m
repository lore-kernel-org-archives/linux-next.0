From: Anatolij Gustschin <agust@denx.de>
Subject: Re: linux-next: error trying to fetch the mpc5xxx tree
Date: Wed, 1 Oct 2014 09:11:25 +0200
Message-ID: <20141001091125.40546254@crub>
References: <20141001090115.44146aa9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:60506 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbaJAHLv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Oct 2014 03:11:51 -0400
In-Reply-To: <20141001090115.44146aa9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Wed, 1 Oct 2014 09:01:15 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:
...
> Attempting to fetch the mpc5xxx tree
> (git://git.denx.de/linux-2.6-agust.git#next) produces this error:
> 
> fatal: Could not read from remote repository.
> 
> Please make sure you have the correct access rights
> and the repository exists.

the repository has been moved just recently. Could you please change
the linux-next tree to pull from

 git://git.denx.de/linux-denx-agust.git#next

I'll send a patch for MAINTAINERS.

Thanks,

Anatolij
