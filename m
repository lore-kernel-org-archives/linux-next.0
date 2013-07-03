From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: Section mismatch in drivers/usb/gadget/fotg210-udc.c
Date: Wed, 3 Jul 2013 13:08:05 -0400
Message-ID: <CAP=VYLrgzpzxS8-JXB9k_WeHcbSVpehEudVTJS04aSuGHHRcWQ@mail.gmail.com>
References: <51C20F3D.1060700@windriver.com> <CAP=VYLpsF7bmF2HZ84_WV0YtbGqHoPDMaE=a9p9UhovHeckkRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP=VYLpsF7bmF2HZ84_WV0YtbGqHoPDMaE=a9p9UhovHeckkRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuan-Hsin Chen <yhchen-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, Jul 3, 2013 at 1:00 PM, Paul Gortmaker
<paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> wrote:
> On Wed, Jun 19, 2013 at 4:06 PM, Paul Gortmaker
> <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> wrote:
>> Hi guys,
>>
>> This was seen on a linux-next (Jun18th tree) allmodconfig build:
>>
>> WARNING: drivers/usb/gadget/fotg210-udc.o(.data+0x0): Section mismatch in reference from the variable fotg210_driver to the function .init.text:fotg210_udc_probe()
>> The variable fotg210_driver references
>> the function __init fotg210_udc_probe()
>> If the reference is valid then annotate the
>> variable with __init* or __refdata (see linux/init.h) or name the variable:
>> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> Hi,
>
> Wondering if this fell through the cracks?   I recall the fix being discussed,
> but yet I'm still seeing the problem when I build today's linux-next, and the
> merge window has already opened on Monday.

I guess Yuan-Hsin isn't even able to see these mails; I'm getting a
rather odd bounce message:

-----------------
Technical details of permanent failure:
Google tried to deliver your message, but it was rejected by the
server for the recipient domain faraday-tech.com by
mailhost1.faraday-tech.com. [210.59.249.140].

The error that the other server returned was:
553 5.1.3 <yhchen-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>... Check FTC account failure!
-----------------

I've no idea what that means, other than the fix will probably have to
come from someone other than Yuan-Hsin...

Paul.
--

>
> Paul.
> --
>
>
>>
>> Paul.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-next" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
