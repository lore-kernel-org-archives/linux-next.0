From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: manual merge of the trivial tree with the vfs tree
Date: Tue, 10 Aug 2010 18:19:01 -0400
Message-ID: <4C61D055.4090909@panasas.com>
References: <20100810121900.cbceb878.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100810121900.cbceb878.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Al Viro <viro@ZenIV.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 08/09/2010 10:19 PM, Stephen Rothwell wrote:
> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> fs/exofs/inode.c between commit 21883a7d05d4c1e97943fa1a587aa2c2a3b09e8c
> ("exofs: New truncate sequence") from the vfs tree and commit
> 426d31071ac476ea62c62656b242930c17b58c00 ("fix printk typo 'faild'") from
> the trivial tree.
> 
> Just context changes.  I fixed it up (see below) and can carry it for a
> while.

The "exofs: New truncate sequence" is now in the Kernel. So perhaps
fix printk typo 'faild'" could be rebased.

Or you can send the patch to me and I'll push it. Which ever you
prefer

Thanks
Boaz
