From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 7 (BROKEN iwlwifi)
Date: Mon, 7 Mar 2011 20:30:14 +0100
Message-ID: <AANLkTik68fcAgBBFYxW_PRuWoF1LS87SPLnihG2ASZN=@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, wireless <linux-wireless@vger.kernel.org>, John Linville <linville@tuxdriver.com>
List-Id: linux-next.vger.kernel.org

linux-next (next-20110307) has still this build-failure with iwlwifi
which was already reported and a fix was offered by Stanislaw.
(JFYI: Build-host is a Debian/sid i386 system.)

/home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/drivers/net/wireless/iwlwifi/iwl-rx.c:
In function 'iwl_rx_card_state_notif':
/home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/drivers/net/wireless/iwlwifi/iwl-rx.c:778:3:
error: 'TASK_INTERRUPTIBLE' undeclared (first use in this function)
/home/sd/src/linux-2.6/linux-2.6.38-rc7/debian/build/source_i386_none/drivers/net/wireless/iwlwifi/iwl-rx.c:778:3:
note: each undeclared identifier is reported only once for each
function it appears in
make[8]: *** [drivers/net/wireless/iwlwifi/iwl-rx.o] Error 1
make[8]: *** Waiting for unfinished jobs....

- Sedat -

[1] iwlwifi-fix-iwl-rx.c-compilation.patch
https://patchwork.kernel.org/patch/614961
