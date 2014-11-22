From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/12] time: Rename udelay_test.c to test_udelay.c
Date: Fri, 21 Nov 2014 19:45:41 -0800
Message-ID: <20141122034541.GA17842@kroah.com>
References: <1416599058-13836-1-git-send-email-john.stultz@linaro.org>
 <1416599058-13836-2-git-send-email-john.stultz@linaro.org>
 <CAGXu5jLKWOUcf+63HFdYLB6Ge31Xng+QqyKh3KNN7u15EfOVEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGXu5jLKWOUcf+63HFdYLB6Ge31Xng+QqyKh3KNN7u15EfOVEA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Linux-Next <linux-next@vger.kernel.org>, David Riley <davidriley@chromium.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 21, 2014 at 03:30:51PM -0800, Kees Cook wrote:
> On Fri, Nov 21, 2014 at 11:44 AM, John Stultz <john.stultz@linaro.org> wrote:
> > Kees requested that this test module be renamed for consistency sake,
> > so this patch renames the udelay_test.c file (recently added to
> > tip/timers/core for 3.17) to test_udelay.c
> >
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Greg KH <greg@kroah.com>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@elte.hu>
> > Cc: Linux-Next <linux-next@vger.kernel.org>
> > Cc: David Riley <davidriley@chromium.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
