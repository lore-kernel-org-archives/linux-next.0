From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the suspend tree with the net tree
Date: Fri, 29 Apr 2011 22:36:19 +0200
Message-ID: <201104292236.19986.rjw@sisk.pl>
References: <20110429120541.c27998c2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:37133 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932479Ab1D2Ufo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2011 16:35:44 -0400
In-Reply-To: <20110429120541.c27998c2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org

On Friday, April 29, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the suspend tree got a conflict in
> arch/x86/Kconfig between commit 0a14842f5a3c ("net: filter: Just In Time
> compiler for x86-64") from the  tree and commit d9f1ce017fcf ("PM: Remove
> sysdev suspend, resume and shutdown operations") from the suspend tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Please do, thanks a lot!

Rafael
