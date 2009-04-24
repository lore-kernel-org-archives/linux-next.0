From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: slab tree boot failure
Date: Fri, 24 Apr 2009 11:13:32 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0904241112150.7258@qirst.com>
References: <20090425005206.943530b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.ultrahosting.com ([74.213.174.254]:51819 "EHLO
	smtp.ultrahosting.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753295AbZDXPWS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2009 11:22:18 -0400
In-Reply-To: <20090425005206.943530b6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Nick Piggin <npiggin@suse.de>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 25 Apr 2009, Stephen Rothwell wrote:

> The last few days linux-next trees have failed to boot on one of our
> PowerPC Power6 servers.  The partial boot log looks like this (full
> log below):

PowerPc has weird boot requirements like bootstrap from a node != 0 and
unavailability of node 0. This has always been a challenge for
bootstrapping any of the slab allocators.
