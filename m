From: Christoph Hellwig <hch@infradead.org>
Subject: Re: livepatching tree for linux-next
Date: Tue, 23 Dec 2014 01:46:07 -0800
Message-ID: <20141223094607.GA16445@infradead.org>
References: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60641 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276AbaLWJqJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Dec 2014 04:46:09 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1412221412360.1680@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-next@vger.kernel.org

On Mon, Dec 22, 2014 at 08:52:02PM +0100, Jiri Kosina wrote:
> Hi Stephen,
> 
> a substantial amount of work has been invested into abstracing "Live 
> Patching" core functionality out of the already existing implementations, 
> so that further improvements can be built on top of it in incremental 
> steps.
> 
> The core functionality (which is self-contained) now works and has been 
> Reviewed/Acked by both interested parties (i.e. people working on kPatch 
> and kGraft) and agreed to be a common ground on which further development 
> will happen.
> 
> We plan to send a pull request for 3.20, therefore I'd like to ask you to 
> include 'for-next' branch of

This is still missing the actual patch generators, which should be
merged together with the code, otherwise we'll get a mess with forever
out of tree tools like systemtap again.
