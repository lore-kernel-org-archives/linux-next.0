From: John Stultz <john.stultz@linaro.org>
Subject: Re: linux-next: build failure after merge of the input tree
Date: Tue, 24 Jan 2012 15:16:32 -0800
Message-ID: <1327446992.11738.8.camel@work-vm>
References: <20120124142516.07860a401ac9216cfa10a6ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120124142516.07860a401ac9216cfa10a6ad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 2012-01-24 at 14:25 +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> After merging the input tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".ktime_get_monotonic_offset" [drivers/input/evdev.ko] undefined!
> 
> Caused by commit 04f2c50e5fd8 ("Input: add infrastructure for selecting
> clockid for event time stamps").
> 
> I have used the input tree from next-20120123 for today.

Huh.

ktime_get_monotonic_offset is a timekeeping core interface, defined
along with ktime_get 

Hrmmm.. Ah. I suspect this will fix it:


Export ktime_get_monotonic_offset for evdev

Signed-off-by: John Stultz <john.stultz@linaro.org>

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 9cf6bbb..9781add 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1230,6 +1230,8 @@ ktime_t ktime_get_monotonic_offset(void)
 	} while (read_seqretry(&xtime_lock, seq));
 	return timespec_to_ktime(wtom);
 }
+EXPORT_SYMBOL_GPL(ktime_get_monotonic_offset);
+
 
 /**
  * xtime_update() - advances the timekeeping infrastructure
