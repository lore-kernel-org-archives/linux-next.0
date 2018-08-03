From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] mt76x0: build driver only as module
Date: Fri, 03 Aug 2018 13:31:01 +0300
Message-ID: <87va8r68t6.fsf@kamboji.qca.qualcomm.com>
References: <20180803091401.GB10284@redhat.com>
        <87zhy36c4n.fsf@kamboji.qca.qualcomm.com>
        <20180803092822.GD10284@redhat.com>
        <20180803100939.GE10284@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180803100939.GE10284-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Stanislaw Gruszka's message
        of "Fri, 3 Aug 2018 12:09:40 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> On Fri, Aug 03, 2018 at 11:28:22AM +0200, Stanislaw Gruszka wrote:
>> > But this feels like an ugly hack to me. Isn't there a better way to fix
>> > this? (I don't have time to investigate the error in detail right now.)
>> 
>> Yes, rename symbols names. And I will do this, just wanted to provide
>> quick fix for the problem. 
>> 
>> Moreover seems the same thing should be done for mt7601u to avoid build
>> errors and perhaps with mt76 :-( 
>> 
>> So I'm going to rename functions.
>
> I have the patches, I'm building kernel with allyesconfig now,
> it will take a while ...

I'm now hoping to send the pull request tomorrow, so if you can submit a
proper patch some time today that would be good.

-- 
Kalle Valo
