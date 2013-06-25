From: Mark Salter <msalter@redhat.com>
Subject: Re: linux-next: problem trying to fetch the c6x tree
Date: Tue, 25 Jun 2013 09:43:44 -0400
Message-ID: <1372167824.3739.27.camel@t520.redhat.com>
References: <20130625094642.801db23098e04edcf308e18b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:3340 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750902Ab3FYNnt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Jun 2013 09:43:49 -0400
In-Reply-To: <20130625094642.801db23098e04edcf308e18b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2013-06-25 at 09:46 +1000, Stephen Rothwell wrote:
> Hi Mark,
> 
> Attempting to fetch the c6x tree
> (git://linux-c6x.org/git/projects/linux-c6x-upstreaming.git#for-linux-next)
> for the past two days has just produced hangs.  I am using whatever I
> have previously fetched.
> 

Hi Stephen,

I tried last night and saw the same problem. Now it is working again.
I'll try to find out what happened. Probably some infrastructure
change that I didn't get notice about.
