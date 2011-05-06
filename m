From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [next] net/mac80211/main.c:700: error: 'const struct ieee80211_ops'
 has no member named 'suspend'
Date: Fri, 6 May 2011 19:39:24 +0200
Message-ID: <BANLkTimMwXVHQtHtgukFvYKcWOuo=tv9ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52502 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305Ab1EFRj0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 May 2011 13:39:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes.berg@intel.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

http://kisskb.ellerman.id.au/kisskb/buildresult/4143029/

net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no
member named 'suspend'
net/mac80211/main.c:700: error: 'const struct ieee80211_ops' has no
member named 'resume'

The existence of these two members depends on CONFIG_PM.

=46unny, as both the members and these users were added in the same
commit eecc48000afe2ca6da22122d553b7cad294e42fc ("mac80211: add basic
support
for WoWLAN").

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
