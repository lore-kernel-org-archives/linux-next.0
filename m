From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH] iwlwifi: fix build error for CONFIG_IWLAGN=n
Date: Wed, 24 Mar 2010 18:37:19 -0400
Message-ID: <20100324223719.GA32563@tuxdriver.com>
References: <4BAA73D2.1000301@oracle.com>
 <1269465799-19060-1-git-send-email-linville@tuxdriver.com>
 <1269466426.6935.8.camel@jlt3.sipsolutions.net>
 <1269466948.2446.3216.camel@rchatre-DESK>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1269466948.2446.3216.camel@rchatre-DESK>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: reinette chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 24, 2010 at 02:42:28PM -0700, reinette chatre wrote:
> On Wed, 2010-03-24 at 14:33 -0700, Johannes Berg wrote:
> > On Wed, 2010-03-24 at 17:23 -0400, John W. Linville wrote:
> > > drivers/net/wireless/iwlwifi/iwl-rx.c: In function 'iwl_good_ack_=
health':
> > > drivers/net/wireless/iwlwifi/iwl-rx.c:647: error: 'struct iwl_pri=
v' has no member named '_agn'
> > >=20
> > > Reported-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> > > Signed-off-by: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> > > ---
> > >  drivers/net/wireless/iwlwifi/iwl-rx.c |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > >=20
> > > diff --git a/drivers/net/wireless/iwlwifi/iwl-rx.c b/drivers/net/=
wireless/iwlwifi/iwl-rx.c
> > > index b6a64d8..2fa30df 100644
> > > --- a/drivers/net/wireless/iwlwifi/iwl-rx.c
> > > +++ b/drivers/net/wireless/iwlwifi/iwl-rx.c
> > > @@ -621,6 +621,7 @@ static void iwl_accumulative_statistics(struc=
t iwl_priv *priv,
> > >  #define BA_TIMEOUT_CNT (5)
> > >  #define BA_TIMEOUT_MAX (16)
> > > =20
> > > +#if defined(CONFIG_IWLAGN) || defined(CONFIG_IWLAGN_MODULE)
> > >  /**
> > >   * iwl_good_ack_health - checks for ACK count ratios, BA timeout
> > > retries.
> >=20
> > I thought we had a patch moving it?
> >=20
>=20
> We do, but it has not been pushed upstream yet.=20
>=20
> John, I'd prefer
> http://viggo.jf.intel.com/~wifi/repos.git/?p=3Diwlwifi-2.6.git;a=3Dco=
mmit;h=3Dbc745eb7d28285f3b437c00253bf01ef501eb3f1=20
>=20
> Should we push it upstream asap or can it wait until our next series
> goes out after all our validation cycles pass?

I can't see that link.  How does the patch differ?

John
--=20
John W. Linville =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Someday the world will =
need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0might be all =
we have. =A0Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
