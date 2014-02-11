From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 11  (staging/rtl8821ae/)
Date: Tue, 11 Feb 2014 10:14:52 -0800
Message-ID: <52FA689C.7090103@infradead.org>
References: <20140211172136.37976e8c5e7b81ce11f30b34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140211172136.37976e8c5e7b81ce11f30b34@canb.auug.org.au>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/10/2014 10:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> This tree fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140210:
> 

on i386:

ERROR: "ieee80211_rx_irqsafe" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_beacon_get_tim" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_unregister_hw" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "rate_control_send_low" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_stop_queue" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_rate_control_register" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "wiphy_to_ieee80211_hw" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_stop_tx_ba_cb_irqsafe" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_tx_status_irqsafe" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_find_sta" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_wake_queue" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_rate_control_unregister" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_register_hw" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_start_tx_ba_session" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_alloc_hw" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_free_hw" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_connection_loss" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!
ERROR: "ieee80211_start_tx_ba_cb_irqsafe" [drivers/staging/rtl8821ae/rtl8821ae.ko] undefined!

when CONFIG_MAC80211 is not enabled.
Looks like it should also depend on MAC80211.



-- 
~Randy
