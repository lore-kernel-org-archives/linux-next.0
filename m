From: Matt Fleming <matt.fleming@intel.com>
Subject: Re: linux-next: manual merge of the ia64 tree with Linus' tree
Date: Wed, 13 Feb 2013 12:55:52 +0000
Message-ID: <1360760152.24917.33.camel@mfleming-mobl1.ger.corp.intel.com>
References: <20130213130559.dd6b2ac2c59093cc1794f41b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:49180 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508Ab3BMMz4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Feb 2013 07:55:56 -0500
Received: by mail-we0-f174.google.com with SMTP id r6so970612wey.19
        for <linux-next@vger.kernel.org>; Wed, 13 Feb 2013 04:55:54 -0800 (PST)
In-Reply-To: <20130213130559.dd6b2ac2c59093cc1794f41b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Luck, Tony" <tony.luck@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@linux.intel.com>, Seiji Aguchi <seiji.aguchi@hds.com>

On Wed, 2013-02-13 at 13:05 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ia64 tree got a conflict in
> drivers/firmware/efivars.c between commit 83e68189745a ("efi: Make
> 'efi_enabled' a function to query EFI facilities") from the  tree and
> commit a93bc0c6e07e ("efi_pstore: Introducing workqueue updating sysfs")
> from the ia64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen, this is all correct.
