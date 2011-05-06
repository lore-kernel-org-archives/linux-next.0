From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [next] net/mac80211/main.c:700: error: 'const struct
 ieee80211_ops' has no member named 'suspend'
Date: Fri, 6 May 2011 10:50:42 -0700
Message-ID: <20110506105042.b873a08e.randy.dunlap@oracle.com>
References: <BANLkTimMwXVHQtHtgukFvYKcWOuo=tv9ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTimMwXVHQtHtgukFvYKcWOuo=tv9ig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, 6 May 2011 19:39:24 +0200 Geert Uytterhoeven wrote:

> http://kisskb.ellerman.id.au/kisskb/buildresult/4143029/
> 
> net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no
> member named 'suspend'
> net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no
> member named 'resume'
> 
> The existence of these two members depends on CONFIG_PM.
> 
> Funny, as both the members and these users were added in the same
> commit eecc48000afe2ca6da22122d553b7cad294e42fc ("mac80211: add basic
> support
> for WoWLAN").

Patch is here:
http://marc.info/?l=linux-wireless&m=130463933324134&w=2

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
