From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
	wireless-current tree
Date: Wed, 7 Apr 2010 10:44:34 -0400
Message-ID: <20100407144434.GC3146@tuxdriver.com>
References: <20100407125828.d9f03281.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100407125828.d9f03281.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhu Yi <yi.zhu@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 07, 2010 at 12:58:28PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got conflicts in
> drivers/net/wireless/iwlwifi/iwl-core.c,
> drivers/net/wireless/iwlwifi/iwl-tx.c and
> drivers/net/wireless/iwlwifi/iwl-core.h between commit
> de0f60ea94e132c858caa64a44b2012e1e8580b0 ("iwlwifi: avoid Tx queue memory
> allocation in interface down") from the wireless-current tree and commit
> 74bcdb33e99f49ef5202dd2f8109945b4570edc2 ("iwlwifi: move agn only tx
> functions from iwlcore to iwlagn") from the wireless tree.
> 
> The latter moved the code modified by the former.  I couldn't see any
> easy way to fix this up, so I effectively reverted the change in the
> wireless-current tree.  Please do the merge fixup, thanks.

OK, I'll try to negotiate this today.

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
