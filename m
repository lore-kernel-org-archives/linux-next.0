From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: md tree build failure
Date: Tue, 10 Mar 2009 17:38:19 +1100 (EST)
Message-ID: <d7e2f37be5a29b90440a7a4780327b0f.squirrel@neil.brown.name>
References: <20090310164750.affe762c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38854 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751881AbZCJGi2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 02:38:28 -0400
In-Reply-To: <20090310164750.affe762c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, March 10, 2009 4:47 pm, Stephen Rothwell wrote:
> Hi Neil,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> drivers/md/raid10.c: In function 'sync_request':
> drivers/md/raid10.c:1753: error: implicit declaration of function
> 'msleep_interruptible'
>
> Caused by commit 10d4564a71c58e89ddee656eb6cb0fecf5ac4b3c ("md: move lots
> of #include lines out of .h files and into .c").
>
> I have merged the version of the md tree fomr next-20090306 instead of
> today's.

Thanks.
I've fixed this now so you should get more happiness next time.

NeilBrown
