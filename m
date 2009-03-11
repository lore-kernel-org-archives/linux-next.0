From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for March 6 (ath9k)
Date: Wed, 11 Mar 2009 10:19:44 -0700
Message-ID: <49B7F2B0.1000702@oracle.com>
References: <20090306191311.697e7b97.sfr@canb.auug.org.au> <49B17320.8010000@oracle.com> <49B17B12.3050200@openwrt.org> <49B17C4E.3000004@oracle.com> <20090306194045.GE3712@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090306194045.GE3712-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

John W. Linville wrote:
> On Fri, Mar 06, 2009 at 11:41:02AM -0800, Randy Dunlap wrote:
>> Gabor Juhos wrote:
>>> Randy Dunlap =EDrta:
>>>> Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Linus' release of -rc7 seems to have stirred people up a bit ...
>>>>>
>>>>> Changes since 20090305:
>>>> when CONFIG_RFKILL=3Dn, ath9k/virtual.c causes:
>>>>
>>>> (.text+0x224e83): undefined reference to `ath_radio_disable'
>>>> (.text+0x224e8b): undefined reference to `ath_radio_enable'
>>>>
>>>>
>>> Hi,
>>>
>>> I have submitted a patch for this already:
>>> http://marc.info/?l=3Dlinux-wireless&m=3D123633468314970&w=3D2
>>>
>>> Should I send it to somewhere else as well?
>> It hasn't propagated into the linux-next merging yet...
>=20
> He just sent it today (or overnight).  I'll get it into wireless-next=
=2E
>=20
> John
>=20
> P.S.  I'm starting to think that RFKILL should just be mandatory...


This build error still happens in linux-next-20090311.

--=20
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
