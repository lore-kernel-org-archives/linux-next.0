From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: build failure after merge of the wireless-next tree
Date: Tue, 25 Feb 2014 14:07:16 -0500
Message-ID: <20140225190715.GA4384@tuxdriver.com>
References: <20140225133537.55ce6935e55faa6aeae53d89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140225133537.55ce6935e55faa6aeae53d89@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Feb 25, 2014 at 01:35:37PM +1100, Stephen Rothwell wrote:
> Hi John,
> 
> After merging the wireless-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/rtl8821ae/rc.c:289:2: error: unknown field 'module' specified in initializer
>   .module = NULL,
>   ^
> 
> Caused by commit 161d78555435 ("Revert "Staging: rtl8812ae: remove
> modules field of rate_control_ops"").
> 
> The commit "Staging: rtl8812ae: remove modules field of rate_control_ops"
> was needed in the wireless-next tree - I said so at the time of reporting
> the original breakage: 
> 
> > Actually, your tree is based on -rc2, so you need this patch already (it
> > should have bee included in the merge commit 841577c3d33b ("Merge branch
> > 'for-john' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next").
> 
> And now that part of the wireless-next tree has migrated to the net-next tree.
> 
> I have no idea why you thought you should revert the fix.
> 
> I have used the wireless tree from next-20140224 for today.

The fix should go through Greg's tree.  I shouldn't have merged it at all.

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
