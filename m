From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for June 3 (rfkill)
Date: Wed, 3 Jun 2009 17:47:26 +0200
Message-ID: <69e28c910906030847k7e6f97bbo16497d872b93151b@mail.gmail.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
	<4A269539.8020607@oracle.com> <1244042950.4862.10.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1244042950.4862.10.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 3, 2009 at 5:29 PM, Johannes Berg <johannes-cdvu00un1Vhtvz77W8JrvQ@public.gmane.org=
t> wrote:
> On Wed, 2009-06-03 at 08:22 -0700, Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>
>> CFG80211=3Dy
>> MAC80211=3Dy
>> RFKILL=3Dm
>>
>> net/built-in.o: In function `cfg80211_netdev_notifier_call':
>> core.c:(.text+0xa678b): undefined reference to `rfkill_blocked'
>> net/built-in.o: In function `cfg80211_dev_free':
>
> Hrm. I thought
>
> config CFG80211
> =A0 =A0 =A0 =A0tristate "Improved wireless configuration API"
> =A0 =A0 =A0 =A0depends on RFKILL || !RFKILL
>
> would avoid that. Why doesn't it?
>
> johannes
>

Maybe the "y" state of CFG80211 specifically needs to depend on
RFKILL=3Dy || !RFKILL.

BTW should CFG80211=3Dy really be blocked when RFKILL=3Dm? Shouldn't we
just disable CFG80211 RFKILL support in this case (perhaps via a
separate CONFIG_CFG80211_RFKILL automatically configured depending on
CONFIG_RFKILL)?

--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
