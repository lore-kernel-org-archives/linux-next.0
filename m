From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Wed, 25 Jun 2008 12:27:54 -0700
Message-ID: <200806251227.54606.jbarnes@virtuousgeek.org>
References: <20080625125700.a71a7243.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-157.bluehost.com ([67.222.39.37]:56159 "HELO
	outbound-mail-157.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752348AbYFYT2A (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 15:28:00 -0400
In-Reply-To: <20080625125700.a71a7243.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

On Tuesday, June 24, 2008 7:57 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a trivial conflict in
> arch/x86/kernel/setup_64.c between commit
> 8d76d30130dacf140f82d0441f2df74c27e8f10b ("x86: check command line when
> CONFIG_X86_MPPARSE is not set, v2") from the x86 tree and commit
> e3f2baebf4209b5927e23fa65d5977d31db936b3 ("PCI/x86: early dump pci conf
> space v2") from the pci tree.
>
> Just two overlapping additions.  I took both. I put the pci change
> second, if that matters.

That's fine.  Thanks.

Jesse
