From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: Change name from swiotlb-xen to xen-two tree and branches.
Date: Sat, 22 Jan 2011 10:34:03 +0100
Message-ID: <AANLkTi=0g9BOKbtMKFK-gaNojmj7AZhTaqoyhnELVySn@mail.gmail.com>
References: <20110121164501.GB29131@dumpdata.com>
	<20110122120941.20aec5de.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:59142 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab1AVJeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 22 Jan 2011 04:34:06 -0500
In-Reply-To: <20110122120941.20aec5de.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 22, 2011 at 2:09 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Konrad,
>
> On Fri, 21 Jan 2011 11:45:01 -0500 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
[...]
>> Would you be OK changing the name from swiotlb-xen to 'xen-two' and
>> pulling from #linux-next branch instead of #master please?
>
> All done - but my next tree will not be built until Jan 31 ...
>

It would be great to have a linux-next based on 2.6.38-rc2 before LCA-2011.
The only conflict I had to solve was in "arch/x86/xen/p2m.c" (for
details see [1]).

- Sedat -

[1] "xen: p2m: correctly initialize partial p2m leaf"
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=8e1b4cf2108488ccfb9a3e7ed7cd85a435e01d4b
