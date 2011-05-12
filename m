From: Javier Cardona <javier@cozybit.com>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 11 May 2011 21:37:16 -0700
Message-ID: <BANLkTik+=yh3eq6Snp9SfC0xn--Deccefw@mail.gmail.com>
References: <20110512141019.72ccb7a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:64141 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181Ab1ELEhi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2011 00:37:38 -0400
In-Reply-To: <20110512141019.72ccb7a7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Wed, May 11, 2011 at 9:10 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi John,
>
> After merging the final tree, today's linux-next build (i386 defconfi=
g)
> failed like this:
>
> net/mac80211/cfg.c: In function 'sta_apply_parameters':
> net/mac80211/cfg.c:746: error: 'struct sta_info' has no member named =
'plink_state'

Sorry, I just saw this.  My apologies.  The fixup is valid but I'm
trying to understand why it is needed.
ieee80211_vif_is_mesh(&sdata->vif) compiles to 'false' when
CONFIG_MAC80211_MESH is not defined... wouldn't the compiler remove
that dead code? (Obviously it did not...)

Anyway, given that this is necessary, it's probably cleaner to extend
the #ifdef block to the entire body of the outer if as follows:

=46rom: Javier Cardona <javier@cozybit.com>
Date: Wed, 11 May 2011 21:30:17 -0700
Subject: [PATCH] mac80211: fixup access to conditionally defined struct=
 member

Signed-off-by: Javier Cardona <javier@cozybit.com>
---
 net/mac80211/cfg.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index a2ff474..d104c1e 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -738,6 +738,7 @@ static void sta_apply_parameters(struct
ieee80211_local *local,
                                                  &sta->sta.ht_cap);

        if (ieee80211_vif_is_mesh(&sdata->vif)) {
+#ifdef CONFIG_MAC80211_MESH
                if (sdata->u.mesh.security & IEEE80211_MESH_SEC_SECURED=
)
                        switch (params->plink_state) {
                        case PLINK_LISTEN:
@@ -759,6 +760,7 @@ static void sta_apply_parameters(struct
ieee80211_local *local,
                                break;
                        }
        }
+#endif
 }

 static int ieee80211_add_station(struct wiphy *wiphy, struct net_devic=
e *dev,
--=20
1.7.2.1


> Cause by commit 9c3990aaec0a ("nl80211: Let userspace drive the peer =
link
> management states"). =A0plink_state is only available in sta_info if
> CONFIG_MAC80211_MESH is set.
>
> I applied the following patch for today (which my not be correct).
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 12 May 2011 14:06:31 +1000
> Subject: [PATCH] nl80211: fix for reference to sta_info -> plink_stat=
e
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0net/mac80211/cfg.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index a2ff474..e090012 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -743,7 +743,9 @@ static void sta_apply_parameters(struct ieee80211=
_local *local,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PLINK_LISTEN:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PLINK_ESTAB:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case PLINK_BLOCKED:
> +#ifdef CONFIG_MAC80211_MESH
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sta->p=
link_state =3D params->plink_state;
> +#endif
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* =A0=
nothing =A0*/
> --
> 1.7.5.1
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Javier Cardona
cozybit Inc.
http://www.cozybit.com
