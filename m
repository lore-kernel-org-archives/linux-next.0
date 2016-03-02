From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unsigned commits in tpmdd tree
Date: Thu, 3 Mar 2016 07:34:41 +1100
Message-ID: <20160303073441.5ba3aa0d@canb.auug.org.au>
References: <20160302074218.7aa0a06b@canb.auug.org.au>
	<20160302142956.GA8341@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41113 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753536AbcCBUen (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2016 15:34:43 -0500
In-Reply-To: <20160302142956.GA8341@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jarkko,

On Wed, 2 Mar 2016 16:29:56 +0200 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, Mar 02, 2016 at 07:42:18AM +1100, Stephen Rothwell wrote:
> > Hi Jarkko,
> > 
> > All the new commits in you tree today have no Signed-off-by from you as
> > the committer.  
> 
> Oops :( This is my mistake. Do you want me to do git reverts and redo
> commits?

Reverting doesn't really fix the problem (since eth original commits
would still be there), you would have to rebase (maybe onto the same
base commit) all the commits and add the Signed-off-by lines.

-- 
Cheers,
Stephen Rothwell
