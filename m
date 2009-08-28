From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: ext4 tree build warning
Date: Fri, 28 Aug 2009 09:50:04 -0400
Message-ID: <20090828135004.GG16732@mit.edu>
References: <20090827171704.28109c6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:36736 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582AbZH1NuF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Aug 2009 09:50:05 -0400
Content-Disposition: inline
In-Reply-To: <20090827171704.28109c6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Aug 27, 2009 at 05:17:04PM +1000, Stephen Rothwell wrote:
> Hi Ted,
> 
> The linux-next builds (ppc64 allyesconfig) produce this warning:
> (I built with CONFIG_DEBUG_SECTION_MISMATCH=y)
> 
> WARNING: fs/ext4/ext4.o(.text+0x5b6c8): Section mismatch in reference from the function .exit_ext4_mballoc() to the function .exit.text:.ext4_remove_debugfs_entry()
> The function .exit_ext4_mballoc() references a function in an exit section.
> Often the function .ext4_remove_debugfs_entry() has valid usage outside the exit section
> and the fix is to remove the __exit annotation of .ext4_remove_debugfs_entry.

Thanks for pointing that out, I'll get that fixed.

						- Ted
