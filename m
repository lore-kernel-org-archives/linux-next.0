From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (pm tree related)
Date: Thu, 24 Nov 2011 11:15:05 +0100
Message-ID: <201111241115.05836.rjw@sisk.pl>
References: <20111114142423.fe126b8c8cfd275d7dd138cc@canb.auug.org.au> <20111124171949.994860621f4f83a650cf9b5b@canb.auug.org.au> <CAOS58YPAh3e_sa4JrHdVD40scNED5Z4g4t6JNU8MT8kq8vZV2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:55595 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755393Ab1KXKMT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Nov 2011 05:12:19 -0500
In-Reply-To: <CAOS58YPAh3e_sa4JrHdVD40scNED5Z4g4t6JNU8MT8kq8vZV2Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, November 24, 2011, Tejun Heo wrote:
> Hello,
> 
> On Wed, Nov 23, 2011 at 10:19 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> > Subject: [PATCH] freezer: fix more fallout from the thaw_process rename
> >> >
> >> > Commit 944e192db53c "freezer: rename thaw_process() to __thaw_task()
> >> > and simplify the implementation" did not create a !CONFIG_FREEZER version
> >> > of __thaw_task().
> >> >
> >> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >>
> >> I've applied your patch to linux-pm/pm-freezer and merged it into
> >> linux-pm/linux-next.
> 
> Ah.. that's my bad. I was actually looking at that diff and somehow it
> just slipped my mind. Rafael, can you please apply Stephen's patch on
> top of pm-freezer?

Sure, I will do that later today.

Thanks,
Rafael
