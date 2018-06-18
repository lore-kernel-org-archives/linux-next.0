From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 mac80211-next tree
Date: Mon, 18 Jun 2018 22:39:10 +0200
Message-ID: <1529354350.3092.34.camel@sipsolutions.net>
References: <20180616223036.46abefcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180616223036.46abefcb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

On Sat, 2018-06-16 at 22:30 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   f9444b499f68 ("ieee80211: bump IEEE80211_MAX_AMPDU_BUF to support HE")
> 
> is missing a Signed-off-by from its author.

I messed up that commit, I'm really the author. Probably some git-am
left-over configuration. I guess I'll fix it.

Thanks for the heads-up!

johannes
