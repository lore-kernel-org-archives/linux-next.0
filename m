From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [-next] comedi I/O accessor name clashes
Date: Fri, 20 Jun 2014 13:20:16 +0200
Message-ID: <CAMuHMdXiwJqCHP0+BPaVn2f2B4eTe957Vun=2ue6FOZk60kPKw@mail.gmail.com>
References: <CAMuHMdVhU6JZFzuPkx=wtLcPYc7wwaMFwCrZu=zG7PmCYssy-g@mail.gmail.com>
 <53A41720.9020609@mev.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <53A41720.9020609@mev.co.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Ian Abbott <abbotti@mev.co.uk>
Cc: driverdevel <devel@driverdev.osuosl.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi Ian,

On Fri, Jun 20, 2014 at 1:12 PM, Ian Abbott <abbotti@mev.co.uk> wrote:
>> drivers/staging/comedi/drivers/ni_atmio.c:318:38: error: macro
>> "writew" passed 3 arguments, but takes just 2

> Thanks, but Hartley has already fixed it and Greg has applied it to his
> staging-next branch.  It should wend it's merry way to linux-next in the
> not-too-distant future.

Thanks, good to hear that!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
