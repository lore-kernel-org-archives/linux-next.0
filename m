From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build failure
Date: Wed, 7 Oct 2009 00:31:55 +0200
Message-ID: <200910070031.55135.rjw@sisk.pl>
References: <20091006135505.f07ee40d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:57635 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933462AbZJFWbc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2009 18:31:32 -0400
In-Reply-To: <20091006135505.f07ee40d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>

On Tuesday 06 October 2009, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> kernel/freezer.c:27: error: expected ',' or ';' before '{' token
> 
> Caused by commit 9a4801cb8df76263abbb3049c0208625b7f34286 ("PM / freezer:
> Make refrigerator cold") which neglected to include linux/compiler.h for
> the definition of __cold.

Thanks for the notification.

Did you cross-compile it by chance?  It builds for me on native x86_64 with
allmodconfig, which is why I missed this issue.

> I have used the version of the suspend tree from next-20091002 for today.

I added the #include <linux/compiler.h> to freezer.h, but obviously I couldn't
verify if that fixed the problem.  Hopefully it did.

Pushing updated tree.

Best,
Rafael
