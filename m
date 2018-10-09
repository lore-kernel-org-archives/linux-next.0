From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Tue, 9 Oct 2018 01:23:56 -0400
Message-ID: <20181009052356.GA30286@thunk.org>
References: <20181009105102.752dd9ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181009105102.752dd9ee@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 09, 2018 at 10:51:02AM +1100, Stephen Rothwell wrote:
> Hi Ted,
> 
> After merging the ext4 tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Oops, my bad.  Thanks for catching this.  I failed to a new helper
function inside #ifdef CONFIG_QUOTA .. #endif.

Should be fixed now.

						- Ted
