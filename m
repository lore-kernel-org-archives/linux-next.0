From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Date: Thu, 07 Nov 2013 10:49:00 +0100
Message-ID: <527B620C.1090801@suse.cz>
References: <20131107173749.020fb3e03248c6b3227fe642@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42137 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752433Ab3KGJtF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Nov 2013 04:49:05 -0500
In-Reply-To: <20131107173749.020fb3e03248c6b3227fe642@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Josh Triplett <josh@joshtriplett.org>

On 7.11.2013 07:37, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> scripts/bloat-o-meter between commit 21cf6e584ce3 ("kbuild,
> bloat-o-meter: fix static detection") from the kbuild tree and commit
> 372dd3b27736 ("scripts/bloat-o-meter: ignore changes in the size of
> linux_banner") from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

I sucked the bloat-o-meter fixes into the kbuild tree.

Michal
