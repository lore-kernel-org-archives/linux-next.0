From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the mtd
 tree
Date: Wed, 5 Jan 2011 09:28:39 -0700
Message-ID: <20110105162839.GC17272@angua.secretlab.ca>
References: <20110105134022.106d9e0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:64073 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801Ab1AEQ2m (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Jan 2011 11:28:42 -0500
Content-Disposition: inline
In-Reply-To: <20110105134022.106d9e0b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <rob.herring@calxeda.com>

On Wed, Jan 05, 2011 at 01:40:22PM +1100, Stephen Rothwell wrote:
> Hi Grant,
> 
> Today's linux-next merge of the devicetree tree got a conflict in
> drivers/mtd/Kconfig between commit
> b7b6e08f9265db56129931983fc6c06d62c9f4f9 (mtd: Fix MTD_OF_PARTS for all
> arch and minor tidy of MTD_PARTITIONS"") from the mtd tree and commit
> 236cdc7bc718566a7e7cb9f763b51a8dcad88cbe ("of: make drivers depend on
> CONFIG_OF instead of CONFIG_PPC_OF") from the devicetree tree.
> 
> I just used the version from the mtd tree.

Thanks Stephen.  I've taken a look at both patches, and I agree that
is the correct resolution.

g.
