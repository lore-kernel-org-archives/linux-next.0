From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 22 (staging/spectra)
Date: Tue, 22 Jun 2010 08:30:32 -0700
Message-ID: <20100622083032.8abe1605.randy.dunlap@oracle.com>
References: <20100622160518.2ef7afcc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:64280 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753742Ab0FVPbX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2010 11:31:23 -0400
In-Reply-To: <20100622160518.2ef7afcc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 22 Jun 2010 16:05:18 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100621:
> 
> My fixes tree contains:
>       v4l-dvb: update gfp/slab.h includes
>       arm: update gfp/slab.h includes
>       davinci: update gfp/slab.h includes
>       ocfs2: update gfp/slab.h includes
>       acpi: update gfp/slab.h includes


drivers/staging/spectra/ffsport.c:307: error: implicit declaration of function 'blk_fs_request'

Where is this function??

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
