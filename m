From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Date: Wed, 6 Jan 2016 09:07:30 +0100
Message-ID: <568CCB42.7090203@suse.cz>
References: <20160106175423.07e00c12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51872 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751997AbcAFIHe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 03:07:34 -0500
In-Reply-To: <20160106175423.07e00c12@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On 2016-01-06 07:54, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   scripts/tags.sh
> 
> between commit:
> 
>   93209d65c1d3 ("tags: Unify emacs and exuberant rules")
> 
> from the kbuild tree and commit:
> 
>   ef0e95208c33 ("page-flags: drop __TestClearPage*() helpers")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

That's correct, thanks.

Michal
