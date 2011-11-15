From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for Nov 15
Date: Tue, 15 Nov 2011 22:03:26 +0100
Message-ID: <201111152203.26186.rjw@sisk.pl>
References: <20111115131742.f9ebaf818fd152ef779f4d19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:40958 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755562Ab1KOVAn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Nov 2011 16:00:43 -0500
In-Reply-To: <20111115131742.f9ebaf818fd152ef779f4d19@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>

On Tuesday, November 15, 2011, Stephen Rothwell wrote:
> Hi all,
> 
> The patch is still absent from kernel.org.
> 
> Changes since 20111114:
> 
> The m86knommu tree lost 2 conflicts.
> 
> The pm tree still had its build failures for which I reverted a commit
> and applied a patch.

Hmm.  If that was the patch you sent yestarday, it definitely is there in my
tree.

The "kill unused set_freezable_with_signal()" commit still has to be reverted,
unfortunately, but Tejun is working on a fix (AFAICS).

I'm going to drop pm-freezer from my linux-next branch for now.

Thanks,
Rafael
