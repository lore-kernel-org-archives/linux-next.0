From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with
 Linus' tree
Date: Thu, 24 Aug 2017 11:17:53 +1000
Message-ID: <20170824111753.2b1c508e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

As expetced, today's linux-next merge of the wireless-drivers-next tree
got a conflict in:

  drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c

between commit:

  92b0f7b26b31 ("iwlwifi: split the regulatory rules when the bandwidth flags require it")

from Linus' tree and commit:

  b823cf3bae81 ("iwlwifi: update channel flags parser")

from the wireless-drivers-next tree.

I fixed it up (see below - Luca, Kalle, thanks for the heads up) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
index 3ee6767392b6,aa382f719988..000000000000
--- a/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
@@@ -864,11 -908,11 +911,11 @@@ iwl_parse_nvm_mcc_info(struct device *d
  		rule->flags |= NL80211_RRF_AUTO_BW;
  		rule->freq_range.max_bandwidth_khz = 0;
  
 -		prev_ch_flags = ch_flags;
  		prev_center_freq = center_freq;
 +		prev_reg_rule_flags = reg_rule_flags;
  
  		IWL_DEBUG_DEV(dev, IWL_DL_LAR,
- 			      "Ch. %d [%sGHz] %s%s%s%s%s%s%s%s%s(0x%02x) reg_flags 0x%x: %s\n",
 -			      "Ch. %d [%sGHz] %s%s%s%s%s%s%s%s%s%s%s%s(0x%02x): %s\n",
++			      "Ch. %d [%sGHz] %s%s%s%s%s%s%s%s%s%s%s%s(0x%02x) reg_flags 0x%x: %s\n"
  			      center_freq,
  			      band == NL80211_BAND_5GHZ ? "5.2" : "2.4",
  			      CHECK_AND_PRINT_I(VALID),
@@@ -878,9 -926,8 +929,8 @@@
  			      CHECK_AND_PRINT_I(40MHZ),
  			      CHECK_AND_PRINT_I(80MHZ),
  			      CHECK_AND_PRINT_I(160MHZ),
- 			      CHECK_AND_PRINT_I(INDOOR_ONLY),
- 			      CHECK_AND_PRINT_I(GO_CONCURRENT),
+ 			      CHECK_AND_PRINT_I(DC_HIGH),
 -			      ch_flags,
 +			      ch_flags, reg_rule_flags,
  			      ((ch_flags & NVM_CHANNEL_ACTIVE) &&
  			       !(ch_flags & NVM_CHANNEL_RADAR))
  					 ? "Ad-Hoc" : "");
