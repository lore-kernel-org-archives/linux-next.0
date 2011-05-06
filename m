From: Sedat Dilek <sedat.dilek-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: linux-next: Tree for May 6 (wireless)
Date: Fri, 6 May 2011 17:44:44 +0200
Message-ID: <BANLkTimqboATe5cO+19Bv5p9dStnwevwng@mail.gmail.com>
References: <20110506154921.47700781.sfr@canb.auug.org.au>
	<20110506084031.a1f2e483.randy.dunlap@oracle.com>
Reply-To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110506084031.a1f2e483.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 6, 2011 at 5:40 PM, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> =
wrote:
> On Fri, 6 May 2011 15:49:21 +1000 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20110505:
>
>
> when PM is not enabled:
>
> net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no m=
ember named 'suspend'
> net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no m=
ember named 'resume'
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

There was a patch sent today, see "[PATCH] mac80211: Fix build error
when CONFIG_PM is not defined" from Larry.

- Sedat -
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
