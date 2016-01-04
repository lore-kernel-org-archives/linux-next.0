From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the integrity tree with the vfs
 tree
Date: Mon, 4 Jan 2016 16:23:08 +1100
Message-ID: <20160104162308.52349acd@canb.auug.org.au>
References: <20160104135221.0e5515ac@canb.auug.org.au>
	<20160104031621.GP9938@ZenIV.linux.org.uk>
	<1451883997.2772.27.camel@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451883997.2772.27.camel@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

Hi Mimi,

On Mon, 04 Jan 2016 00:06:37 -0500 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
>
> On Mon, 2016-01-04 at 03:16 +0000, Al Viro wrote:
> >
> > FWIW, I'm going to pull the part that introduces memdup_user_nul() into
> > a never-rebased branch and if security.git is willing to pull it and handle
> > that conversion in ima_write_policy() themselves, I'll be only glad to drop
> > the corresponding chunk in vfs.git#for-next  
> 
> As memdup_user_nul() is not in the security tree, it would break the
> security tree builds.  Having the patch in the linux-integrity/next
> branch wouldn't help matters.

I think Al intends for you to merge his "never-rebased branch" that
contains the memdup_user_nul patch into the integrity tree (or James to
merge it into the security tree).  He will also merge the same branch
into his vfs tree and remove the patch that updates ima_write_policy()
to use memdup_user_nul() and you (or James) could apply that patch in
the integrity (or security) tree.

This way we end up with the same commit creating memdup_user_nul() in
both trees and no left over conflicts.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
