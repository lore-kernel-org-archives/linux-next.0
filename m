From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Apr 7
Date: Thu, 07 Apr 2016 16:32:51 +0530
Message-ID: <57063E5B.2080206@gmail.com>
References: <20160407152922.73d85ce6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:35952 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbcDGLC7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Apr 2016 07:02:59 -0400
In-Reply-To: <20160407152922.73d85ce6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

On Thursday 07 April 2016 10:59 AM, Stephen Rothwell wrote:
> Hi all,
>
> Changes since 20160406:

All the mips builds are failing since last few days.

My patch at : https://lkml.org/lkml/2016/4/4/236 fixes the build for 
defconfig and allmodconfig. I have not checked the patch with other builds.

regards
sudip
