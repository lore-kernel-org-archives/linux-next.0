From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the wireless
 tree
Date: Wed, 2 Mar 2011 09:26:26 -0500
Message-ID: <20110302142626.GC2889@kroah.com>
References: <20110302172754.412dca34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110302172754.412dca34.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Arend van Spriel <arend@broadcom.com>, Roland Vossen <rvossen@broadcom.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 02, 2011 at 05:27:54PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/brcm80211/brcmsmac/wl_mac80211.c between commit
> 7bb4568372856688bc070917265bce0b88bb7d4d ("mac80211: make tx() operation
> return void") from the wireless tree (where this file is called
> drivers/staging/brcm80211/sys/wl_mac80211.c) and commits
> 62b54dca17ef40116491b0ca27ca35fbe9daedc6 ("staging: brcm80211: cleanup
> function prototypes in header files") and
> 55182a10063c40eda4dc5afecff712e5c3617ffc ("staging: brcm80211: cosmetic
> changes") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, that looks good to me.

greg k-h
