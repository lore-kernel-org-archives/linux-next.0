From: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for Aug 28 [ xhci build breakage ]
Date: Wed, 28 Aug 2013 12:38:33 +0200
Message-ID: <CA+icZUVsG-1J2oYF+AeHsxonG2ABW4d0464yijNwaq7R5k94SQ@mail.gmail.com>
References: <CA+icZUUTBYMxLPBv2fq86h3dxyANhtpd6=Q4XGMscrntPNA9bQ@mail.gmail.com>
	<CA+icZUW6JMa6VoRJ62AUZDpYm2_q_tzSM0Ryb56RNnCdEhwQyA@mail.gmail.com>
	<CA+icZUVTzMxS4f3kZnauDkrpf4vwMbS3zd7ECOhE37S_FF83UA@mail.gmail.com>
Reply-To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+icZUVTzMxS4f3kZnauDkrpf4vwMbS3zd7ECOhE37S_FF83UA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Kasatkin <d.kasatkin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 28, 2013 at 12:29 PM, Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Aug 28, 2013 at 11:56 AM, Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Aug 28, 2013 at 11:49 AM, Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi all,
>>>
>>> Changes since 20130827:
>>>
>>> The f2fs tree lost its build failure.
>>>
>>> The md tree gained a conflict against the arm tree.
>>>
>>> The libata tree lost its build failure.
>>>
>>> The spi tree lost its build failure.
>>>
>>> The arm-soc tree gained conflicts against the usb tree.
>>>
>>> The dma-mapping tree gained a conflict against the driver-core tree.
>>>
>>> The akpm-current tree gained a conflict against the net tree.
>>>
>>> ----------------------------------------------------------------------------
>>>
>>> My build here breaks like this:
>>>
>>>   CC      drivers/usb/host/xhci-ring.o
>>>   CC      drivers/video/console/softcursor.o
>>> drivers/usb/host/xhci-ring.c: In function 'xhci_queue_intr_tx':
>>> drivers/usb/host/xhci-ring.c:3090:3: error: implicit declaration of
>>> function 'DEFINE_DYNAMIC_DEBUG_METADATA'
>>> [-Werror=implicit-function-declaration]
>>> drivers/usb/host/xhci-ring.c:3090:3: error: 'descriptor' undeclared
>>> (first use in this function)
>>> drivers/usb/host/xhci-ring.c:3090:3: note: each undeclared identifier
>>> is reported only once for each function it appears in
>>> drivers/usb/host/xhci-ring.c:3090:3: error: implicit declaration of
>>> function '__dynamic_pr_debug' [-Werror=implicit-function-declaration]
>>> drivers/usb/host/xhci-ring.c: In function 'xhci_queue_isoc_tx_prepare':
>>> drivers/usb/host/xhci-ring.c:3875:3: error: 'descriptor' undeclared
>>> (first use in this function)
>>> cc1: some warnings being treated as errors
>>> make[5]: *** [drivers/usb/host/xhci-ring.o] Error 1
>>> make[4]: *** [drivers/usb/host] Error 2
>>>
>>> My kernel-config is attached.
>>>
>>
>> Looks like <linux/device.h> or <linux/dynamic_debug.h> is missing.
>>
>> $ egrep -w '__dynamic_pr_debug|DEFINE_DYNAMIC_DEBUG_METADATA' -nr linux/include/
>> linux/include/linux/device.h:1118:
>> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);                 \
>> linux/include/linux/device.h:1121:
>> __dynamic_pr_debug(&descriptor, pr_fmt(fmt),            \
>> linux/include/linux/dynamic_debug.h:45:int __dynamic_pr_debug(struct
>> _ddebug *descriptor, const char *fmt, ...);
>> linux/include/linux/dynamic_debug.h:63:#define
>> DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)         \
>> linux/include/linux/dynamic_debug.h:76:
>> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
>> linux/include/linux/dynamic_debug.h:78:
>> __dynamic_pr_debug(&descriptor, pr_fmt(fmt),    \
>> linux/include/linux/dynamic_debug.h:84:
>> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
>> linux/include/linux/dynamic_debug.h:92:
>> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
>> linux/include/linux/dynamic_debug.h:101:
>> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor,               \
>>
>> Can't say which one is preferred here.
>>
>
> looks like device.h is preferred or used in the sources, but this does
> not fix the issue here.
> sth. wrong with dev_dbg_ratelimited()?
>

That change seems to cause the problems:

commit 0730d52a86919300a39a2be37f6c140997dfb82f
"xhci:prevent "callbacks suppressed" when debug is not enabled"

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/drivers/usb/host/xhci-ring.c?h=usb-next&id=0730d52a86919300a39a2be37f6c140997dfb82f
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
