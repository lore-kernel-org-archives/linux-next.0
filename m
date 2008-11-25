From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: cpu_alloc tree build failure
Date: Tue, 25 Nov 2008 13:00:42 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0811251300020.18908@quilx.com>
References: <20081124163612.11c6f13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:43039 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751793AbYKYTA5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 14:00:57 -0500
In-Reply-To: <20081124163612.11c6f13d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, 24 Nov 2008, Stephen Rothwell wrote:
>
> I have dropped the cpu_alloc tree for today (it is my day for being hard
> on people :-)) because it breaks the build on a few architectures and the
> fix has been know since at least Nov 7 (when you published a patch that
> doesn't appear in your tree).
>
> If this is caused by an interaction with another tree (and I don't think
> it is), let me know and I will carry the patch.  Otherwise you need to
> fix the cpu_alloc tree.

Looks like Rusy is picking it up. Will review his stuff as it goes in.
