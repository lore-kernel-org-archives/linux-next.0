From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 15
Date: Tue, 15 Oct 2013 22:21:27 -0700
Message-ID: <525E2257.7030604@roeck-us.net>
References: <1381845763-10487-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:57164 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750879Ab3JPFVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2013 01:21:33 -0400
In-Reply-To: <1381845763-10487-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

On 10/15/2013 07:02 AM, Thierry Reding wrote:
> Hi all,
>
> I've uploaded today's linux-next tree to the master branch of the
> repository below:
>
>          git://gitorious.org/thierryreding/linux-next.git
>
> A next-20131015 tag is also provided for convenience.
>
> Gained a new conflict, but nothing too exciting. x86 and ARM default
> configurations build fine. I've also used an x86 allmodconfig build to
> check for build errors. Mark fixed most of those in the trees that he
> created last Thursday and Friday, so I've cherry-picked them on top of
> the final merge. There was one new build failure in the staging tree
> that was trivial to fix so I added a patch to the tree as well.
>

This build does look much better than the previous ones. I 'only' get 12 build failures
out of 106 configurations. Worst are powerpc builds, with 7 out of 14 builds failed.

Details are at http://server.roeck-us.net:8010/builders; look for the 'next' column.

Guenter
