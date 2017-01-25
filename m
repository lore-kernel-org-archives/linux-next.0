From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mfd tree
Date: Wed, 25 Jan 2017 15:54:50 +1100
Message-ID: <20170125155450.6e517bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751137AbdAYEyx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Jan 2017 23:54:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>

Hi Lee,

After merging the mfd tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/pwm/pwm-stm32.c: In function 'stm32_pwm_apply':
drivers/pwm/pwm-stm32.c:204:33: warning: 'curstate.polarity' may be used uninitialized in this function [-Wmaybe-uninitialized]
  if (state->polarity != curstate.polarity)
                                 ^

Introduced by commit

  bafffb6e7bd1 ("pwm: Add driver for STM32 plaftorm")

-- 
Cheers,
Stephen Rothwell
