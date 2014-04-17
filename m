From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the userns tree with Linus' tree
Date: Thu, 17 Apr 2014 06:25:00 +0100
Message-ID: <20140417052500.GZ18016@ZenIV.linux.org.uk>
References: <20140417150657.6d67e750081860b30f99715c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:59236 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbaDQFZH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Apr 2014 01:25:07 -0400
Content-Disposition: inline
In-Reply-To: <20140417150657.6d67e750081860b30f99715c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Thu, Apr 17, 2014 at 03:06:57PM +1000, Stephen Rothwell wrote:
> Hi Eric,
> 
> Today's linux-next merge of the userns tree got a conflict in
> fs/namespace.c between various commits from Linus' tree and various
> commits from the userns tree.
> 
> I fixed it up (hopefully - see below) and can carry the fix as necessary
> (no action is required).

Various commits include this:
commit 38129a13e6e71f666e0468e99fdd932a687b4d7e
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu Mar 20 21:10:51 2014 -0400

    switch mnt_hash to hlist

present in v3.14...  It's been there since before the merge window.
