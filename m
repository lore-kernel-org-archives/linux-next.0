From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 23 Dec 2015 07:10:16 +1100
Message-ID: <20151223071016.6ae2f346@canb.auug.org.au>
References: <20151222164210.170ec46c@canb.auug.org.au>
	<87h9jbezsi.fsf@belgarion.home>
	<CACRpkdaXd7nJYpix_nztF6iuSuKYb9H4FMgRr9NcxFRp+vEyzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaXd7nJYpix_nztF6iuSuKYb9H4FMgRr9NcxFRp+vEyzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

On Tue, 22 Dec 2015 10:08:58 +0100 Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Dec 22, 2015 at 7:57 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >  
> >> After merging the gpio tree, today's linux-next build (lots without
> >> CONFIG_OF) failed like this:
> >>
> >> drivers/gpio/gpio-pxa.c: In function 'pxa_gpio_probe':
> >> drivers/gpio/gpio-pxa.c:648:12: error: 'pxa_irq_domain_ops' undeclared (first use in this function)
> >>
> >> Caused by commit
> >>
> >>   384ca3c6a28d ("gpio: pxa: change the interrupt management")
> >>
> >> The reference to pxa_irq_domain_ops was moved out of the protection of
> >> CONFIG_OF ...
> >>
> >> Discovered after the release.  
> >
> > Hi Stephen,
> >
> > The fix has been sent in http://www.spinics.net/lists/kernel/msg2147774.html but
> > did not reach Linus's next tree yet probably.  
> 
> Sorry, I'll pick it now-ish...

Not in the published gpio tree, yet?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
