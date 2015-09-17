From: Luis de Bethencourt <luis@debethencourt.com>
Subject: Re: linux-next: build failure after merge of the libata tree
Date: Thu, 17 Sep 2015 13:14:26 +0200
Message-ID: <20150917111426.GA11478@goodgumbo.baconseed.org>
References: <20150917140336.63c2d09c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:35407 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbbIQLO3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2015 07:14:29 -0400
Content-Disposition: inline
In-Reply-To: <20150917140336.63c2d09c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 17, 2015 at 02:03:36PM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> After merging the libata tree, today's linux-next build (powercp
> allmodconfig) failed like this:
> 
> drivers/ata/pata_macio.c:1347:1: error: 'pata_macio_patch' undeclared here (not in a function)
> drivers/ata/pata_macio.c:1347:1: error: '__mod_of__pata_macio_patch_device_table' aliased to undefined symbol 'pata_macio_patch'
> 
> Caused by commit
> 
>   5d8619769cf5 ("ata: pata_macio: Fix module autoload for OF platform driver")
> 
> A simple typo ("patch" v "match"), but clearly never build tested.
> 
> Only found after the release.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

Sorry, this was my fault.

When I created the second version of the patch, based on -stable instead of
-next the typo creeped in and I didn't test properly.

Sending a correct version of the patch now.

Apologies,
Luis
