From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the edac tree with the trivial
 tree
Date: Tue, 22 May 2012 10:55:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1205221055340.16396@pobox.suse.cz>
References: <20120518160603.0eddece830f829d3b8570ac7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52152 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755923Ab2EVI4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 May 2012 04:56:05 -0400
In-Reply-To: <20120518160603.0eddece830f829d3b8570ac7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Mackey <tdmackey@twitter.com>, Vinson Lee <vlee@twitter.com>

On Fri, 18 May 2012, Stephen Rothwell wrote:

> Hi Mauro,
> 
> Today's linux-next merge of the edac tree got a conflict in
> drivers/edac/edac_core.h between commit 15ed103a9800 ("edac: Fix spelling
> errors") from the trivial tree and commit 90b40d5cadba ("edac: Remove the
> legacy EDAC ABI") from the edac tree.
> 
> One of the comments fixed by the former is removed by the latter, so I
> did that.

On Fri, 18 May 2012, Stephen Rothwell wrote:

> Hi Mauro,
> 
> Today's linux-next merge of the edac tree got a conflict in
> drivers/edac/edac_device.c between commit 15ed103a9800 ("edac: Fix
> spelling errors") from the trivial tree and commit b9e889c84229 ("edac:
> rewrite edac_align_ptr()") from the edac tree.
> 
> One of the comments fixed by the former is removed by the latter, so I
> did that.

I have dropped both hunks, so the conflict should be gone. Thanks.

-- 
Jiri Kosina
SUSE Labs
