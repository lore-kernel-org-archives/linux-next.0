From: Seiji Aguchi <seiji.aguchi@hds.com>
Subject: RE: linux-next: build failure after merge of the ia64 tree
Date: Thu, 10 Jan 2013 23:58:53 +0000
Message-ID: <A5ED84D3BB3A384992CBB9C77DEDA4D414A3D7E4@USINDEM103.corp.hds.com>
References: <20130111105440.3497d6f8c79189ff6a1bd236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usindpps06.hds.com ([207.126.252.19]:58530 "EHLO
	usindpps06.hds.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754827Ab3AJX7C convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jan 2013 18:59:02 -0500
In-Reply-To: <20130111105440.3497d6f8c79189ff6a1bd236@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Stephen, Tony,

I will take a look at it.

Seiji

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Thursday, January 10, 2013 6:55 PM
> To: Luck, Tony
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Seiji Aguchi
> Subject: linux-next: build failure after merge of the ia64 tree
> 
> Hi all,
> 
> After merging the ia64 tree, today's linux-next build (x86_64_allmodconfig) failed like this:
> 
> ERROR: "pstore_cannot_block_path" [drivers/firmware/efivars.ko] undefined!
> 
> Caused by commit 1a1df768ea4e ("efi_pstore: Avoid deadlock in non-blocking paths").
> 
> I have used the ia64 tree from next-20130110 for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
