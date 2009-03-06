From: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: linux-next: Tree for March 6 (ath9k)
Date: Fri, 06 Mar 2009 20:35:46 +0100
Message-ID: <49B17B12.3050200@openwrt.org>
References: <20090306191311.697e7b97.sfr@canb.auug.org.au> <49B17320.8010000@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49B17320.8010000-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap =EDrta:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Linus' release of -rc7 seems to have stirred people up a bit ...
>>
>> Changes since 20090305:
>=20
>=20
> when CONFIG_RFKILL=3Dn, ath9k/virtual.c causes:
>=20
> (.text+0x224e83): undefined reference to `ath_radio_disable'
> (.text+0x224e8b): undefined reference to `ath_radio_enable'
>=20
>=20

Hi,

I have submitted a patch for this already:
http://marc.info/?l=3Dlinux-wireless&m=3D123633468314970&w=3D2

Should I send it to somewhere else as well?

Gabor


--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
