From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: net/kbuild trees build failure
Date: Mon, 7 Dec 2009 12:41:58 +0100
Message-ID: <20091207114158.GA2428@merkur.ravnborg.org>
References: <20091207200317.57820f0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:53878 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933756AbZLGLly (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2009 06:41:54 -0500
Content-Disposition: inline
In-Reply-To: <20091207200317.57820f0a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "John W. Linville" <linville@tuxdriver.com>

On Mon, Dec 07, 2009 at 08:03:17PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> In file included from drivers/net/wireless/iwlwifi/iwl3945-base.c:57:
> drivers/net/wireless/iwlwifi/iwl-core.h:66:30: error: linux/utsrelease.h: No such file or directory
> 
> Caused by commit 250cce26d5d03337aec4ff8405121f026adb4a89 ("iwlwifi:
> driver version track kernel version") from the net tree interacting with
> commit 8e5c76aace9705b6983cfbf5eb2f2e869dab6738 ("kbuild: move
> utsrelease.h to include/generated") from the kbuild tree.
> 
> I applied this patch for today (and will carry it as necessary):

The right fix would be to use 'utsname()->sysname' (I think sysname
is the right member).

Then we should also be uts namespace aware.

	Sam
