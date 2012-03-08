From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: drivers/gpio/gpio-sodaville.c breaks build
Date: Thu, 8 Mar 2012 09:52:54 -0700
Message-ID: <CACxGe6tfUFSEC6yDXif1LUJ3AyX_i_=SZj9DU93-eOLfuroMUw@mail.gmail.com>
References: <20120308164724.GA31129@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:34093 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756983Ab2CHQxQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 11:53:16 -0500
Received: by gghe5 with SMTP id e5so341872ggh.19
        for <linux-next@vger.kernel.org>; Thu, 08 Mar 2012 08:53:14 -0800 (PST)
In-Reply-To: <20120308164724.GA31129@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: bigeasy@linutronix.de, linux-next@vger.kernel.org, hjk@linutronix.de, torbenh@linutronix.de

On Thu, Mar 8, 2012 at 9:47 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The addition of this driver has caused a build failur in the
> i386 randconfig. =A0Perhaps it needs more Kconfig depends additions t=
o
> limit it to the platforms where hardware exists?
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/5819098/
>
> Paul.

No, it's a merge conflict due to an API change.  I'm working on the fix=
=2E

g.


--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
