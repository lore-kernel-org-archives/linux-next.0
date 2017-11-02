From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Thu, 2 Nov 2017 15:38:43 +1100
Message-ID: <20171102153843.256e79be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Aastha Gupta <aastha.gupta4104@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/staging/rtlwifi/base.c: In function 'rtl_watch_dog_timer_callback':
drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable 'hw' [-Wunused-variable]
  struct ieee80211_hw *hw = rtlpriv->hw;
                       ^
drivers/staging/rtl8723bs/hal/hal_btcoex.c: In function 'hal_btcoex_Initialize':
drivers/staging/rtl8723bs/hal/hal_btcoex.c:1415:5: warning: unused variable 'ret2' [-Wunused-variable]
  u8 ret2;
     ^
drivers/staging/rtl8723bs/hal/hal_btcoex.c:1414:5: warning: unused variable 'ret1' [-Wunused-variable]
  u8 ret1;
     ^

Introduced by commits

  f8af6a323368 ("staging: rtlwifi: Convert timers to use timer_setup()")
  95b3b4238581 ("staging: rtl8723bs: remove ternary operators in assignmet statments")

-- 
Cheers,
Stephen Rothwell
