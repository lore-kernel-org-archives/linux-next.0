From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Request for inclusion of ep93xx tree in linux-next
Date: Wed, 2 May 2012 12:47:32 +0000
Message-ID: <201205021247.33220.arnd@arndb.de>
References: <4F9F16A9.9090108@gmail.com> <201205010836.28365.arnd@arndb.de> <4FA0D48F.2090800@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:49164 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753178Ab2EBMro (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 May 2012 08:47:44 -0400
In-Reply-To: <4FA0D48F.2090800@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Ryan Mallon <rmallon@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mika Westerberg <mika.westerberg@iki.fi>, arm@kernel.org, linux-next@vger.kernel.org, H Hartley Sweeten <hartleys@visionengravers.com>

On Wednesday 02 May 2012, Ryan Mallon wrote:
> Thanks for the tip. I leave the branches as is for the moment. If I end
> up adding any additional branches to my tree, then I will look at
> creating an ep93xx-for-next branch then. In this case, should the
> for-next branch just be a regular merge of all the other branches I
> have?

Yes. In the arm-soc tree I usually just merge all changes on top
of the for-next branch, and occasionally clean it up, starting over
with a fresh -rc release and pulling the other branches in, then
use git-diff to make sure the contents are identical to what they
were before.

> How do I make it verifiable that everything from the other
> branches has been being tested in the for-next branch?

I'm not sure I understand the question. Maybe you are looking
for 'git branch --no-merged for-next' That command will show
all local branches that are not merged into the for-next branch.

	Arnd
