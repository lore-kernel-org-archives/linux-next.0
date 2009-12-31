From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: wireless tree build warnings
Date: Thu, 31 Dec 2009 13:00:05 +1100
Message-ID: <20091231130005.6fa2b865.sfr@canb.auug.org.au>
References: <20091231105709.c50f22c0.sfr@canb.auug.org.au>
	<4B3BF6D1.6010209@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Dec_2009_13_00_05_+1100_kDYm/IAAsx3ZK4k3"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752979AbZLaCAN@vger.kernel.org>
In-Reply-To: <4B3BF6D1.6010209@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?IlJlbsOpIEJvbGxkb3JmIg==?= <xsecute@googlemail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__31_Dec_2009_13_00_05_+1100_kDYm/IAAsx3ZK4k3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ren=C3=A9, On Thu, 31 Dec 2009 01:56:49 +0100 Ren=C3=A9 Bolldorf <xsecut=
e@googlemail.com> wrote:
>
> On 12/31/09 00:57, Stephen Rothwell wrote:
> > Hi John,
> >
> > Today's linux-next build (i386 defconfig) produced thes warnings:
> >
> > net/mac80211/work.c: In function 'ieee80211_remain_on_channel_timeout':
> > net/mac80211/work.c:534: warning: cast from pointer to integer of diffe=
rent size
> > net/mac80211/work.c: In function 'ieee80211_remain_done':
> > net/mac80211/work.c:1030: warning: cast from pointer to integer of diff=
erent size
> > net/mac80211/work.c: In function 'ieee80211_wk_remain_on_channel':
> > net/mac80211/work.c:1056: warning: cast from pointer to integer of diff=
erent size
> > net/mac80211/work.c: In function 'ieee80211_wk_cancel_remain_on_channel=
':
> > net/mac80211/work.c:1072: warning: cast from pointer to integer of diff=
erent size
> >
> > Introduced by commits e4da8c37af626001ff704fb29ea14eb58f5f7208
> > ("mac80211: make off-channel work generic") and
> > b8bc4b0aa9bfba755c64b11b8f60e6cfab25dc9d ("mac80211: support
> > remain-on-channel command").
> >
>=20
> shouldn't it be u32 instead of u64? Please correct me if I'am wrong.
>=20
> Example:
> cfg80211_ready_on_channel(wk->sdata->dev, (u32)wk, wk->chan,
> 		wk->chan_type, wk->remain.duration, GFP_KERNEL);
> instead of:
> cfg80211_ready_on_channel(wk->sdata->dev, (u64)wk, wk->chan,
> 		wk->chan_type, wk->remain.duration, GFP_KERNEL);

the prototype is:

void cfg80211_ready_on_channel(struct net_device *dev, u64 cookie,
                               struct ieee80211_channel *chan,
                               enum nl80211_channel_type channel_type,
                               unsigned int duration, gfp_t gfp);

And in the case in point, "wk" is a pointer, so casting that to a u32
would be even worse on a 64bit architecture.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Dec_2009_13_00_05_+1100_kDYm/IAAsx3ZK4k3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks8BaUACgkQjjKRsyhoI8y4yQCfUBXeCfKufE8Pf9Ioe0hsz/QX
0ZAAn2HozEa/XRfT52mjB15VYiuTAKiL
=FrV8
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Dec_2009_13_00_05_+1100_kDYm/IAAsx3ZK4k3--
