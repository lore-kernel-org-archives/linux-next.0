From: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Subject: Re: linux-next: Tree for June 26
Date: Sun, 29 Jun 2008 02:15:02 +0200
Message-ID: <200806290215.03792.rjw@sisk.pl>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au> <1214646863.2660.22.camel@jaswinder.satnam> <1214649164.10393.265.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1214649164.10393.265.camel-ZP4jZrcIevRpWr+L1FloEB2eb7JE58TQ@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, "Maciej W. Rozycki" <macro-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Saturday, 28 of June 2008, David Woodhouse wrote:
> On Sat, 2008-06-28 at 15:24 +0530, Jaswinder Singh wrote:
> > Here is updated patch :-
> > 
> > http://git.infradead.org/users/jaswinder/firm-jsr-2.6.git?a=commitdiff;h=aa8b184d8eb4f1d7b5e37d5ad449fb7c02ad79c2
> 
> You can ignore that; it's just the same as today's linux-next (which in
> turn is just the same as yesterday's + the patch which fixes the problem
> for Kamalesh but not for you + the other minor error path cleanup.
> 
> Please could you try the other debugging patch I just sent, on top of
> today's linux-next? It should confirm that you're using the 'Tso5'
> firmware, as I told Jaswinder yesterday, and give us a little more clue
> as to what's going on.

I tested with the debug patch on top of
http://git.infradead.org/users/jaswinder/firm-jsr-2.6.git?a=commitdiff;h=aa8b184d8eb4f1d7b5e37d5ad449fb7c02ad79c2

dmesg output is at: http://www.sisk.pl/kernel/debug/20080627/dmesg-1.log
the .config is at: http://www.sisk.pl/kernel/debug/20080627/config-1

and it looks like the card just can't load the firmware.

> This is your machine, right? ...
> 
> http://www.ussg.iu.edu/hypermail/linux/kernel/0709.3/1619.html

Yes, this is the one.

Thanks,
Rafael
