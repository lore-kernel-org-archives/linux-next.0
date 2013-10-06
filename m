From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 4
Date: Sun, 06 Oct 2013 11:13:09 -0700
Message-ID: <5251A835.9070706@roeck-us.net>
References: <20131005224454.GA21581@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:56443 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754080Ab3JFSNP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Oct 2013 14:13:15 -0400
In-Reply-To: <20131005224454.GA21581@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>

On 10/05/2013 03:44 PM, Mark Brown wrote:
> Hi all,
>
> Better late than never I've uploaded today's linux-next tree to the
> master branch of the repository below:
>
>          git://gitorious.org/thierryreding/linux-next.git
>
> A next-20131004 tag is also provided for convenience.
>
> Each merge was tested with x86_664 allyesconfig.  A few new conflicts
> and build test failures came up along the way - these have all been
> reported.
>

Auto-build results:
	total: 110 pass: 81 skipped: 4 fail: 25

This is worse than with the October 3 tree; reason is that all mips builds now fail.
Ralf, any idea what is going on ? Looks like it is caused by a couple of your patches.

Please see http://server.roeck-us.net:8010/builders for details.

Guenter
