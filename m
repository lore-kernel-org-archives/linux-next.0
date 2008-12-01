From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: [ipw3945-devel] next-20081125: call trace for iwlagn (rfkill
	switch on)
Date: Mon, 01 Dec 2008 10:39:43 -0800
Message-ID: <1228156783.10900.21.camel@rc-desk>
References: <20081128063859.GB4700@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:10062 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753310AbYLASis (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2008 13:38:48 -0500
In-Reply-To: <20081128063859.GB4700@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-ipw3945-devel@schottelius.org>
Cc: "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, 2008-11-27 at 22:38 -0800, Nico -telmich- Schottelius wrote:
> Hello!
> 
> After a fresh reboot and enabled rfkill switch (-> radio turned off!),
> I get the following call trace:
> 
> [   89.169572] iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
> [   89.169791] iwlagn 0000:03:00.0: restoring config space at offset 0x1 (was 0x100102, writing 0x100106)
> [   89.169898] iwlagn 0000:03:00.0: irq 314 for MSI/MSI-X
> [   89.169980] iwlagn 0000:03:00.0: firmware: requesting iwlwifi-5000-1.ucode
> [   89.370030] iwlagn: Radio disabled by HW RF Kill switch
> [   89.381023] ------------[ cut here ]------------
> [   89.381215] WARNING: at net/mac80211/main.c:227 ieee80211_hw_config+0x71/0x79 [mac80211]()
> [   89.381455] Modules linked in: rfcomm l2cap bluetooth uinput autofs4 ipv6 cpufreq_powersave md_mod loop sha256_generic ansi_cprng krng chainiv rng aes_x86_64 aes_generic cbc dm_crypt dm_mod arc4 ecb cryptomgr aead crypto_blkcipher crypto_hash snd_hda_intel snd_pcm snd_page_alloc iwlagn snd_hwdep iwlcore thinkpad_acpi snd_seq snd_timer snd_seq_device rfkill snd hwmon mac80211 video wmi rtc_cmos rtc_core i2c_i801 backlight led_class e1000e output soundcore rtc_lib intel_agp uhci_hcd ehci_hcd i2c_core cfg80211 nvram usbcore pcspkr
> [   89.384858] Pid: 3923, comm: NetworkManager Not tainted 2.6.28-rc6-next-20081125-denkbrett #15
> [   89.385074] Call Trace:

The driver does not send a command to hardware if HW RF Kill switch is
enabled. This causes a command sent by mac80211 stack to fail as
expected. This warning can be ignored. We need to work out how to
address this issue and not make it appear as a failure.

Reinette
