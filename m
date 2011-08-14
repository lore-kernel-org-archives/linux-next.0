From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next blackfin builds
Date: Sun, 14 Aug 2011 13:31:00 -0400
Message-ID: <CAMjpGUcWaxdn2Zvr9OX3hfOjUswigrOM=VykLMy7=xk+z+qr4A@mail.gmail.com>
References: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
 <20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au>
 <CAMjpGUdfKH71_s+ANAbU++GJTMtKQFWMT5QBYOYU6hiAaJ_dig@mail.gmail.com> <20110812145005.25c6b9881382e2d7a6ccda08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:65388 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753355Ab1HNRbX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Aug 2011 13:31:23 -0400
Received: by bke11 with SMTP id 11so2585434bke.19
        for <linux-next@vger.kernel.org>; Sun, 14 Aug 2011 10:31:22 -0700 (PDT)
In-Reply-To: <20110812145005.25c6b9881382e2d7a6ccda08@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

On Fri, Aug 12, 2011 at 00:50, Stephen Rothwell wrote:
> On Thu, 11 Aug 2011 23:46:27 -0400 Mike Frysinger wrote:
>> ADI keep's prebuilt ones on the site:
>> https://blackfin.uclinux.org/gf/project/toolchain/frs
>
> cross compilers hosted on PowerPC? :-) =C2=A0Are there good build ins=
tructions
> somewhere?

i was building ones for ppc/ppc64 hosts, but no one was d/lin them, so
i didnt bother anymore

the toolchains posted there are based on sources obtained from the
blackfin.u.o website.  which is a recent release of the respect
upstream project with additional patches/fixes added on top.
http://docs.blackfin.uclinux.org/doku.php?id=3Ddeveloping:blackfin_live=
_sources
-mike
