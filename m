From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the vfs tree
Date: Wed, 3 Apr 2013 23:56:34 -0700
Message-ID: <20130403235634.6bc72c39.akpm@linux-foundation.org>
References: <20130404172648.27834d12cbb68338f4b89482@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53625 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755757Ab3DDG4g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 02:56:36 -0400
In-Reply-To: <20130404172648.27834d12cbb68338f4b89482@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Nathan Zimmer <nzimmer@sgi.com>

On Thu, 4 Apr 2013 17:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> fs/proc/generic.c between several commits from the vfs tree and commit
> "procfs: improve scaling in proc" from the akpm tree.
> 
> I just dropped the akpm tree patch (and the following
> "procfs-improve-scaling-in-proc-v5") as the conflicts are a bit complex.

Well perhaps the vfs tree should start paying some attention to the
rest of the world, particularly after -rc5.
