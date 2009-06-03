From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 3 (rfkill)
Date: Wed, 03 Jun 2009 10:20:18 -0700
Message-ID: <4A26B0D2.3090207@oracle.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
	<4A269539.8020607@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <wimax-bounces@linuxwimax.org>
In-Reply-To: <4A269539.8020607@oracle.com>
List-Unsubscribe: <http://lists.linuxwimax.org/options/wimax>,
	<mailto:wimax-request@linuxwimax.org?subject=unsubscribe>
List-Archive: <http://lists.linuxwimax.org/pipermail/wimax>
List-Post: <mailto:wimax@linuxwimax.org>
List-Help: <mailto:wimax-request@linuxwimax.org?subject=help>
List-Subscribe: <http://lists.linuxwimax.org/listinfo/wimax>,
	<mailto:wimax-request@linuxwimax.org?subject=subscribe>
Sender: wimax-bounces@linuxwimax.org
Errors-To: wimax-bounces@linuxwimax.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: wimax@linuxwimax.org, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-wimax@intel.com, linux-next@vger.kernel.org, johannes@sipsolutions.net
List-Id: linux-next.vger.kernel.org

Randy Dunlap wrote:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Looks like a real rush since -rc7 ...
> 
> 
> CFG80211=y
> MAC80211=y
> RFKILL=m
> 
> net/built-in.o: In function `cfg80211_netdev_notifier_call':
> core.c:(.text+0xa678b): undefined reference to `rfkill_blocked'
> net/built-in.o: In function `cfg80211_dev_free':
> (.text+0xa67e2): undefined reference to `rfkill_destroy'
> net/built-in.o: In function `cfg80211_rfkill_sync_work':
> core.c:(.text+0xa686e): undefined reference to `rfkill_blocked'
> net/built-in.o: In function `wiphy_new':
> (.text+0xa69f2): undefined reference to `rfkill_alloc'
> net/built-in.o: In function `wiphy_rfkill_start_polling':
> (.text+0xa6bd2): undefined reference to `rfkill_resume_polling'
> net/built-in.o: In function `wiphy_rfkill_stop_polling':
> (.text+0xa6bdf): undefined reference to `rfkill_pause_polling'
> net/built-in.o: In function `wiphy_unregister':
> (.text+0xa6bf4): undefined reference to `rfkill_unregister'
> net/built-in.o: In function `wiphy_rfkill_set_hw_state':
> (.text+0xa6c64): undefined reference to `rfkill_set_hw_state'
> net/built-in.o: In function `wiphy_register':
> (.text+0xa6db4): undefined reference to `rfkill_register'
> net/built-in.o: In function `cfg80211_wext_giwtxpower':
> (.text+0xb01e9): undefined reference to `rfkill_blocked'
> net/built-in.o: In function `cfg80211_wext_siwtxpower':
> (.text+0xb0cf3): undefined reference to `rfkill_set_sw_state'
> net/built-in.o: In function `cfg80211_wext_siwtxpower':
> (.text+0xb0d1f): undefined reference to `rfkill_set_sw_state'


Ugh, there are similar errors in the wimax area, which doesn't
seem to mention RFKILL in its Kconfig file at all.  :(

net/built-in.o: In function `wimax_rfkill':
(.text+0x81996): undefined reference to `rfkill_set_sw_state'
net/built-in.o: In function `wimax_report_rfkill_sw':
(.text+0x81ac0): undefined reference to `rfkill_set_sw_state'
net/built-in.o: In function `wimax_report_rfkill_hw':
(.text+0x81bd3): undefined reference to `rfkill_set_hw_state'
net/built-in.o: In function `wimax_rfkill_rm':
(.text+0x81c8f): undefined reference to `rfkill_unregister'
net/built-in.o: In function `wimax_rfkill_rm':
(.text+0x81c9a): undefined reference to `rfkill_destroy'
net/built-in.o: In function `wimax_rfkill_add':
(.text+0x81d52): undefined reference to `rfkill_alloc'
net/built-in.o: In function `wimax_rfkill_add':
(.text+0x81db3): undefined reference to `rfkill_register'
net/built-in.o: In function `wimax_rfkill_add':
(.text+0x81e2d): undefined reference to `rfkill_destroy'


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
