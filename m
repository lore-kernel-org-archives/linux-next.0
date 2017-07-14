From: David Sterba <dsterba@suse.cz>
Subject: Re: Temporary changes regarding btrfs branch in linux-next and
 development patches
Date: Fri, 14 Jul 2017 16:31:36 +0200
Message-ID: <20170714143135.GI2866@twin.jikos.cz>
References: <20170703142108.GZ2866@suse.cz>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-btrfs-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170703142108.GZ2866@suse.cz>
Sender: linux-btrfs-owner@vger.kernel.org
To: dsterba@suse.cz, linux-btrfs@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 03, 2017 at 04:21:08PM +0200, David Sterba wrote:
> in order to allow merging new btrfs patches and also keep linux-next merging
> sane [1], I'm going to freeze any changes to my k.org [2] branch for-next until
> 4.13-rc1 is released, expecting that the conflicting branches get merged as
> well.

The btrfs for-next is going return to it's normal workflow, ie. it'll
get populated by development patches that have been now in the
for-next-test branch. A quick merge test with current linus/master or
linux-next/master shows no problems.

The preferred patch base is still for-4.13-part1, as there's not yet a
public branch for the next pull request.
