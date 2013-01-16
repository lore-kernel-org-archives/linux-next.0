From: Stephen Warren <swarren@nvidia.com>
Subject: Re: linux-next: manual merge of the tegra tree with the arm-soc tree
Date: Tue, 15 Jan 2013 21:32:41 -0700
Message-ID: <50F62D69.8080100@nvidia.com>
References: <20130116141411.8fadedee54ed35dc0eddd288@canb.auug.org.au> <1358308153.32106.8.camel@gitbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33830 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757147Ab3APEco (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jan 2013 23:32:44 -0500
In-Reply-To: <1358308153.32106.8.camel@gitbox>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Prisk <linux@prisktech.co.nz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org

On 01/15/2013 08:49 PM, Tony Prisk wrote:
> On Wed, 2013-01-16 at 14:14 +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the tegra tree got a conflict in
>> drivers/clocksource/Makefile between commit ff7ec345f0ec ("timer: vt8500:
>> Move timer code to drivers/clocksource") from the arm-soc tree and commit
>> ac0fd9eca3ba ("ARM: tegra: move timer.c to drivers/clocksource/") from
>> the tegra tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>>
> 
> I don't know about everyone else, but I feel the preference should be to
> keep things alphabetized where possible to help avoid with merge
> conflicts later on. This is always a problem when we start tacking
> things on the end of lists.
> 
> I realise this Kconfig is not alphabetized anyway, but it's never too
> early to start on the 'right' path.

Sounds like a good idea, but the issue is: When to do the initial sort
so it doesn't conflict with all the adds in a kernel cycle... Post and
immediately commit a new patch near the end of the merge window?
