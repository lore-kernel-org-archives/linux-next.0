From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: comment in commit in the slave-dma tree (dmaengine:
 dw_dmac: Enhance device tree support)
Date: Tue, 8 Jan 2013 10:19:12 +0530
Message-ID: <CAOh2x=kJjv01bFLKqnAADfnW1t64YjPwM05Xs=5XXR8yB5my1w@mail.gmail.com>
References: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130108093557.8a29d4a04b95702fc59790ff@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 8, 2013 at 4:05 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit 548860697046 ("dmaengine: dw_dmac: Enhance device tree
> support") (which was changed since yesterday :-(), an instance of
> __devinit has been added.  We are in the process of making CONFIG_HOTPLUG
> always true, and since commit 78d86c213f28 ("init.h: Remove __dev*
> sections from the kernel") (included in v3.7), __devinit does nothing.
> Please do not add any more.

When this patch got added, __devinit discussion just started. Because Vinod
missed the merge window, we still have this patch in linux-next.

@Vinod: I hope you can edit this patch yourself?

--
viresh
