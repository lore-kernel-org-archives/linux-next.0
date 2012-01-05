From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: build failure after merge of the pci-current tree
Date: Wed, 4 Jan 2012 19:27:30 -0500
Message-ID: <20120105002729.GA27916@redhat.com>
References: <20120105110712.2666364926458942240d6534@canb.auug.org.au>
 <20120104161122.4e9d844a@jbarnes-desktop>
 <20120105111940.e5675c8d16715767ed193461@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42375 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757264Ab2AEA1h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jan 2012 19:27:37 -0500
Content-Disposition: inline
In-Reply-To: <20120105111940.e5675c8d16715767ed193461@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 05, 2012 at 11:19:40AM +1100, Stephen Rothwell wrote:
 > Hi Jesse,
 > 
 > On Wed, 4 Jan 2012 16:11:22 -0800 Jesse Barnes <jbarnes@virtuousgeek.org> wrote:
 > >
 > > Arg failure of my hand merge.
 > 
 > Not really, the original was broken (as is the version in fc16 (which has
 > been disabled there)).

ugh, sorry about that. too many trees.

the one I build-tested had it right, but I generated an incremental
from a wrong one..

	Dave
