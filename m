From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Fri, 29 Jun 2018 13:19:31 +0200
Message-ID: <20180629111931.GN2287@suse.cz>
References: <20180627085936.4f9cc4f2@canb.auug.org.au>
 <20180628161102.GJ2287@suse.cz>
 <20180629095858.655ae88f@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629095858.655ae88f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 29, 2018 at 09:58:58AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> On Thu, 28 Jun 2018 18:11:03 +0200 David Sterba <dsterba@suse.cz> wrote:
> >
> > On Wed, Jun 27, 2018 at 08:59:36AM +1000, Stephen Rothwell wrote:
> > > After merging the btrfs-kdave tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
> > > 
> > > fs/btrfs/print-tree.c: In function 'print_extent_item':
> > > fs/btrfs/print-tree.c:56:3: error: implicit declaration of function 'btrfs_print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=implicit-function-declaration]
> > >    btrfs_print_v0_err(eb->fs_info);
> > >    ^~~~~~~~~~~~~~~~~~
> > >    btrfs_print_tree  
> > 
> > Should be fixed in today's branch.
> 
> Sorry, still broken.  I fetched your tree only about 5 minutes ago.

It was a build problem that I did not recognize in my setup
immediatelly, the warning appears only withtout CONFIG_BTRFS_ASSERT.
The branch has been updated, commit 1607c1cbdaa0b6b80b0d4a, sorry for
inconvenience.
