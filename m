From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the wireless-next tree
Date: Tue, 4 Mar 2014 15:49:39 -0800
Message-ID: <20140304234939.GB25144@kroah.com>
References: <20140225133537.55ce6935e55faa6aeae53d89@canb.auug.org.au>
 <20140225190715.GA4384@tuxdriver.com>
 <20140226074738.0b530aebe4cde54216698d91@canb.auug.org.au>
 <20140305101627.1d9e3a0941dbadbc6f0a7733@canb.auug.org.au>
 <20140305102109.948255688bc31a030fdd49d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140305102109.948255688bc31a030fdd49d7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Mar 05, 2014 at 10:21:09AM +1100, Stephen Rothwell wrote:
> Hi John,
> 
> On Wed, 5 Mar 2014 10:16:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > If I revert commit 161d78555435 "Revert "Staging: rtl8812ae: remove
> > modules field of rate_control_ops"", it fails differently:
> > 
> > In file included from drivers/staging/wlan-ng/p80211netdev.c:91:0:
> > drivers/staging/wlan-ng/cfg80211.c: In function 'prism2_scan':
> > drivers/staging/wlan-ng/cfg80211.c:419:10: error: implicit declaration of function 'ieee80211_dsss_chan_to_freq' [-Werror=implicit-function-declaration]
> >           ieee80211_dsss_chan_to_freq(msg2.dschannel.data)),
> >           ^
> > drivers/staging/rtl8821ae/rtl8821ae/trx.c: In function 'rtl8821ae_rx_query_desc':
> > drivers/staging/rtl8821ae/rtl8821ae/trx.c:619:3: warning: passing argument 1 of 'ieee80211_is_robust_mgmt_frame' from incompatible pointer type [enabled by default]
> >    if ((ieee80211_is_robust_mgmt_frame(hdr)) &&
> >    ^
> > In file included from include/net/mac80211.h:20:0,
> >                  from drivers/staging/rtl8821ae/rtl8821ae/../wifi.h:38,
> >                  from drivers/staging/rtl8821ae/rtl8821ae/trx.c:30:
> > include/linux/ieee80211.h:2286:20: note: expected 'struct sk_buff *' but argument is of type 'struct ieee80211_hdr *'
> >  static inline bool ieee80211_is_robust_mgmt_frame(struct sk_buff *skb)
> >                     ^
> > drivers/staging/rtl8821ae/rtl8821ae/dm.c: In function 'rtl8821ae_dm_clear_txpower_tracking_state':
> > drivers/staging/rtl8821ae/rtl8821ae/dm.c:487:31: warning: iteration 2u invokes undefined behavior [-Waggressive-loop-optimizations]
> >    rtldm->bb_swing_idx_ofdm[p] = rtldm->default_ofdm_index;
> >                                ^
> > drivers/staging/rtl8821ae/rtl8821ae/dm.c:485:2: note: containing loop
> >   for (p = RF90_PATH_A; p < MAX_RF_PATH; ++p) {
> >   ^
> > 
> > So please revert 161d78555435, and then fix this other error.
> 
> That fix could be a simple as just disabling the affected staging tree
> driver and letting Greg know.  Or you could actually fix it.

John and Larry and I have been talking about how to handle some
cross-tree issues, and I should be merging with his tree soon to handle
them, hopefully this will get resolved at that point in time as well.

thanks,

greg k-h
