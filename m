From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip tree
Date: Fri, 1 Aug 2014 19:38:26 -0400
Message-ID: <CAGXu5jKD5X4ZZreierjWsB659pXJgc9eXJX==Wm+-R22nKY+xQ@mail.gmail.com>
References: <20140731170735.5cf2062b@canb.auug.org.au>
	<20140801002017.GA2945@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140801002017.GA2945@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Riley <davidriley@chromium.org>, John Stultz <john.stultz@linaro.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 31, 2014 at 8:20 PM, Greg KH <greg@kroah.com> wrote:
> On Thu, Jul 31, 2014 at 05:07:35PM +1000, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next merge of the driver-core tree got a conflict in
>> lib/Kconfig.debug between commit e704f93af5a0 ("kernel: time: Add
>> udelay_test module to validate udelay") from the tip tree and commit
>> 0a8adf584759 ("test: add firmware_class loader test") from the
>> driver-core tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>
> Looks good, thanks.

For keeping things regularized, could this module instead be named
"test_udelay", to match the rest of most of the test modules?
(Starting with "test_".)

-Kees

-- 
Kees Cook
Chrome OS Security
