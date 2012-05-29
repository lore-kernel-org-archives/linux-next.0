From: Eyal Shapira <eyal-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] wlcore: fix undefined symbols when CONFIG_PM is not defined
Date: Tue, 29 May 2012 01:16:43 -0700
Message-ID: <CAF8O4-x+d8_Aq-CBcpdnmdAnuV=6V9bs4kgeNKEHAbZjWM_4-Q@mail.gmail.com>
References: <CAMuHMdVv+g=+A1HHNmWWcsFBQjRXNNA437V6-g80cYq7zRJ78g@mail.gmail.com>
 <1338275703-28103-1-git-send-email-eyal@wizery.com> <20120529175438.0e68273020662870497d8201@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120529175438.0e68273020662870497d8201-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 29 May 2012 00:54, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
> Hi Eyal,
>
> On Tue, 29 May 2012 00:15:03 -0700 Eyal Shapira <eyal-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wro=
te:
>>
>> commit 5063c201d7b799d6cb36d3edfc2c2c3db3b400e5
>> "wl12xx: add RX filters ACX commands" breaks the build
>> when CONFIG_PM isn't defined:
>
> Just wondering what this applies to as there is no such commit (SHA1)=
 in
> linux-next. =A0Ah, actually this is commit c21eebb50379 in Linus' tre=
e.

Stephen - you're right. The commit I've referenced refers to Luca's rep=
o
and not linux-next. I'll send a v2 with the correct commit.
Thanks

>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr-3FnU+UHB4dPYtjvyW6yDsg@public.gmane.org=
=2Eorg.au
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
