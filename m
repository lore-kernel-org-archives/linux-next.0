From: Emmanuel Grumbach <egrumbach@gmail.com>
Subject: Re: linux-next: Tree for Mar 5 (iwlwifi/mvm)
Date: Fri, 6 Mar 2015 10:18:32 +0200
Message-ID: <CANUX_P1_Zb1TEBtOkKbyFjJLGO6fJcE3Z7dSCRo9Q9NHMvn2Fw@mail.gmail.com>
References: <20150305143417.0c301f17@canb.auug.org.au>
	<54F8E9A1.3040408@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F8E9A1.3040408@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ilw@linux.intel.com" <ilw@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 6, 2015 at 1:41 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 03/04/15 19:34, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150304:
>>
>
> on i386, when IWLWIFI_DEBUGFS is not enabled:
>
>
> ../drivers/net/wireless/iwlwifi/mvm/phy-ctxt.c:179:38: error: 'struct iwl_mvm' has no member named 'dbgfs_rx_phyinfo'
> ../drivers/net/wireless/iwlwifi/mvm/mac-ctxt.c:1378:30: error: 'struct iwl_mvm_vif' has no member named 'mvm'
>
>
Yes - I am sorry about that. I'll fix it on Sunday.
