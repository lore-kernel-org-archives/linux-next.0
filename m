From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for Jan 24
Date: Wed, 25 Jan 2012 00:18:16 +0100
Message-ID: <201201250018.16848.rjw@sisk.pl>
References: <20120124163055.3c99bca0d5dfd754a352fb02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:48945 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752766Ab2AXXOq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jan 2012 18:14:46 -0500
In-Reply-To: <20120124163055.3c99bca0d5dfd754a352fb02@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Jiri Slaby <jslaby@suse.cz>

Hi Stephen,

On Tuesday, January 24, 2012, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20120123:
> 
> New tree: ktest
> Reinstated tree: input-mt
> 
> My fixes tree contains:
> 	powerpc: make PSERIES_IDLE bool
> 
> Linus' tree gained a build failure for which I applied a patch.
> 
> The arm tree gained a conflict against Linus' tree.
> 
> The arm-soc tree lost its conflicts but gained another against the arm
> tree.
> 
> The s5p tree gained conflicts against Linus' tree.
> 
> The nfs tree lost its build failure.
> 
> The sound-asoc tree lost its build failure.
> 
> The input tree gained a build failure so I used the version from
> next-20120123.
> 
> The akpm tree lost several patches that were merged into Linus' tree.

Is there any new material touching kernel/workqueue.c or kernel/freezer.c?

We seem to have a freezer regression in linux-next which doesn't seem to be
present in my tree.

Thanks,
Rafael
