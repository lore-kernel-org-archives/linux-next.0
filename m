From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Mon, 6 Feb 2017 18:01:20 +0100
Message-ID: <CAO3366y+pGVY78BDtgkeqDenKqfnhdpxaRRFPUjnw2bwoMGYnQ@mail.gmail.com>
References: <20170206151638.6e0f8a60@canb.auug.org.au> <20170206085042.GA3726@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206085042.GA3726@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 6, 2017 at 9:50 AM, Greg KH <greg@kroah.com> wrote:
> On Mon, Feb 06, 2017 at 03:16:38PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> After merging the tty tree, today's linux-next build
>> (arm_multi_v7_defconfig) produced this warning:
>>
>> drivers/tty/serial/sh-sci.c:977:12: warning: 'scif_set_rtrg' defined but not used [-Wunused-function]
>>  static int scif_set_rtrg(struct uart_port *port, int rx_trig)
>>             ^
>>
>> Introduced by commit
>>
>>   a380ed461f66 ("serial: sh-sci: implement FIFO threshold register setting")
>>
>> Forgot to add a call to this new function?
>
> I think this is fixed by a patch I just took into my tree, which isn't
> in linux-next yet.  Right Ulrich?

That is correct, it's called in "[PATCH v4 2/4] serial: sh-sci:
SCIFA/B RX FIFO software timeout".

CU
Uli
