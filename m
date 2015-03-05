From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 5 (iwlwifi/mvm)
Date: Thu, 05 Mar 2015 15:41:21 -0800
Message-ID: <54F8E9A1.3040408@infradead.org>
References: <20150305143417.0c301f17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150305143417.0c301f17@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, ilw@linux.intel.com
List-Id: linux-next.vger.kernel.org

On 03/04/15 19:34, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150304:
> 

on i386, when IWLWIFI_DEBUGFS is not enabled:


../drivers/net/wireless/iwlwifi/mvm/phy-ctxt.c:179:38: error: 'struct iwl_mvm' has no member named 'dbgfs_rx_phyinfo'
../drivers/net/wireless/iwlwifi/mvm/mac-ctxt.c:1378:30: error: 'struct iwl_mvm_vif' has no member named 'mvm'


-- 
~Randy
