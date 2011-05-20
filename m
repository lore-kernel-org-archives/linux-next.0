From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 20 (iwlwifi)
Date: Fri, 20 May 2011 10:54:21 -0700
Message-ID: <20110520105421.3766ea12.randy.dunlap@oracle.com>
References: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, 20 May 2011 16:55:07 +1000 Stephen Rothwell wrote:

> Hi all,


drivers/net/wireless/iwlwifi/iwl-agn-rs.c:351: error: 'struct iwl_lq_sta' has no member named 'dbg_fixed_rate'
drivers/net/wireless/iwlwifi/iwl-agn-rs.c:1076: error: 'struct iwl_lq_sta' has no member named 'dbg_fixed_rate'

when CONFIG_MAC80211_DEBUGFS is not enabled.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
