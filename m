From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the nfs tree
Date: Tue, 31 Jul 2012 11:44:26 -0700
Message-ID: <20120731114426.029644e0.akpm@linux-foundation.org>
References: <20120731142441.0d01100f9d050ec6e479c923@canb.auug.org.au>
	<20120731103336.GN612@suse.de>
	<1343745442.519.20.camel@lade.trondhjem.org>
	<20120731151936.GR612@suse.de>
	<1343748906.5528.17.camel@lade.trondhjem.org>
	<20120731175022.GU612@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39033 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755656Ab2GaSo2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Jul 2012 14:44:28 -0400
In-Reply-To: <20120731175022.GU612@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mel Gorman <mgorman@suse.de>
Cc: "Myklebust, Trond" <Trond.Myklebust@netapp.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jeff Layton <jlayton@redhat.com>

On Tue, 31 Jul 2012 18:50:22 +0100
Mel Gorman <mgorman@suse.de> wrote:

> Stephen Rothwell reported a merge conflict between a MM patch "nfs:
> enable swap on NFS" and an NFS patch "nfs: skip commit in
> releasepage if we're freeing memory for fs-related reasons".

grumble.  This happened becase new stuff was added to -next right in
the middle of the merge window.  Please don't dothat.
