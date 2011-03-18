From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the kbuild tree with the hwmon-staging
 tree
Date: Fri, 18 Mar 2011 12:22:10 +0100
Message-ID: <4D834062.5040001@suse.cz>
References: <20110318114836.04c76926.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54210 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752975Ab1CRLWN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Mar 2011 07:22:13 -0400
In-Reply-To: <20110318114836.04c76926.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt mooney <mfm@muteddisk.com>, Guenter Roeck <guenter.roeck@ericsson.com>

On 18.3.2011 01:48, Stephen Rothwell wrote:
> Hi Michal,
> 
> Today's linux-next merge of the kbuild tree got a conflict in
> drivers/hwmon/Makefile between commit 442aba78728e ("hwmon: PMBus device
> driver") from the hwmon-staging tree and commit 5c39e31195f4 ("hwmon:
> change to new flag variable") from the kbuild tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

I am aware of the conflict, but as you say, it is just changed context.

Thanks,
Michal
