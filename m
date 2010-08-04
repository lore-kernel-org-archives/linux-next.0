From: "Nori, Sekhar" <nsekhar@ti.com>
Subject: RE: linux-next: manual merge of the davinci tree with Linus' tree
Date: Wed, 4 Aug 2010 21:39:51 +0530
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB59301E7F6ED59@dbde02.ent.ti.com>
References: <20100803114853.27a29365.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:53232 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752313Ab0HDQKJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Aug 2010 12:10:09 -0400
In-Reply-To: <20100803114853.27a29365.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kevin Hilman <khilman@deeprootsystems.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

On Tue, Aug 03, 2010 at 07:18:53, Stephen Rothwell wrote:
> Hi Kevin,
>
> Today's linux-next merge of the davinci tree got a conflict in
> arch/arm/mach-davinci/board-da850-evm.c between commit
> 8b24599e72c9aee1ea1187e29cb9c5de9f449cce ("davinci: da850/omap-l138 evm:
> account for DEFDCDC{2,3} being tied high") from Linus' tree and commit
> ebd1e7808b2fe72d627bdab7bcf61126a831ca5a ("davinci: da850 evm: sparse
> cleanup: make file local variables static") from the davinci tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix
> for a while.

Thanks for fixing this.

Kevin is on a vacation. There would be a delayed response.

Regards,
Sekhar
